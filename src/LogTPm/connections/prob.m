function z = prob(x)
%probability of graph g, from L to numG
global L gra G
t = x(2*L+1);

z = ones(G,1);
for k = 1:G
    g = gra(k,:);
    for i = 1:L
        z(k) = z(k)*(g(i)*F(t,x(2*i-1),x(2*i))+(1-g(i))*(1-F(t,x(2*i-1),x(2*i))));
    end
end
end