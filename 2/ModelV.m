function modelv = ModelV(Psi,DF,FR,capv)
    out = zeros(10,10); %initialize outcome
    
    % fsi in terms of psi
    psi2 = Psi.^2;
    for i = 1:10
        sumpsi = sum(psi2(1:i));
        fsi(i) = sqrt(i*capv(i).^2./sumpsi);
    end
    
    for alpha = 1:10
        for beta = (alpha+1):(alpha+10) 
            % all w's (# is 10)
            w=zeros(beta-alpha,1);
            for i = (alpha+1):beta
                df = DF((alpha+1):beta);
                nom = DF(i);
                denom = sum(df);
                w(i-alpha) = nom./denom; % so the index begins by 1
            end
            
            % SwapRate
            S=0;
            for i = (alpha+1):beta
                S = S + FR(i)*w(i-alpha);
            end
            
            %v^2 Rebonato formula
            swapvol = 0;
            if beta <= 10
                for i = (alpha+1):beta
                    for j = (alpha+1) : beta
                        % first part
                        coef=w(i-alpha).*w(j-alpha).*FR(i).*FR(j).*exp(-abs(i-j))./(alpha.*S*S); %"alpha*S*S" has lower sse
                        %coef=w(i-alpha).*w(j-alpha).*FR(i).*FR(j).*exp(-abs(i-j))./(S*S);
                        % integral part
%                         fun = @(t)fsi(i).*Psi(i - ceil(t)+1).*fsi(j).*Psi(j - ceil(t)+1);
%                         format long
%                         intsig = integral(fun,0,alpha+1,'ArrayValued',true);
                       
                        % second part(discret)
                        intsig = 0;
                        for h = 0:alpha
                            intsig = intsig + fsi(i)*Psi(i-h) * fsi(j)*Psi(j-h);
                        end
                        
                        %Product of two parts
                        mv=intsig * coef;
                        swapvol=swapvol+mv;
                    end      
                end
            end
            out(alpha,beta-alpha) = sqrt(swapvol);
        end 
    end

    modelv = out;
    
end