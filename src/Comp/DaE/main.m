clear;
clc;

N = 6;
L = N*(N-1)/2;
lin = link(N);
% gra = graphs(N);

%----------------------------------------
% search for robust absent links
e = lognrnd(0,1,1,N); % efforts
d = 0.2; % cost
tic;
[M,D] = robust_links(N,e,d); %Mij=0 robustly absent; Dij=0 robust potential
tilde_D = combine(N,M,D) %figure out the robust links
%----------------------------------------



%----------------------------------------
%figure out the subproblems
G = graph(tilde_D);
S = conncomp(G); % commponents of tilde_D: the subnetworks
num_s = max(S)
group = search_subproblem(N,S,D,num_s);
% Each row of 'group' corresponds to a subproblem
%----------------------------------------



%----------------------------------------
% solve each subproblem
net = zeros(1,L+1);% each row corresponds to a PS network
ind = zeros(1,num_s);
k = 1;
for i=1:num_s
    [temp, count, ind(i)] = solution1(N,group(i,:),e,d,D,M); %solve
    for j = 1:count-1
        net(k,:) = [i, temp(j,:)]; %the first entry is the serial number of the subnetwork
        k = k+1;
    end
end
time = toc

