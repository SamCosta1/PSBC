
rabbitSpeed = 13;
foxSpeed = 16;

rabbitPos = [0, 0];
foxPos = [250, -550];
burrowPos = [600 600];

warehouseNW = [200, 0];
warehouseSW = [200 -400];

[t, z] = ode45(@(t, z)modelODE(t, z, burrowPos, rabbitSpeed, foxSpeed, warehouseNW, warehouseSW), ...
                [0 40], [rabbitPos foxPos]);
                
plot(z(:,1), z(:,2), z(:,3), z(:,4));
