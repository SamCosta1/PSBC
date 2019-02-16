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

  % Since we're not in the trivial case of N = 2. The first value of the best diff
  % will always be 1/2, we don't waste time calculating it but use it as the initial value
  currentBestDiff = absDiff(1, 2);
  currentBestPQ = [1, 2];
    
  % Start q off as 2 since we already accounted for q = 1
  q = 2;
  qMax = ceil(2*N / 3);

  while (q < qMax)

    % Limit the values of p that we check to only those that could be closer to
    % the emConstant than our currsent best
    pMax = min(floor(q * (emConstant + currentBestDiff)), N - q);
    pMin = ceil(q * (emConstant - currentBestDiff));

    opsCount = opsCount + 1;
    for p = pMin:pMax
      approximation = p / q;

      diffToEM = absDiff(approximation);

      % Check if this approximation is better than the last one
      if (diffToEM < currentBestDiff)
        currentBestDiff = diffToEM;
        currentBestPQ = [p, q];     
        
        % Recalculate the maximal value of q
        qMax = ceil(N / (emConstant - currentBestDiff + 1));
      endif

      opsCount = opsCount + 1;
    endfor

    q = q + 1;

  endwhile
  
  p =  currentBestPQ(1);
  q =  currentBestPQ(2);

endfunction


