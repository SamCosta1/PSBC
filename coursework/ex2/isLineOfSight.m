
function lineOfSight = isLineOfSight (pos1, pos2, warehouseNW, warehouseSW)

  diffPos = pos1 - pos2;

  % The gradient of the line passing through pos1 & pos2
  % therefore is diffPos(2) / diffPos(1)

  % The intersection between the fox's line of sight and the left wall's line
  intersectionLeftY = warehouseNW(1) * diffPos(2) / diffPos(1);

  % The intersection between the fox's line of sight and the bottom wall's line
  intersectionBottomY = warehouseSW(2) * diffPos(1) / diffPos(2)

  lineOfSight = intersectionLeftY > warehouseNW(2) && intersectionLeftY < warehouseNW(2) ...
    || warehouseSW(1) < intersectionBottomY;

endfunction
