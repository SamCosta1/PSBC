function [p, q] = AppEm (N)
  emConstant = 0.577215664901533;
  absDiff = @(value) abs(value - emConstant);


  currentBestDiff = intmax;
  currentBestPQ = [0, 0];
  
  for p = 1:N
    lowerBound = ceil(5*p/3);
    upperBound = min(2*p, N) - 1;
    for q = lowerBound:upperBound
      
      if (p + q > N) 
        continue;
      endif
      approximation = p / q;
     
      diffToEM = absDiff(approximation);

      if (diffToEM < currentBestDiff)
        currentBestDiff = diffToEM;
        currentBestPQ = [p, q];
      endif
      
    endfor
  endfor
  
  p =  currentBestPQ(1);
  q =  currentBestPQ(2);


endfunction
