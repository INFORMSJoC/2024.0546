function y = init(num,Link,target)
%search for the starting point of the homotopy path
global L Sigma m lin
opt1 = optimset('Display','off');
% y = fsolve(@(x) u0(x), Sigma ,opt1);
y = zeros(m,1);
for i = 1:num
    for j = 1:2
        y(2*i-2+j) = fsolve(@(x) u0(x,target(i),j,Link,Sigma(2*i-2+j)), Sigma(2*i-2+j) ,opt1);
    end
end