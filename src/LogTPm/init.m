function y = init()
% init: to search for the starting point of the homotopy path by solving the equations given by "u0.m" with the Matlab function fsolve.
% Input: none.
% Output: a 2L*1 vector y such that [y;0] is the starting point of the
% homotopy path.
global L Sigma M
opt1 = optimset('Display','off');
% y = fsolve(@(x) u0(x), Sigma ,opt1);
y = zeros(M,1);
for i = 1:L
    for j = 1:2
        y(2*i-2+j) = fsolve(@(x) u0(x,i,j), Sigma(2*i-2+j) ,opt1);
    end
end
