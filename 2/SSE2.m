function sse2 = SSE2(Psi, capv, swapM, DF,FR)
    sse2 = sum(sum((ModelV(Psi,DF,FR,capv)-swapM).^2));
end