function z = matrix2vec(x)
    global L lin
    z = zeros(2*L,1);
    for i = 1:L
        z(2*i-1) = x(lin(i,1),lin(i,2));
        z(2*i) = x(lin(i,2),lin(i,1));
    end
end

