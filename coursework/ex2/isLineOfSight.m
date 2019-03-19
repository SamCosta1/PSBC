
function lineOfSight = isLineOfSight (pos1, pos2, warehouseNW, warehouseSW)

  Y = 2; # index of y in pos
  X = 1; # index of x in pos

  bothSameRegion = pos1(Y) > warehouseNW(Y) && pos2(Y) > warehouseNW(Y) ... # Both above warehouse
                || pos1(X) < warehouseNW(X) && pos2(X) < warehouseNW(X) ... # Both to the left
                || pos1(Y) < warehouseSW(Y) && pos2(Y) < warehouseSW(Y);
                
  if bothSameRegion
    lineOfSight = true;
    return;
  endif
  
  
  gradient = (pos2(Y) - pos1(Y)) / (pos2(X) - pos1(X));
  
  intersectsBottom = ((warehouseSW(Y) - pos2(Y)) / gradient) + pos2(X) > warehouseSW(X);
  
  intesectionWithLeftY = gradient*(warehouseNW(X) - pos1(X)) + pos1(Y);
  intersectsLeft = intesectionWithLeftY < warehouseNW(Y) && intesectionWithLeftY > warehouseSW(Y);
  
  lineOfSight = !intersectsLeft && !intersectsBottom;


endfunction
