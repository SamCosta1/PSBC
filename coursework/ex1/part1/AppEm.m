function [p, q] = AppEm (N)
  emConstant = 0.577215664901533;

  % Check for the trivial case early to allow assumptions to be made later
  if (N == 2)
    p = 1;
    q = 1;
    return;
  endif
  
  % Helper function forgiving the difference between any value and the emConstant  absDiff = @(value) abs(value - emConstant);

  % Since we're not in the trivial case of N = 2. The first value of the best diff
  % will always be 1/2, we don't waste time calculating it but use it as the initial value
  currentBestDiff = absDiff(1, 2);
  currentBestPQ = [1, 2];
    
  % Start q off as 2 since we already accounted for q = 1
  for q = 2:ceil(2*N / 3)
 
     pMax = min(floor(q * (emConstant + currentBestDiff)), N - q);
     pMin = ceil(q * (emConstant - currentBestDiff));

    for p = pMin:pMax
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
