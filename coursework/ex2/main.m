
rabbitSpeed = 13;
foxSpeed = 16;

rabbitPos = [0, 0];
foxPos = [250, -550];
burrowPos = [600, 600];

warehouseNW = [200, 0];
warehouseSW = [200 -400];

[t, z] = ode45(@(t, z)modelODE(t, z, burrowPos, rabbitSpeed, foxSpeed, warehouseNW, warehouseSW), ...
                [0 400], [rabbitPos foxPos]);
    
##figure(1);    
plot(z(:,1), z(:,2))
hold on;
plot(z(:,3), z(:,4));
hold on;
plot(burrowPos(1), burrowPos(2), 'k*');
legend('Rabbit', 'Fox');
hold off;

##
##figure(2);
##
##plot(t, z(:,1), t, z(:,3));
