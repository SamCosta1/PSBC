str = [];dig = [];for i = 1:1000  tic();  a = int2Digits(01124267495827985275);  a(1) == 0;  str = [str, toc()];    tic();  b= num2str(01124267495827985275);  b(1) == '0';  dig = [dig, toc()];  
 endfor      plot(str);  hold on;  plot(dig);  legend(legend({'first','second'},'Location','southwest'));  hold off;
