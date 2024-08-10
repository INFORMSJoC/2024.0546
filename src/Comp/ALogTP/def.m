function z = def(s,Link,x)
% def: to compute the partial derivatives of the utility functions with respect to
% a given network
% Input: s in [0,1]^{2num}, the vector of favorite strengths; Link in [0,1]^L, a vector that records the structure of the subnetwork;
% x in [0,1]^L, a given network;
% output: a num*N whose (i,j) -th element represents the partial deriative
% of agent j's utility function with respect to the i-th link.
% (corresponding to the i-th row of the out put of lin)
global e d lin N num target
z = zeros(num, N); 

% the strength of the nonrobust links
net = insert(x,Link);
str = zeros(N,N);
for i = 1:N*(N-1)/2
    str(lin(i,1),lin(i,2)) = net(i);
    str(lin(i,2),lin(i,1)) = net(i);
end

% compute the partial deriative
for i=1:num
    for j=1:2
        player = lin(target(i),j); 
        temp = e(player);
        for k = 1:N
            if k ~= lin(target(i),3-j)
                temp = temp + str(player,k)*e(k);
            else
                temp = temp + s(2*i-2+j)*e(k);
            end
        end
        z(i,player) = db(temp)*e(lin(target(i),3-j)) - d;
    end
end