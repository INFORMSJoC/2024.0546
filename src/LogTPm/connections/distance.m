function z = distance(ii,jj,gra)
% distance of players: matrix N*N
[~, numL]=size(gra);
numP = 1;
while numP*(numP-1)/2<numL
    numP=numP+1;
end

i = min(ii,jj);
j = max(ii,jj);

G = zeros(numP,numP);
for k=1:numP
    for n=1+k:numP
        if gra(relink(numP,k,n))>0
            G(k,n) = 1;
            G(n,k) = 1;
        end
    end
end

z = dijkstra(G,[i ,j]);