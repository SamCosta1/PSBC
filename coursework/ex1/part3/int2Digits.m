function digitsVector = int2Digits(value)    digitsVector = [];  while (value != 0)     digitsVector = [mod(value, 10), digitsVector];    value = floor(value / 10);  endwhile  
endfunction
