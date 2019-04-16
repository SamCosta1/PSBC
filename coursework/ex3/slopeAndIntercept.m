function [slope, intercept] = slopeAndIntercept(x, y)    A = [sum(x.^2) sum(x);...       sum(x)    numel(x)];  lambda = [sum(x .* y); sum(y)];    solved = A \ lambda;  slope = solved(1);  intercept = solved(2);
end
