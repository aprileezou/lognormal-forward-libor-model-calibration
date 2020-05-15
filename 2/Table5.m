Psi = out_psi;
psi2 = Psi.^2;
for i = 1:10
    sumpsi = sum(psi2(1:i));
    Fsi(i) = sqrt(i*capv(i).^2./sumpsi);
end
table5 = zeros(10,10);
for i = 1:10
    for j = 1:i
        table5(i,j) = Psi(i)*Fsi(i-j+1);
    end
end
Fsi
Psi
table5