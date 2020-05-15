vol10 = data(1:10,1);
x(1) = vol10(1)^2;
for i = 2:10
    x(i) = i*vol10(i)^2 - (i-1)*vol10(i-1)^2;
end
x
