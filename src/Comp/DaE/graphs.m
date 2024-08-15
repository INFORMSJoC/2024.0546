function gra = graphs(n)
% graphs: to show the set of all possible networks.
% Input: n, the number of links.
% Output: a 2^n*n matrix whose each row represents a possible network.
    numL = n;% number of links
    numG = 2.^numL;
    gra = zeros(numG,numL);
    
    
    i = 2;
    while gra(numG,1)<1
        if gra(i-1,numL)<1
            gra(i,:) = gra(i-1,:)+[zeros(1,numL-1) 1];
        else
            k = numL;
            while gra(i-1,k)>0
                k = k-1;
            end
            gra(i,1:k-1) = gra(i-1,1:k-1);
            gra(i,k) = 1;
            gra(i,k+1:numL) = zeros(1,numL-k);
        end
        i = i+1;
    end
end

