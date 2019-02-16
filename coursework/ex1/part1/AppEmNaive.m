function [p, q] = AppEmNaive (N)
  emConstant = 0.577215664901533;

  if (N == 2)
    p = 1;
    q = 1;
    return;
  endif
    absDiff = @(value) abs(value - emConstant);

  currentBestDiff = 1;
  currentBestPQ = [0, 0];
    
  
  for p = 1:N   
   
    for q = 1:N
      
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
