function z = relink(numP,ii,jj)
% links among players: matrix L*2
global lin
z = 0;
i = min(ii,jj);
j = max(ii,jj);
%lin = link(numP);
k=1;
while z==0
    if lin(k,1)==i && lin(k,2)==j
        z = k;
    else
        k = k+1;
    end
end
    