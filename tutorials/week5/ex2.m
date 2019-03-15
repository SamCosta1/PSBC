% z = [x, xdot = y]
ep = 0.5;
myode = @(t,z) [z(2); -z(1)-ep*(z(1)^2-1)*z(2)]

[t, y] = ode45(myode, [0 50], [2 -2]);
plot(y(:,1), y(:,2));