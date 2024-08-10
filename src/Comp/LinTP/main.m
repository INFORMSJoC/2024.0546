%pairwise stable network, main program
%connection model: we can change values of players
clc;
clear;
global L N M d0 b0 opt1 G p w d c Va lin gra

opt1 = optimset('Display','off'); 
tol0 = 1.0e-4;    
tol1 = 0.1;   
slength = 0.1;   %steplength

N = 3;% number of players
L = N;% number of links
G = 2.^L;% number of graphs
M = 4*L;% dimension of variables
lin = loop_link(N); % all possible links
gra = loop_graph(N); % all possible networks

%parameters for the connection model
d = 0.8;  %connection model parameters
c = 0.48;
w = lognrnd(0,1,1,N); % social value vector
Va = loop_values(gra,w);%payoff matrix
p = unifrnd(0,1,L,1);

    
%start
x0 = startingpoint(p);
h0 = 0.1;
tic;


g = zeros(M+1, 1);
g(M+1) = 1;
x1 = x0+ h0*g;
e2 = min(x1(M+1),1-x1(M+1));% avoid that the predictor step get out of feasible region: remain positive
while e2< -1.0e-10
    h0 = 0.9*h0;
    x1 = x0+ h0*g;
    e2 = min(x1(M+1),1-x1(M+1));
end
e3 = norm(homof(x1));% keep that the predictor step is not far away

while e3 > tol1
    h0 = 0.9*h0;
    x1 = x0 + h0*g;
    f0 = homof(x1);
    e3 = norm(f0);
end
d0 = g;
b0 = d0'*x1;
x = fsolve(@(x) [homof(x);x(M+1)-x1(M+1)], x1,opt1);
g = -(x0 - x)/norm(x0 - x);
x0 = x;
%----------------------------------

e1 = 0;
ni = 1;
while 1-e1 > tol0
    h0 = slength;
    e2 = -1;
    while e2 < -1.0e-10
        h0 = 0.9*h0;
        x1 = x0 + h0*g;
        e2 = min(x1(M+1),1-x1(M+1));
    end
    e3 = norm(homof(x1));
    while e3 > tol1
        h0 = 0.9*h0;
        x1 = x0 + h0*g;
        f0 = homof(x1);
        e3 = norm(f0);
    end
    d0 = g;
    b0 = d0'*x1;
    [x,~,exitflag] = fsolve(@(x) ahomof(x), x1,opt1);
    dist = x0 - x;
    g = -dist/norm(dist);
    x0 = x;
    ni = ni + 1;
    e1 = x0(M+1)
   

end
time1 = toc;
ps = zeros(1,L);
for i=1:L
    ps(i) = max(x0(2*i),0).^2;
end
ps