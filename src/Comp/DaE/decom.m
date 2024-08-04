function y = decom(N,i)
%DECOM: mapping from networks to integers
    y = zeros(1,N);
    record = i;
    for j = 1:N
        if 2.^(N-j) <= record
            y(j) = 1;
            record = record - 2.^(N-j);
        end
    end
end

