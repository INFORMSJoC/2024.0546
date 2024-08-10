function z = floyd(net,N)
% Floyd algorithm
% input: net: a network in [0,1]^L, N: number of players
% output: a N*N matrix whose (i,j)-th element represents the shortest
% distance between agent i and j in the network net
        z = 999*ones(N,N);
        for j = 1:N-1
            if net(j) == 1
                z(j,j+1) = 1;
                z(j+1,j) = 1;
            end
        end
        if net(N) == 1
            z(1,N) = 1;
            z(N,1) = 1;
        end
        

        for j=2:N
            for m = 1:N
                for n = 1:N
                    if m ~= n
                        if z(m,n) > z(m,j) + z(j,n)
                            z(m,n) = z(m,j)+ z(j,n);
                        end
                    end
                end
            end
        end
        for m = 1:N
            for n = 1:N
                if m ~= n
                    if z(m,n) > z(m,1) + z(1,n)
                        z(m,n) = z(m,1)+ z(1,n);
                    end
                end
            end
        end
end

