function [sol,indicator] = solution(group)
% solution.m: to figure out the non-robust links in a subnetwork and then apply
% LogTP to compute the corresponding pairwise stable subnetwork (to determine
% the strength of the non-robust links).
% Input: group, a 1 × N vector that records a subnetwork.
% Output: sol in [0,1]^L, a pairwise stable subnetwork; indicator, the number of nonrobust
% links in this subnetwork.
global e M D d L lin N Link

    % initialization
    num = norm(group,1); % number of players in the subproblem
    net = -1*ones(1,L);
    if num == 1
        indicator = 0;
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
        indicator = 0;
        sol = net;
        return
    end
    % else apply LogTP
    [sol, indicator] = path_following(net);
end


