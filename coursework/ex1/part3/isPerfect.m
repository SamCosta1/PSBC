% Checks whether the square of a given number contains% all nine digits exactly oncefunction isPerfect = isPerfect(value)  digitsArr = int2Digits(value ^2);    isPerfect = numel(digitsArr) == 9 ...                && !any(digitsArr == 0) ...                && numel(unique(digitsArr)) == 9;
end
