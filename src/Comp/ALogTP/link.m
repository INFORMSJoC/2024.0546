function z = link(numP)
% links among players: matrix L*2
numL = numP*(numP-1)/2;% number of links
z = zeros(numL,2);
k = 1;
for i = 1:numP
    z(k:k+numP-i-1,1) = i*ones(numP-i,1);
    z(k:k+numP-i-1,2) = linspace(i+1,numP,numP-i);
    k = k + numP-i;
end