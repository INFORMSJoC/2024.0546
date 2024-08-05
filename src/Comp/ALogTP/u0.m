function z = u0(x,i,j,Link,sigma)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明
global pri d e N M lin L eta
    player = lin(i,j);
    net = insert(pri,Link);
    net1 = zeros(N,N);
    for k = 1:L
        net1(lin(k,1),lin(k,2)) = net(k);
        net1(lin(k,2),lin(k,1)) = net(k);
    end
    temp = e(player);
    for k = 1:N
        if k ~= lin(i,3-j)
            temp = temp + net1(player,k)*e(k);
        else
            temp = temp + x*e(k);
        end
    end
    y = db(temp)*e(lin(i,3-j)) - d;

    z = y+sigma*eta/x - (1-sigma)*eta/(1-x);
end