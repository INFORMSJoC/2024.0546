function [M,D] = robust_links(N,e,d)
% robust_links: to figure out the robust link
% Input: N, number of players; other parameters in the model. Take the public provision model of Bramoull´e and
% Kranton (2007) as an example. (in Section 5.4 of our paper) e, the effort
% vector; d > 0, cost for links.
% Output: two N × N matrices M and D. A link ij is surely to be absent if
% Mij = 0 or Mji = 0. This link is sure to be established if Dij = 0 and Dji = 0.

    M =ones(N,N); %robustly absent links
    D= zeros(N,N); %robustly potential links

    ran_gra = graphs(N-2); %the local structure of the networks near a particular node
    for i = 1:N
        for j = 1:N
            if j == i
                continue
            end
            
            max = -999;
            min = 999;
            for k = 1:2.^(N-2)
                temp1 = zeros(1,N); % the network where x_{ij} =1
                temp2 = zeros(1,N); % the network where x_{ij} =0

                for t = 1:N
                    if t == j
                        temp1(j) = 1;

                    elseif t ~= i 
                        temp1(t) = ran_gra(k,swap(i,j,t));
                        temp2(t) = ran_gra(k,swap(i,j,t));
                    end      
                end
    
                delta_u = value_ind(N,e,d,temp1,i) - value_ind(N,e,d,temp2,i);
                if delta_u > max
                    max = delta_u;
                end
                if delta_u < min
                    min = delta_u;
                end
            end
            if min <= 0
                D(i,j) = 1;
            end
            if max < 0
                M(i,j) = 0;
                M(j,i) = 0;
            end
        end
    end
end

