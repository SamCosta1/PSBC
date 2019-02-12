function result = perfectNumberNearest(N, lowerBound, upperBound)    closest = lowerBound;  minDiff = N - lowerBound^2;  for i = lowerBound:upperBound    square = i^2;        if (isPerfect(square))       diff = abs(N - square);      if (diff < minDiff)        closest = i;        minDiff =  diff;       endif    endif    
    endfor        result = closest;
endfunction