str = [];dig = [];for i = 1:1000  tic();  (123456 - 6) / 10;  str = [str, toc()];    tic();  floor(123456 / 10);  dig = [dig, toc()];  
 endfor      plot(str);  hold on;  plot(dig);  legend(legend({'first','second'},'Location','southwest'));  hold off;
