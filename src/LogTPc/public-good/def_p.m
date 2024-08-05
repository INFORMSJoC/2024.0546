function z = def_p(x)
%decision under prior p
global pri d e N M lin L
    z = zeros(2*L,1); % record the partial deriative 
    net = zeros(N,N);
    for i = 1:L
        net(lin(i,1),lin(i,2)) = pri(i);
        net(lin(i,2),lin(i,1)) = pri(i);
    end

    for i = 1:L
        for j=1:2
        player = lin(i,j); 
        temp = e(player);
        for k = 1:N
            if k ~= lin(i,3-j)
                temp = temp + net(player,k)*e(k);
            else
                temp = temp + x(2*i-2+j)*e(k);
            end
        end
        z(2*i-2+j) = db(temp)*e(lin(i,3-j)) - d;
        end
    end
end
