function y = value_ind(N,e,d,net,i)
% value_ind: to compute the payoff of a particular agent in a given
% network.
% Input: N, number of players; e, d, parameters of the model; net in
% [0,1]^L, a given network; i, index for the player.
% Output: the payoff of agent i in network net.
    count = 0;
    temp = 0;
    for j = 1:N
        count = count + net(j);
        temp = temp + e(j)*net(j);
    end
    y = b(e(i)+temp) - d*count;
end

