%main procedure for ALogTP
%public good provision model
%multiple tests
clear;
clc;
global count e M D d L lin N

N = 40;
L = N*(N-1)/2;
lin = link(N);
d = 0.2;
% gra = graphs(N);
fid2 = fopen('mul_record.txt','w');
fid1 = fopen('mul_problems.txt','w');
%pro = load('problems.txt');
count = 5;
for t = 1:5*20 % 20 random problems; each problem solved with 5 sets of random parameters
    %----------------------------------------
    % search for robust absent links
    if count == 5 %update the problem
        e = lognrnd(0,1,1,N); %random problems
        
        for i = 1:N
            fprintf(fid1,"\t%10.5f\t",e(i));
        end
        fprintf(fid1,"\n");
        count = 1;
        fprintf(fid2,'\n');
        tic;
        [M,D] = robust_links(N,e,d); %Mij=0 robustly absent; Dij=0 robust potential
        tilde_D = combine(N,M,D);
        %----------------------------------------
        
        
        
        %----------------------------------------
        %figure out the subproblems
        G = graph(tilde_D);
        S = conncomp(G);
        num_s = max(S)
        group = search_subproblem(N,S,D,num_s);
        % avoid repeated subproblem
        for i = 1:size(group,1)
            for j =1:size(group,1)
                if i~=j && norm(group(i,:)-group(j,:)) == 0
                    group(i,:) = zeros(1,N);
                end
            end
        end
        num_s = size(group,1);
        time1 = toc;
        % Each row of 'group' corresponds to a subproblem
        %----------------------------------------
    else 
        count = count +1;
    end

    
    %----------------------------------------
    % solve each subproblem
    tic;
    net = zeros(1,L+1);
    ind = zeros(1,num_s);
    k = 1;
    for i=1:num_s
        [temp, ind(i)] = solution2(group(i,:)); % to apply LogTP
        net(k,:) = [i, temp]; 
        k = k+1;
    end
    time2 = toc;

    net1 = zeros(1,L);
    int = 0;
    for i=1:L
        net1(i) = sum(net(:,i+1));
        if net1(i) > 0.01 && net1(i) <0.99
            int=1;
        end
    end

    fprintf(fid2,"\n%10.5f\t",max(ind));
    fprintf(fid2,"\t%10.5f\t",time1);
    fprintf(fid2,"\t%10.5f\t",time2);
    fprintf(fid2,"\t%10.5f\t",int);
    if int == 0
        sig = check_PS(net1,e,d,N,lin);
    else
        sig=-1;
    end
    fprintf(fid2,"\t%10.5f\t",sig);
    for i = 1:L
        fprintf(fid2,"\t%10.5f\t",net1(i));
    end

    
end
fclose(fid1);
fclose(fid2);
