function [sol, k, ind, rea, time] = solution1(N,group,e,d,D,M)
%SOLUTION1 exhaustive searching as in Leung(2020)
    num = norm(group,1); % number of players in the subproblem

    % the list of all involved players
    player = zeros(1,num);
    sub_e = zeros(1,num);
    k = 1;
    for i=1:N
        if group(i) == 1
            player(k) = i;
            sub_e(k) = e(i);
            k = k + 1;
        end
    end
    
    % figure out the all robust links
    L = num*(num-1)/2;  
    Link = -1*ones(1,L); % '-1' represent the non-robust links
    lin = link(num);% the links in the subproblem
    n = 0;

    for i = 1:L
        if D(player(lin(i,1)),player(lin(i,2))) == 0 && D(player(lin(i,2)),player(lin(i,1))) == 0
            Link(i) = 1;
            n = n+1;
        elseif M(player(lin(i,1)),player(lin(i,2))) == 0 || M(player(lin(i,2)),player(lin(i,1))) == 0
            Link(i) = 0;
            n = n+1;
        end
    end

    % exhaustive searching
    sol = zeros(1,N*(N-1)/2);
    k = 1;
    if L == 0
        ind=0;
        rea=0;
        time =0;
        return
    end
    ind = L-n; %number of nonrobust links
    %q = floor((L-n)*4/5); 

    for i = 1:2^(L-n)
        temp = decom(L-n,i-1); 
        net = insert(temp,Link);%the subnetwork
        signal = check_PS(net,sub_e,d,num,lin); % check whether the subnetwork is pairwise stable 
        if signal == 1
            sol(k,:) = translate(N,num,net,player); % incorporate the subnetwork into the whole network
            k = k+1;
        end
    end
%     time = 0;
% Accelerate: rearrange the sequence of the search
%     q=0;
%     for i = 1:2.^(L-n-q)
%         disp([ind,i])
%         for j=1:2^q
%             tic;
%             temp = decom(L-n,2^(L-n-q)*(j-1)+i-1); 
%             net = insert(temp,Link);
%             signal = check_PS(net,sub_e,d,num,lin); % check whether the subnetwork is pairwise stable 
%             [net,signal]
%             if signal == 1
%                 sol(k,:) = translate(N,num,net,player);
%                 rea = i*2^q+j;
%                 k = k+1;
%                 %return 
%             end
%             dur = toc;
%             time = time+dur;
%             if time > 7200
%                 sol = -1*ones(1,N*(N-1)/2);
%                 k = 0;
%                 rea = i;
%                 return 
%             end
%         end
%         
%     end
end

