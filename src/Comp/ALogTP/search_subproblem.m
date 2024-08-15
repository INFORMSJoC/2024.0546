function group = search_subproblem(N,S,D,num_s)
% search_subproblem: to figure out the agents involved in each subproblem. A subproblem contains the agents 
% in a connected component of the graph given by ˜D and the agents connected to them via a robustly built link.
% Input: N, number of players; S, the output of "conncomp(˜D)”; D, the N × N matrix derived from “robust
% link.m”; num S, the number of connected components computed by Matlab
% codes max(S).
% Output: group, a matrix of N columns. Each row of the matrix corresponds to
% a subnetwork. Its (i, j)-th element equals to 1 if agent j is included in the i-th
% subnetwork and 0 otherwise.
    temp = zeros(num_s,N);
    for i = 1:N
        temp(S(i),i) = 1; %each row stands for a subproblem

        % players added by a robust link
        for j = 1:N
            if D(i,j)==0 && D(j,i)==0
                temp(S(i),j) = 1;
            end
        end
    end

    % exclude trivial problems: only includes 1 player
    group = zeros(0,N);
    k = 1;
    for i = 1:num_s
        if sum(temp(i,:)) > 1
            group(k,:) = temp(i,:);
            k = k + 1;
        end
    end
end

