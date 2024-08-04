function z = vec2matrix(x,N)
    global lin
    z = zeros(N,N);
    for i = 1:N
       z(lin(i,1),lin(i,2)) = x(i);
       z(lin(i,2),lin(i,1)) = x(i);
    end
end

