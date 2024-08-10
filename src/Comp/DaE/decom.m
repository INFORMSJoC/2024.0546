function y = decom(N,i)
% decom: a mapping from networks to integers, with which we label the all
% possible networks.
% Input: N, number of links; i, index for the network.
% Output: y in [0,1]^N, a possible network.
    y = zeros(1,N);
    record = i;
    for j = 1:N
        if 2.^(N-j) <= record
            y(j) = 1;
            record = record - 2.^(N-j);
        end
    end
end

