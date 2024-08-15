function y = insert(net,Link)
% insert: to combine the nonrobust links with the robust ones.
% Input: a num*1 vector net, recording the strengths of the non-robust
% links in a subnetwork; Link in [0,1]^L, a vector that records the structure of the subnetwork.
% Output: a network in [0,1]^L derived from Link by replacing
% the −1s with the elements in net.
    y = Link;
    k = 1;
    for i = 1:length(Link)
        if Link(i) == -1
            y(i) = net(k);
            k = k+1;
        end
    end
end

