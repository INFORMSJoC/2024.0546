%main procedure for ALogTP
%public good provision model
clear;
clc;
global e M D d L lin N

% Parameter setting
N = 4; %number of agents
L = N*(N-1)/2; %number of all possible links
lin = link(N);
e = lognrnd(0,1,1,N); %random problems:efforts
e = [1.13, 4.20, 0.14, 0.82]
d = 0.2; %cost for link


% Decomposition 
%figure out the robust links
[M,D] = robust_links(N,e,d); %Mij=0 robustly absent; Dij=0 robust potential
tilde_D = combine(M,D); %tilde_Dij=0 means ij is a robust link

%figure out the subproblems
G = graph(tilde_D);
S = conncomp(G);
num_s = max(S);
group = search_subproblem(N,S,D,num_s);
num_s = size(group,1);% number of subproblems
% Each row of 'group' corresponds to a subproblem
%----------------------------------------



%----------------------------------------
% solve each subproblem
tic;
net = zeros(1,L+1);% solution to the subproblem
ind = zeros(1,num_s);
k = 1;
for i=1:num_s
    [temp, ind(i)] = solution(group(i,:)); % to apply LogTP
    net(k,:) = [i, temp];
    k = k+1;
end
time = toc;

% generate a PS network from the solutions to the subproblems
net1 = zeros(1,L);
for i=1:L
    net1(i) = sum(net(:,i+1));
    if D(lin(i,1),lin(i,2)) == 0 && D(lin(i,2),lin(i,1)) == 0
        net1(i) = 1;
    elseif M(lin(i,1),lin(i,2)) == 0 || M(lin(i,2),lin(i,1)) == 0
        net1(i) = 0;
    end
end
net1




