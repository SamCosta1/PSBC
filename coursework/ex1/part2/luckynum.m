function n = luckynum(N)    isEven = @(value) mod(value, 2) == 0;  start = N;  if (isEven(N))    start = N + 1;
  endif        
  found = false;  current = start;  while(!found)        if (isLucky(current))      found = true;    else      current += 2;    endif  endwhile  n = currentendfunction