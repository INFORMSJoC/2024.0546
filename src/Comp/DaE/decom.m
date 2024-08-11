function y = decom(L,i)
% decom: a mapping from networks to integers, with which we label the all
% possible networks.
% Input: L, number of links; i, index for the network.
% Output: y in [0,1]^L, a possible network.
    y = zeros(1,L);
    record = i;
    for j = 1:L
        if 2.^(L-j) <= record
            y(j) = 1;
            record = record - 2.^(L-j);
        end
    end
end

