function [p, q, opsCount] = AppEm (N)
  emConstant = 0.577215664901533;
  opsCount = 0;
  
  % Check for the trivial case early to allow assumptions to be made later
  if (N <= 2)
    p = N - 1;
    q = 1;
    return;
  endif
  
  % Helper function forgiving the difference between any value and the emConstant  absDiff = @(value) abs(value - emConstant);

  % Since we've dealt with the trivial case of N = 1,2. The first value value of p/q 
  % will always be 1/2, we don't waste time calculating it but use it as the initial value
  currentBestDiff = absDiff(1 / 2);
  currentBestPQ = [1, 2];
    
  % Start q off as 3 since we already accounted for q = 1, 2
  q = 3;
  qMax = N;

  while (q < qMax)

    % Limit the values of p that we check to only those that could be closer to
    % the emConstant than our current best
    pMax = min(floor(q * (emConstant + currentBestDiff)), N - q);
    pMin = ceil(q * (emConstant - currentBestDiff));

    opsCount = opsCount + 1;
    for p = pMin:pMax

      diffToEM = absDiff(p / q);

      % Check if this approximation is better than the last one
      if (diffToEM < currentBestDiff)
        currentBestDiff = diffToEM;
        currentBestPQ = [p, q];     
        
        % Recalculate the maximal value of q
        qMax = ceil(N / (emConstant - currentBestDiff + 1))
      endif

      opsCount = opsCount + 1;
    endfor

    q = q + 1;

  endwhile
  
  p =  currentBestPQ(1);
  q =  currentBestPQ(2);

endfunction


