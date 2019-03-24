% For an entity directed at a target with a given speed
% return the x and y components of it's velocity
function velocity = computeVelocity(speed, pos, target)
  Y = 2; # index of y in pos
  X = 1; # index of x in pos
  dist = distance(pos, target);
  velocity = speed .* ((target - pos) ./ dist);
end
