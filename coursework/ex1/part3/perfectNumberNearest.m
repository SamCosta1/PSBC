function result = perfectNumberNearest(N)    closest = 11826;  minDiff = N - 11826^2;  for i = 11826:30384    square = i^2;        if (isPerfect(square))       diff = abs(N - square);      if (diff < minDiff)        closest = i;        minDiff =  diff;       endif    endif    
    endfor        result = closest;
endfunction