
myode = @(x, y) 3*y/x + (x^5)/(2*y + x^3)

[x,y] = ode45(myode, [1,10],0);
plot(x,y, '*', x, ((sqrt(1+4*log(x))-1) / 2).*x.^3);