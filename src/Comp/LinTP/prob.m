function z = prob(x,avo)
%probability of graph g, from L to numG
global L gra G

z = ones(G,1);
for k = 1:G
    g = gra(k,:);
    for i = 1:L
        if i ~= avo
            z(k) = z(k)*(g(i)*x(i)+(1-g(i))*(1-x(i)));
        end
    end
end
end