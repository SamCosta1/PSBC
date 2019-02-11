%% Question bla
a = rand(11)

x = [1:11]'

inverseA = inv(a)

b = a*x
xx = inverseA*b


xx-x 

%% Question bla + 1

A = [3/2, 1/2; -1/2, 1/2]
A^-1

%% Question bla + 2
A = magic(3)
diag(A)
a = [1 2 3]
diag(a)