function group = search_subproblem(N,S,D,num_s)
%SEARCHH_SUBPROBLEM search for the set of players involved in a subproblem
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

