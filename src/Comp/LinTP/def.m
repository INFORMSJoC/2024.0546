function z = def(x)
%partial deriative of the utilities
    global L lin G gra Va
    z = zeros(2*L,1);
    for i = 1:L
        pro = prob(x,i);
        for k = 1:G
            g = gra(k,:);
            z(2*i-1) = z(2*i-1) + (2*g(i)-1)*Va(k,lin(i,1))*pro(k);
            z(2*i) = z(2*i) + (2*g(i)-1)*Va(k,lin(i,2))*pro(k);
        end 
    end
end
