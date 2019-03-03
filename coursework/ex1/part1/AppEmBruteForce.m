function [p, q] = AppEmBruteForce(N)
  emConstant = 0.577215664901533;

  currentBestDiff = 1;
  currentBestPQ = [0, 0];
  
  % Try every valid combination of p and q
  for q = 1:N   
    for p = 1:N   
     
      if (p + q > N) 
        continue;
      end
      
      diffToEM = abs(p / q - emConstant);

      if (diffToEM < currentBestDiff || 
          (diffToEM == currentBestDiff && p < currentBestPQ(1)))
        currentBestDiff = diffToEM;
        currentBestPQ = [p, q];        
      end
    
    end
  end
  
  p =  currentBestPQ(1);
  q =  currentBestPQ(2);

end
