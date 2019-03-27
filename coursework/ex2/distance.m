% Distance between two points P1 and P2
function dist = distance(p1, p2) 
  dist = sqrt(sum((p2 - p1) .^ 2));
endfunction
