function z = loop_graph(L)
% loop_graph: all possible networks when assuming the agents
% are located on a circle.
% Input: L, the number of links.
% Output: a 2^L*L matrix whose each row represents a possible network.


numG = 2.^L;
z0 = zeros(numG,L);

i = 2;
while z0(numG,1)<1
    if z0(i-1,L)<1
        z0(i,:) = z0(i-1,:)+[zeros(1,L-1) 1];
    else
        k = L;
        while z0(i-1,k)>0
            k = k-1;
        end
        z0(i,1:k-1) = z0(i-1,1:k-1);
        z0(i,k) = 1;
        z0(i,k+1:L) = zeros(1,L-k);
    end
    i = i+1;
end
z = z0;

