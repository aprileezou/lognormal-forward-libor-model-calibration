swapM=swap/100;
DF = data(1:30,4);
vol10 = data(1:10,1);
FR = data(1:30,3);
for i= 1:10
    for j = 1:10
        if i + j > 10 
            swapM(i,j) = 0;
        end
    end
end
capv = vol10;
fun = @(Psi) SSE2(Psi, capv,swapM, DF, FR);
Psi0 = ones(10,1)*0.5;
options = optimset('LargeScale','off','MaxFunEvals',10000,'MaxIter',1000);
out_psi = fmincon(fun,Psi0,[],[],[],[],[],[],[],options)
modelsse=SSE2(out_psi, capv,swapM, DF, FR)
modelresult=ModelV(out_psi,DF,FR,capv)

xxx=[1,2,3,4,5,6,7,8,9,10];
yyy=[1;2;3;4;5;6;7;8;9;10];
z1=modelresult;
z2=swapM;
surf(xxx,yyy,z1)
hold on
surf(xxx,yyy,z2)
