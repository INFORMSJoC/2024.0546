function z = loop_values(gra, w)
%payoffs of each unweighted network
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


