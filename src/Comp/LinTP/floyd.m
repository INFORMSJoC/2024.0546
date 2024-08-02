function z = floyd(graph,N)
%the Floyd algorithm

        z = 999*ones(N,N);
        for j = 1:N-1
            if graph(j) == 1
                z(j,j+1) = 1;
                z(j+1,j) = 1;
            end
        end
        if graph(N) == 1
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

