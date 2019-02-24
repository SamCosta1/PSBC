% Checks whether the square of a given number contains% all nine digits exactly oncefunction [isPerfect, square] = isPerfect(value)  square = value ^ 2;  digitsArr = int2Digits(square);    isPerfect = numel(digitsArr) == 9 ...                && !any(digitsArr == 0) ...                && numel(unique(digitsArr)) == 9;
endfunction
