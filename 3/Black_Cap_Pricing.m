function cap_bl = Black_Cap_Pricing(this_cap,sigma) %N,tau,P,F,K,T_iM1
caplet=zeros(length(this_cap(:,1)),1);
for i = 1:length(this_cap(:,1))
    caplet(i) = blsprice(this_cap(i,4),this_cap(i,5),0,this_cap(i,6),sigma); %using bs
end
caplet = this_cap(:,1).*this_cap(:,2).*this_cap(:,3).*caplet;
cap_bl = sum(caplet);
end