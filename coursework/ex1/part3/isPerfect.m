function isPerfect = isPerfect(value)  digitsArr = int2Digits(value);    isPerfect = numel(digitsArr) == 9                 && !any(digitsArr == 0)                 && numel(unique(digitsArr)) == 9;  isPerfect;
endfunction
