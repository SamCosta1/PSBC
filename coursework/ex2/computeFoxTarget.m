function foxTarget = computeFoxTarget(rabbitPos, foxPos, warehouseNW, warehouseSW)  Y = 2; # index of y coordinate  X = 1; # index of x coordinate    if (isLineOfSight(foxPos, rabbitPos, warehouseNW, warehouseSW))    foxTarget = rabbitPos;    return;  end  if (foxPos(Y) < warehouseSW(Y))          foxTarget = warehouseSW;  elseif (foxPos(Y) > warehouseNW(Y))      foxTarget = warehouseNW;  elseif (distance(rabbitPos, warehouseNW) < distance(rabbitPos, warehouseSW))    foxTarget = warehouseNW;  else    foxTarget = warehouseSW;  endif end