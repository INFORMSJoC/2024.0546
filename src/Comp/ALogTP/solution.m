function [sol,num] = solution(group)
% solution.m:  to figure out a pairwise stable subnetwork with LogTP. To do so, we first generate a vector Link in [0,1]^L that records the structure of the subnetwork. Precisely, the strengths of the links not included in the subnetwork equal zero. (In problems with a sparse structure, it makes no difference when computing the utility functions and their partial derivatives) The robustly absent or built links have strength 0 or 1, respectively. The strengths of the non-robust links in the subnetwork are set as −1. 
% We denote the number of non-robust links by num. We tackle the subproblem with path-following.m, the main program of LogTP, with input Link in [0,1]^L.
% Input: group, a 1 × N vector that records the players in a subnetwork.
% Output: sol in [0,1]^L, a pairwise stable subnetwork; num, the number of nonrobust
% links in this subnetwork.
global e M D d L lin N Link

    % initialization
    num = norm(group,1); % number of players in the subproblem
    net = -1*ones(1,L);
    if num == 1
        num = 0;
        sol = zeros(1,L);
        return
    end

    % figure out the all robust links
    n = L;

    for i = 1:L
        % the link is not considered in this subproblem
        if group(lin(i,1)) == 0 && group(lin(i,2)) == 0
            net(i) = 0;
            n = n-1;
            continue
        end

        % identify the robust links in the subproblem
        if D(lin(i,1),lin(i,2)) == 0 && D(lin(i,2),lin(i,1)) == 0
            net(i) = 1;
            n = n-1;
        elseif M(lin(i,1),lin(i,2)) == 0 || M(lin(i,2),lin(i,1)) == 0
            net(i) = 0;
            n = n-1;
        end
    end
    % in net, '-1' records the nonrobust links

    % homotopy method
    sol = zeros(1,L);
    % if no nonrobust links exist
    if n == 0
        num = 0;
        sol = net;
        return
    end
    % else apply LogTP
    [sol, num] = path_following(net);
end


