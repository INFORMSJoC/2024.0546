function y = value(N,L,e,d,net,lin)
%  payoff vector
    y = zeros(1,N);
    direct_con = zeros(1,N);
    count = zeros(1,N);
    for i = 1:L
        if net(i) == 1
            direct_con(lin(i,1)) = direct_con(lin(i,1)) + e(lin(i,1));
            direct_con(lin(i,2)) = direct_con(lin(i,2)) + e(lin(i,2));
            count(lin(i,1)) = count(lin(i,1))+1;
            count(lin(i,2)) = count(lin(i,2))+1;
        end
    end
    for i = 1:N
        y(i) = b(e(i) + direct_con(i)) - d* count(i);
    end
end