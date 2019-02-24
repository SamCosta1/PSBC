% Given a base 10 integer N, returns% an array of it's digitsfunction digitsVector = int2Digits(N)    digitsVector = [];  while (N != 0)     digitsVector = [mod(N, 10), digitsVector];    N = floor(N / 10);  end  
end
