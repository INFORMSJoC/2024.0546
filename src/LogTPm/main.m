% pairwise stable network, main program
% coauthor model
clc
clear
global L N M d0 b0 opt1 G c Va lin gra Sigma pri eta p
 
opt1 = optimset('Display','off'); 
tol0 = 1.0e-4; 
tol1 = 0.1;
slength = 0.1;   %steplength

N = 5;% number of players
L = N*(N-1)/2;% number of links
G = 2.^L;% number of networks
M = 2*L;% dimension of variables
eta = 1;

c = 0.3; %cost for links
lin = links(N); %all possible links
gra = graphs(L); %all possible graphs
Va = values(gra);%payoff matrix


Sigma = unifrnd(0,1,3*L,1);
p = unifrnd(0,1,3*L,1);
pri = zeros(1,L);
for i=1:L
    pri(i) = p(2*L+i)*p(2*i-1) + (1-p(2*L+i))*p(2*i);
end


%Initialization
x0 = [init();0];


%Main Procedure
tic;
count = 0;
%-------------------------------------------
h0 = 1;

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

e1 = 0;%t
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
    count = count + 1;

    dist = x0 - x;
    g = -dist/norm(dist);
    x0 = x;
    ni = ni + 1;
    e1 = x0(M+1)


end
time1 = toc;

[x,fval,exitflag] = fsolve(@(x) [homof(x);x(M+1)-1], x0,opt1);

%generate a PS network

ps = zeros(1,L);
for i = 1:L
    ps(i)=min(x(2*i-1),x(2*i));
end
ps
