function sse = SSE(est,data)
sse = 0;
for i = 1:40
    T = i*0.25;
    fun = @(x) ((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3)).*((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3));
    q = integral(fun,0,T);
    sse = sse + (sqrt(q/T)-data(i))^2;
end