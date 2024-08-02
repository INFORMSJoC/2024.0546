function tilde_D = combine(N,M,D)
%COMBINE figure out the nonrobust links
    tilde_D = zeros(N,N);
    for i = 1:N
        for j = i+1:N
            tilde_D(i,j) = max(D(i,j),D(j,i))*M(i,j);
            tilde_D(j,i) = max(D(i,j),D(j,i))*M(i,j);
        end
    end
end

