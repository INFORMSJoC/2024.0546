function [M,D] = robust_links(N,e,d)
%ROBUST_links figure out the nonrobust link

    M =ones(N,N); %robustly absent links
    D= zeros(N,N); %robustly potential links

    for i = 1:N
        for j = 1:N
            if j==i
                continue
            end
            if db(e(i))*e(j) - d <=0 % by monotonicity  
                M(i,j) = 0;
                M(j,i) = 0;
            end
            if db(sum(e))*e(j) - d <=0 % by monotonicity
                D(i,j) = 1;
            end
        end
    end
end

