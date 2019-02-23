function [p, q] = AppEmBruteForce(N)
  emConstant = 0.577215664901533;

  currentBestDiff = 1;
  currentBestPQ = [0, 0];
  
  % Try every valid combination of p and q
  for q = 1:N   
    % Bound p by N - q so that p + q <= N
    for p = 1:N-q    
     
      diffToEM = abs(p / q - emConstant);

      if (diffToEM < currentBestDiff)
        currentBestDiff = diffToEM;
        currentBestPQ = [p, q];        
      end
    
    end
  end
  
  p =  currentBestPQ(1);
  q =  currentBestPQ(2);

end
