
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

options = odeset('Events',@(t,z)stopEvent(t,z, burrowPos), 'MaxStep', 0.1, 'RelTol', 1e-6);

[tsimple, zsimple] = ode45(@(t, z)modelODE(t, z, burrowPos, rabbitSpeed, foxSpeed, warehouseNW, warehouseSW), ...
                [0 300], [rabbitPos foxPos], options);

[tcomplex, zcomplex] = ode45(@(t, z) complexModelODE(t, z, burrowPos, ...
                                       rabbitSpeed, foxSpeed, ...
                                       warehouseNW, warehouseSW, ...
                                       rabbitSpeedRate, foxSpeedRate), ...
                [0 300], [rabbitPos foxPos 0 0], options);
    

plotScene(burrowPos, warehouseNW, warehouseSW, zcomplex, 1);
plotScene(burrowPos, warehouseNW, warehouseSW, zsimple, 2);