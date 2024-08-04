%main procedure for ALogTP
%public good provision model
clear;
clc;
global e M D d L lin N

% Parameter setting
N = 10; %number of agents
L = N*(N-1)/2; %number of all possible links
lin = link(N);
e = lognrnd(0,1,1,N); %random problems:efforts
d = 0.2; %cost for link


% Decomposition 
%figure out the robust links
[M,D] = robust_links(N,e,d); %Mij=0 robustly absent; Dij=0 robust potential
tilde_D = combine(N,M,D); %tilde_Dij=0 means ij is a robust link

%figure out the subproblems
G = graph(tilde_D);
S = conncomp(G);
num_s = max(S);
group = search_subproblem(N,S,D,num_s);
% delete repeated subproblem
for i = 1:size(group,1)
    for j =1:size(group,1)
        if i~=j && norm(group(i,:)-group(j,:)) == 0
            group(i,:) = zeros(1,N);
        end
    end
end
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
    [temp, ind(i)] = solution2(group(i,:)); % to apply LogTP
    net(k,:) = [i, temp];
    k = k+1;
end
time = toc;

% generate a PS network from the solutions to the subproblems
net1 = zeros(1,L);
for i=1:L
    net1(i) = sum(net(:,i+1));
end
%disp(net1)




