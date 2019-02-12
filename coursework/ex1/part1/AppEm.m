function [p, q] = AppEm (N)
  emConstant = 0.577215664901533;

  if (N == 2)
    p = 1;
    q = 1;
    return;
  endif
    absDiff = @(value) abs(value - emConstant);

  currentBestDiff = 1;
  currentBestPQ = [0, 0];
    
  totCount = 0;
  updates = 0;
  for p = 1:N
    
    if (p == 1) 
      qMin = 1
      qMax = N
    else
      qMin = ceil(p / (emConstant + currentBestDiff));
      qMax = min(floor(p / (emConstant - currentBestDiff)), N - p);
    endif

    for q = qMin:qMax
      totCount = totCount + 1;
      approximation = p / q;
     
      diffToEM = absDiff(approximation);

      if (diffToEM <= currentBestDiff)
        
        if (diffToEM < currentBestDiff || p + q < sum(currentBestPQ))
          updates = updates + 1;
          
          currentBestDiff = diffToEM;
          currentBestPQ = [p, q];
          
        endif
      endif
      
    endfor
  endfor
  
  p =  currentBestPQ(1);
  q =  currentBestPQ(2);


  totCount
  updates
endfunction
