function group = search_subproblem(N,S,D,num_s)
% search_subproblem: to figure out the agents involved in each subproblem.
% Input: N, number of players; S, the output of "conncomp(˜D)"; D, the N × N matrix derived from "robust_
% link.m”; num S, the number of connected components computed by Matlab codes max(S).
% Output: group, a matrix of N columns. Each row of the matrix corresponds to
% a subnetwork. Its (i, j)-th element equals to 1 if agent j is included in the i-th
% subnetwork and 0 otherwise.
    group = zeros(num_s,N);
    for i = 1:N
        group(S(i),i) = 1; 

        % search for players added by a robust link
        for j = 1:N
            if D(i,j)==0 && D(j,i)==0
                group(S(i),j) = 1;
            end
        end
    end
end

