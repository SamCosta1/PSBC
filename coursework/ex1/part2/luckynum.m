% LUCKYNUM Find the smallest lucky number % that is greater than or equal to Nfunction n = luckynum(N)  % Ensure we start from the first odd number greater  % than or equal to N  % i.e N, if N is odd, and N + 1 if even      current = N + 1 - rem(N, 2);    while(!isLucky(current))    current += 2;  end  n = current;end