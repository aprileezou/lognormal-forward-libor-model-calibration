vol40 = data(1:40,2);
est = [1 1 1 1];
option = optimset('LargeScale','on','MaxIter',1000);
est = fmincon(@(est)SSE(est,vol40),est,[],[],[],[],[],[],[],option)
SSE(est,vol40)

for i = 1:40
    T = i*0.25;
    fun = @(x) ((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3)).*((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3));
    q = integral(fun,0,T);
    modelv(i) = sqrt(q/T);
end

plot(1:40,vol40)
hold on
plot(1:40,modelv)
hold off

legend('market','model')