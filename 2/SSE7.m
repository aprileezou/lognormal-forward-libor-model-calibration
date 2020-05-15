function sse7 = SSE7(est,marketV,fsi)
sse7 = 0;
for i = 1:10
    T=i;
    fun = @(x) ((fsi(i).*((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3))).*(fsi(i).*((est(1).*(T-x)+est(4)).*exp(-est(2).*(T-x))+est(3))));
    q = integral(fun,0,T);
    sse7 = sse7 + (sqrt(q/T)-marketV(i))^2;
end
end