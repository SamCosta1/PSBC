##str = [];##dig = [];##for i = 1:5000##  tic();##  isLucky(i);##  str = [str, toc()];##  ##  tic();##  isluckydavis(i);##  dig = [dig, toc()];##  
## endfor##  ##  ##  plot(str);##  hold on;##  plot(dig);##  legend(legend({'first','second'},'Location','southwest'));##  hold off;
for i = sqrt(100000000):sqrt(999999999)if isPerfect(i^2)iendifendfor