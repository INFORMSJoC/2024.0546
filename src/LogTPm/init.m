function y = init()
% init: to search for the starting point of the homotopy path
% Input: none
% output: a 2L*1 vector y such that [y;0] is the starting point of the
% homotopy path
global L Sigma M
opt1 = optimset('Display','off');
% y = fsolve(@(x) u0(x), Sigma ,opt1);
y = zeros(M,1);
for i = 1:L
    for j = 1:2
        y(2*i-2+j) = fsolve(@(x) u0(x,i,j), Sigma(2*i-2+j) ,opt1);
    end
end