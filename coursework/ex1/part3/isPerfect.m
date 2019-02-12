function isPerfect = isPerfect(value)  digitsArr = int2Digits(value);    isPerfect = true;  for digit=1:numel(digitsArr)    if (digit == 0)      isPerfect = false;      break;    endif  endfor    if (numel(digitsArr) != numel(unique(digitsArr)))     isPerfect = false;  endif    isPerfect;
endfunction
