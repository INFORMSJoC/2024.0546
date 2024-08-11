function z = def(s,x)
% def: to compute the partial derivatives of the utility functions with respect to
% a given network.
% Input: s in [0,1]^{2L}, the vector of favorite strengths; x in [0,1]^L, a given network.
% Output: a N*N whose (i,j) and (j,i)-th element represents the partial derivatives
% of agent i's and j's utility function with respect to link ij, respectively.
global d e N lin L
    z = zeros(N,N); % record the partial deriative 
    net = zeros(N,N);
    for i = 1:L
        net(lin(i,1),lin(i,2)) = x(i);
        net(lin(i,2),lin(i,1)) = x(i);
    end

    for i = 1:L
        for j=1:2
        player = lin(i,j); 
        temp = e(player);
        for k = 1:N
            if k ~= lin(i,3-j)
                temp = temp + net(player,k)*e(k);
            else
                temp = temp + s(2*i-2+j)*e(k);
            end
        end
        z(lin(i,j),lin(i,3-j)) = db(temp)*e(lin(i,3-j)) - d;
        end
    end
end
