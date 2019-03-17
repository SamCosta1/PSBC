
# Speeds in meters per second
rabbitSpeed = 13;
foxSpeed = 16;

# Coordinates in meters
rabbitPos = [0, 0];
foxPos = [250, -550];
burrowPos = [600, 600];

warehouseNW = [200, 0];
warehouseSW = [200 -400];

options = odeset('Events',@(t,z)stopEvent(t,z, burrowPos), 'RelTol',1e-5);
[t, z] = ode45(@(t, z)modelODE(t, z, burrowPos, rabbitSpeed, foxSpeed, warehouseNW, warehouseSW), ...
                [0 100], [rabbitPos foxPos], options);
    
figure(1);   
patch([warehouseSW(1) 800 800 warehouseSW(1)], [warehouseSW(2) warehouseSW(2) warehouseNW(2) warehouseNW(2)], 'g');
hold on; 
plot(z(:,1), z(:,2))
hold on;
plot(z(:,3), z(:,4));
hold on;
plot(burrowPos(1), burrowPos(2), 'k*');
legend('Warehouse', 'Rabbit', 'Fox');


d = 40
##axis([600-d 600+d 600-d 600+d]);
hold off;
##
##figure(2);
dist = sqrt((z(:,4) - z(:,2)) .^ 2 + (z(:,1) - z(:,3)) .^ 2);

##plot(t, dist);
##hold off;

##
##figure(2);
##
##plot(t, z(:,1), t, z(:,3));
