
# Speeds in meters per second
rabbitSpeed = 13;
foxSpeed = 16;

# Coordinates in meters
rabbitPos = [0, 0];
foxPos = [250, -550];
burrowPos = [600, 600];

warehouseNW = [200, 0];
warehouseSW = [200 -400];

# the rates of diminishing speeds
foxSpeedRate = 2e-4;
rabbitSpeedRate = 7e-4;

options = odeset('Events',@(t,z)stopEvent(t,z, burrowPos), 'RelTol',1e-6);

[tsimple, zsimple] = ode45(@(t, z)modelODE(t, z, burrowPos, rabbitSpeed, foxSpeed, warehouseNW, warehouseSW), ...
                [0 300], [rabbitPos foxPos], options);

[tcomplex, zcomplex] = ode45(@(t, z) complexModelODE(t, z, burrowPos, ...
                                       rabbitSpeed, foxSpeed, ...
                                       warehouseNW, warehouseSW, ...
                                       rabbitSpeedRate, foxSpeedRate), ...
                [0 300], [rabbitPos foxPos 0 0], options);
    
figure(1);   
patch([warehouseSW(1) 900 900 warehouseSW(1)], [warehouseSW(2) warehouseSW(2) warehouseNW(2) warehouseNW(2)], 'g', 'LineStyle', 'none');
hold on; 
plot(zsimple(:,1), zsimple(:,2))
hold on;
plot(zsimple(:,3), zsimple(:,4), 'LineWidth', 1.8);
hold on;
plot(zcomplex(:,1), zcomplex(:,2))
hold on;
plot(zcomplex(:,3), zcomplex(:,4), 'LineWidth', 1.8);
hold on;
plot(burrowPos(1), burrowPos(2), 'k*');
hold on;
##
##for row = z'
##  line = isLineOfSight([row(3) row(4)], [row(1) row(2)], warehouseNW, warehouseSW);
##  
##  if line 
##    plot([row(1) row(3)], [row(2) row(4)], 'y');
##  else
##    plot([row(1) row(3)], [row(2) row(4)], 'k');
##  endif
##  
##  hold on;
##endfor
##






legend({'Warehouse', 'Rabbit Simple', 'Fox', 'Rabbit Complex', 'Fox Complex'}, 'Location', 'NorthWest');
hold off;
##
##d = 40
####axis([600-d 600+d 600-d 600+d]);
##hold off;
####
figure(2);
dist = @(z) sqrt((z(:,4) - z(:,2)) .^ 2 + (z(:,1) - z(:,3)) .^ 2);
dist(zcomplex)
plot(tsimple, dist(zsimple), tcomplex, dist(zcomplex));
legend('Simple', 'Complex');
hold off;
##
####
####figure(2);
####
####plot(t, z(:,1), t, z(:,3));
