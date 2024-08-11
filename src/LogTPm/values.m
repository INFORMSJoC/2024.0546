function D = values(gra)
% values: to compute the payoff vectors in each possible network.
% Input: gra, a 2^L*L matrix recording all possible networks.
% Output: a 2^L*N matrix whose each row corresponds to a payoff vector.
% of a unweighted network
    global G N c L lin
    D = zeros(G,N);
    
    for i = 1:G
        invest = zeros(1,N);
        str = zeros(N,N);
        for j = 1:L
            invest(lin(j,1)) = invest(lin(j,1)) + gra(i,j);
            invest(lin(j,2)) = invest(lin(j,2)) + gra(i,j);
            str(lin(j,1),lin(j,2)) = gra(i,j);
            str(lin(j,2),lin(j,1)) = gra(i,j);
        end
        
        for j = 1:N
            temp = 0;
            for k = 1:N
                if str(j,k) == 1 && j~= k && invest(k) ~= 0
                    temp = temp + 1/invest(k);
                end
            end
            
            if invest(j) ~= 0
                D(i,j) = temp -c*invest(j);
            end
            
        end
    end


