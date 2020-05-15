function [ caplet_price ] = Black_Caplet_Pricing(this_caplet,sigma) %notion,tau,P_Ti,F,K,T_iminus1
caplet_price = this_caplet(1)*this_caplet(2)*this_caplet(3)*blsprice(this_caplet(4),this_caplet(5),0,this_caplet(6),sigma); 
end

