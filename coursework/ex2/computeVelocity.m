% For an entity directed at a target with a given speed
% return the x and y components of it's velocity
function velocity = computeVelocity(speed, pos, target)
  dist = distance(pos, target);
  velocity = speed .* ((target - pos) ./ dist);
end
