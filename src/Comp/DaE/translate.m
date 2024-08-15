function y = translate(N,num,net,player)
% translate: extend a subnetwork to a whole one (the links not in the
% subnetwork have strength 0)
% Input: N, number of players; num, number of players in the subnetwork;
% net: a given subnetwork; player: a vector that maps the index of agents
% in the subnetwork to that defined in the whole network.
% Output: an extended network.
    y = zeros(1,N*(N-1)/2);
    str = zeros(N,N);
    lin = link(N);
    lin1 = link(num);
    for i=1:length(net)
        str(player(lin1(i,1)),player(lin1(i,2))) = net(i);
        str(player(lin1(i,2)),player(lin1(i,1))) = net(i);
    end
    for i=1:N*(N-1)/2
        y(i) = str(lin(i,1),lin(i,2));
    end
end

