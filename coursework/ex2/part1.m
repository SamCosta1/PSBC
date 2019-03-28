warning('off', 'integrate_adaptive:unexpected_termination');

% Speeds in meters per second
rabbitSpeed = 13;
foxSpeed = 16;

% Coordinates in meters
rabbitPos = [0, 0];
foxPos = [250, -550];
burrowPos = [600, 600];

warehouseNW = [200, 0];
warehouseSW = [200 -400];

messages = {'the fox caught the rabbit.', 'the rabbit reached the burrow.'};
printSol = @(time, index) printf("\nAt time %f, %s\n\n", time, messages{index});

options = odeset('Events', @(t,z)stopEvent(t,z, burrowPos), 'MaxStep', 0.1);

[~, z, tEvent, ~, i1vent] = ode45(@(t, z) modelODE(t, z, burrowPos, ...
                                            rabbitSpeed, foxSpeed,...
                                            warehouseNW, warehouseSW), ...
                [0 300], [rabbitPos foxPos], options);
                

printSol(tEvent, iEvent);
plotScene(burrowPos, warehouseNW, warehouseSW, z, 1, "./report/simpleModel.eps");