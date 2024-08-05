%Homotopy Mapping
function f = homof(x)
global L M Sigma lin pri eta p

t = x(M+1);
net = zeros(1,L);
for i = 1:L
    net(i) = F(t,x(2*i-1),x(2*i),p(2*i-1),p(2*i),eta,i);
end

f = zeros(M,1);
df = def(net);
dfp = def(pri);

for i = 1:L
    f(2*i-1) = t*df(lin(i,1),lin(i,2)) + (1-t)*dfp(lin(i,1),lin(i,2)) + Sigma(2*i-1)*(1-t)*eta/x(2*i-1) - (1-Sigma(2*i-1))*(1-t)*eta/(1-x(2*i-1));
    f(2*i) = t*df(lin(i,2),lin(i,1)) + (1-t)*dfp(lin(i,2),lin(i,1)) + Sigma(2*i)*(1-t)*eta/x(2*i) - (1-Sigma(2*i))*(1-t)*eta/(1-x(2*i));
end