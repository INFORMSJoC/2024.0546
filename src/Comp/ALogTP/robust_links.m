function [M,D] = robust_links(N,e,d)
% robust_links: to figure out the robust link
% Input: N, number of players; other parameters in the model. Take the public provision model of Bramoull´e and
% Kranton (2007) as an example. (in Section 5.4 of our paper) e, the effort
% vector; d > 0, cost for links.
% Output: two N*N matrices M and D. A link ij is surely to be absent if
% Mij = 0 or Mji = 0. This link is sure to be established if Dij = 0 and Dji = 0.

    M =ones(N,N); %robustly absent links
    D= zeros(N,N); %robustly potential links

    for i = 1:N
        for j = 1:N
            if j==i
                continue
            end
            if db(e(i))*e(j) - d <=0 % by monotonicity  
                M(i,j) = 0;
                M(j,i) = 0;
            end
            if db(sum(e))*e(j) - d <=0 % by monotonicity
                D(i,j) = 1;
            end
        end
    end
end

