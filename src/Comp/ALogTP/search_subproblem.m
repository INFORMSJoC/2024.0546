function group = search_subproblem(N,S,D,num_s)
%SEARCHH_SUBPROBLEM search for the set of players involved in a subproblem

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

