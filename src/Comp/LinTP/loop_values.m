function z = loop_values(gra, w)
% loop_values: to compute the payoff vectors in each possible network when assuming the agents
% are located on a circle
% input gra: a 2^L*L matrix recording all possible networks
% output: a 2^L*N matrix whose each row corresponds to the payoff vector
% of a unweighted network
    global G N d c 
    z = zeros(G,N);
    
    for i = 1:G
        temp = floyd(gra(i,:),N);
        for j = 1:N
            count = 0;
            for p = 1:N
                %number of links
                if temp(j,p) ~= 999
                    if temp(j,p) == 1
                        count = count + 1;
                    end
                    
                    z(i,j) = z(i,j) + d.^temp(j,p)*w(p);
                end  
            end
            z(i,j) = z(i,j) - count*c;
        end
    end


