function y = value_ind(N,e,d,net,i)
%VALUE_IND payoff of a particular agent
    count = 0;
    temp = 0;
    for j = 1:N
        count = count + net(j);
        temp = temp + e(j)*net(j);
    end
    y = b(e(i)+temp) - d*count;
end

