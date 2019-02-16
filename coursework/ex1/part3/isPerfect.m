function isPerfect = isPerfect(value)  digitsArr = int2Digits(value);    isPerfect = min(digitsArr) != 0 && numel(unique(digitsArr)) == 9;  isPerfect;
endfunction
