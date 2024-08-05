function y = dvalue(N,e,d,net,i,j,lin)
%DVALUE the difference of payoff functions
    str = zeros(N,N);
    for k = 1:N*(N-1)/2
        str(lin(k,1),lin(k,2)) = net(k);
        str(lin(k,2),lin(k,1)) = net(k);
    end
    
    temp = 0;
    str(i,j) = 0;
    str(j,i) = 0;
    for k = 1:N
        temp = temp + e(k)*str(i,k);
    end
    y = b(e(i)+temp+e(j)) -b(e(i)+temp) - d;
end

