itrs = 100000;ops = [];for i = 1:itrs  [p, q, opsCount] = AppEm(i);  ops = [ops, opsCount];
endfor
linear = [1:itrs] .* 0.65;plot(ops);  hold on;plot(linear);hold on;set(gca,'FontSize',20);hold off;