function tilde_D = combine(M,D)
% combine: to figure out the nonrobust links.
% Input: two N*N matrice M and D derived from "robust link.m".
% Output: a N*N matrix ˜D. For each link ij, ˜Dij = 0 if the link is surely to be absent
% or built and ˜Dij = 1 otherwise. With this matrix, we can decompose the network
% into smaller ones. (via the Matlab function “conncomp(˜D )”).
global N
    tilde_D = zeros(N,N);
    for i = 1:N
        for j = i+1:N
            tilde_D(i,j) = max(D(i,j),D(j,i))*M(i,j);
            tilde_D(j,i) = max(D(i,j),D(j,i))*M(i,j);
        end
    end
end

