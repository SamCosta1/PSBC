function [p, q] = AppEm (N)
  emConstant = 0.577215664901533;

  if (N == 2)
    p = 1;
    q = 1;
    return;
  endif
    absDiff = @(value) abs(value - emConstant);

  currentBestDiff = intmax;
  currentBestPQ = [0, 0];
  
  for p = 1:N
    lowerBound = ceil(5*p/3);
    upperBound = min(2*p, N - p);
    
    for q = lowerBound:upperBound
      approximation = p / q;
     
      diffToEM = absDiff(approximation);

      if (diffToEM <= currentBestDiff)
        
        if (diffToEM < currentBestDiff || p + q < sum(currentBestPQ))
          currentBestDiff = diffToEM;
          currentBestPQ = [p, q];
        endif
      endif
      
    endfor
  endfor
  
  p =  currentBestPQ(1);
  q =  currentBestPQ(2);


endfunction
