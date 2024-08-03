function z = u0(x,i,j)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明
global pri d e N M lin L Sigma eta
    player = lin(i,j);
    for k = 1:L
        net(lin(k,1),lin(k,2)) = pri(k);
        net(lin(k,2),lin(k,1)) = pri(k);
    end
    temp = e(player);
    for k = 1:N
        if k ~= lin(i,3-j)
            temp = temp + net(player,k)*e(k);
        else
            temp = temp + x*e(k);
        end
    end
    y = db(temp)*e(lin(i,3-j)) - d;

    z = y+Sigma(2*i-2+j)*eta/x - (1-Sigma(2*i-2+j))*eta/(1-x);
end