%main procedure for LogTP 
%patent race model
clc
clear
global L N M d0 b0 opt1 Sigma lin rou alpha pri eta p


% Parameter 
opt1 = optimset('Display','off'); 
tol0 = 1.0e-2;  %velocity1
tol1 = 1.0e-2;  %velocity2
slength = 1;   % steplength

N = 3; % number of players
eta = 0.5;
L = N*(N-1)/2; % number of links
M = 2*L; % dimension of variables
lin = link(N);

%parameters
rou = 0; %common discount factor
alpha = [2,2,4.0];


% Homotopy computation
p = unifrnd(0,1,2*L,1);
pri = zeros(1,L);
for i=1:L
    pri(i) = min(p(2*i-1),p(2*i));
end
Sigma = unifrnd(0,1,3*L,1); 

%Initialization
x0 = [init();0];
homof(x0)

% Main Procedure: predictor & corrector
tic;
%-------------------------------------------
h0 = 0.5;

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
dis = x0 - x;
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
    opt1 = optimset('Display','off','TolFun',acr(e1));
    [x,~,exitflag] = fsolve(@(x) ahomof(x), x1,opt1);

    dis = x0 - x;
    g = -dis/norm(dis);
    x0 = x;
    ni = ni + 1;
    e1 = x0(M+1)

end
time1 = toc;


[x,fval,exitflag] = fsolve(@(x) [homof(x);x(M+1)-1], x0,opt1);

%generate PS networks
ps = zeros(1,L);
for i = 1:L
    ps(i) = min(x(2*i-1),x(2*i));
end
ps % PS network
def(x)  %partial deriative matrix