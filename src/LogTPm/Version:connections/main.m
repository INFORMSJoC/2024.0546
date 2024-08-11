%pairwise stable network, main program
%connection model: we can change values of players
clc
clear
global L N M d0 b0 opt1 G w d c Va lin gra Sigma pri eta p
 
opt1 = optimset('Display','off'); 
tol0 = 1.0e-4; 
tol1 = 0.1;
slength = 1;   %steplength

N = 5;% number of players
L = N;% number of links
G = 2.^L;% number of networks
M = 2*L;% dimension of variables
eta = 1;

d = 0.8;  %parameters of connection model 
c = 0.48; %cost for links
w = lognrnd(0,1,1,N);   %social values 
lin = loop_link(N); %all possible links
gra = loop_graph(N); %all possible graphs
Va = loop_values(gra,w);%payoff matrix


Sigma = unifrnd(0,1,3*L,1);
p = unifrnd(0,1,3*L,1);
pri = zeros(1,L);
for i=1:L
    pri(i) = p(2*L+i)*p(2*i-1) + (1-p(2*L+i))*p(2*i);
end
fid = fopen('rec.txt','w');
%Initialization
x0 = [init();0];
 fprintf(fid, "%10.5f", 0);
    for i = 1:L
        fprintf(fid, "\t %10.5f\t", min(x0(2*i-1),x0(2*i)));
    end
    fprintf(fid, "\n");

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
    fprintf(fid, "%10.5f", e1);
    for i = 1:L
        fprintf(fid, "\t %10.5f\t", min(x(2*i-1),x(2*i)));
    end
    fprintf(fid, "\n");
end
time1 = toc;

[x,fval,exitflag] = fsolve(@(x) [homof(x);x(M+1)-1], x0,opt1);

%generate a PS network

ps = zeros(1,L);
for i = 1:L
    ps(i)=min(x(2*i-1),x(2*i));
end
ps
