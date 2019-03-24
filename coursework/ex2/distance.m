% Distance between two points P1 and P2
function dist = distance(p1, p2) 
  Y = 2; # index of y in pos
  X = 1; # index of x in pos
  
  dist = sqrt((p1(Y) - p2(Y)) ^ 2 + (p1(X) - p2(X))^2);
endfunction
