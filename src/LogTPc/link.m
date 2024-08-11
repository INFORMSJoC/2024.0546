function z = link(numP)
% link: to show the set of all possible links.
% Input numP: number of players. 
% Output: a L*2 matrix whose each row represents a possible link. For
% example, the row given by (i,j) represents the link between agent i and j.  
numL = numP*(numP-1)/2;% number of links
z = zeros(numL,2);
k = 1;
for i = 1:numP
    z(k:k+numP-i-1,1) = i*ones(numP-i,1);
    z(k:k+numP-i-1,2) = linspace(i+1,numP,numP-i);
    k = k + numP-i;
end
