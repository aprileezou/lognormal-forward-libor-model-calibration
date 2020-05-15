caplet_vol = zeros(10,1);
cap_vol = cap_vol/100;
capdata(:,4)=capdata(:,4)/100;

for i = 1:10
    this_cap = capdata(1:4*i,:); %cap_data: data 
    cap_price = Black_Cap_Pricing(this_cap,cap_vol(i)); %BlackCap: function(strike, ATM vol)
    s = size(this_cap);
    s = s(1);
    sol = 0;
    
    syms x
    for j = 1:s
        this_caplet = this_cap(j,:);
        if (s-j) < 4
            this_caplet_price = Black_Caplet_Pricing(this_caplet,x); %BlackCaplet: function
        else 
            this_caplet_price = Black_Caplet_Pricing(this_caplet,caplet_vol(ceil(j/4)));
        end
        sol = sol + this_caplet_price;
    end
    x = vpasolve(sol == cap_price);
  
    caplet_vol(i) = x;
    
end