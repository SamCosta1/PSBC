
# Speeds in meters per second
rabbitSpeed = 13;
foxSpeed = 16;

# Coordinates in meters
rabbitPos = [0, -400];
foxPos = [250, 150];
burrowPos = [600, -1e3];

warehouseNW = [200, 0];
warehouseSW = [200 -400];

# The rates of diminishing speeds
foxSpeedRate = 2e-4;
rabbitSpeedRate = 7e-4;

options = odeset('Events', @(t,z)stopEvent(t,z, burrowPos), 'MaxStep', 0.1);

messages = {'The fox caught the rabbit', 'The rabbit reached the burrow'};
printSol = @(time, index) printf("\nAt %f, %s\n\n", time, messages{index});

warning('off', 'integrate_adaptive:unexpected_termination');
[~, zsimple, t1Event, ~, i1Event] = ode45(@(t, z) modelODE(t, z, burrowPos, ...
                                            rabbitSpeed, foxSpeed,...
                                            warehouseNW, warehouseSW), ...
                [0 300], [rabbitPos foxPos], options);
                

printSol(t1Event, i1Event);
[~, zcomplex, t2Event, ~, i2Event] = ode45(@(t, z) complexModelODE(t, z, burrowPos, ...
                                       rabbitSpeed, foxSpeed, ...
                                       warehouseNW, warehouseSW, ...
                                       rabbitSpeedRate, foxSpeedRate), ...
                [0 300], [rabbitPos foxPos 0 0], options);
    
printSol(t2Event, i2Event);
##plotScene(burrowPos, warehouseNW, warehouseSW, zcomplex, 1);
##plotScene(burrowPos, warehouseNW, warehouseSW, zsimple, 2);