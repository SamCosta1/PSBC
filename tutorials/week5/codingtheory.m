
##a =  [0 0 1] ... 1
##   + [1 0 0] ... w2
##   + [1 1 0] ... w4
##   + [1 0 0] ... w9
##   + [1 0 0] ... w16
##   + [1 1 0] ... w25
##   + [0 1 0] ... w36
##   + [0 0 1] ... w 49

ws = [0 1 0;...
      1 0 0; ...
      0 1 1; ...
      1 1 0;...
      1 1 1;...
      1 0 1] 

tot = [0 0 1]
i = 1;
while(i < 100)
   
  power = mod(i,7);
  add = [0 0 1];
  if (power != 0)
    add = ws(power,:);
  endif
  tot = mod(tot + add, 2);
  

  i = i+1;
  
  
    if sum(tot) == 0
    i
  endif
  
endwhile
i