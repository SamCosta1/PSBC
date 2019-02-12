isEven = @(value) mod(value, 2) == 0;N = 10;start = N;if (isEven(N))  start = N + 1;
endif    
found = false;current = start;while(!found)    if (isLucky(current))    found = true;  else    current += 2;  endifendwhiledisp(current);