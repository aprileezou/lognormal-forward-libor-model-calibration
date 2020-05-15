est = [1 1 1 1];
option = optimset('LargeScale','on','MaxIter',1000);
est = fmincon(@(est)SSE7(est,vol10,Fsi),est,[],[],[],[],[],[],[],option)
SSE7(est,vol10,Fsi)
for i = 1:10
    T=i;
    fun = @(x) ((Fsi(i).*((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3))).*(Fsi(i).*((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3))));
    q = integral(fun,0,T);
    modelv2(i)=sqrt(q/T);
end
plot(1:10,vol10)
hold on
plot(1:10,modelv2)
hold off
legend('Market','Model')


