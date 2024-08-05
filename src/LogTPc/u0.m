function z = u0(x,i,j)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明
global pri N lin L Sigma eta alpha
    net = zeros(N,N);
  
    temp = pri;
    temp(i) = x;
    for k = 1:L
        net(lin(k,1),lin(k,2)) = temp(k);
        net(lin(k,2),lin(k,1)) = temp(k);
    end
    A = zeros(1,N);
    B = 0;
    for k = 1:N
        A(k) = alpha(k) + sum(net(k,:));
        B = B+log(A(k));
    end

    y = 1/(B*A(lin(i,j))) - (log(A(lin(i,j)))*(1/A(lin(i,j))+1/A(lin(i,3-j))))/(B^2);

    z = y + Sigma(2*i-2+j)*eta/x - (1-Sigma(2*i-2+j))*eta/(1-x);
end