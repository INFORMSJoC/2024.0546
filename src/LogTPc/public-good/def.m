function z = def(x)
% partial deriative w.r.t x
global d e N M lin L eta p
z = zeros(N, N); 
t = x(M+1);

% the strength of the nonrobust links
net = zeros(1,L);
for i = 1:L
    net(i) = F(t,x(2*i-1),x(2*i),p(2*i-1),p(2*i),eta,i);
end

strength = zeros(N,N);
for i = 1:L
    strength(lin(i,1),lin(i,2)) = net(i);
    strength(lin(i,2),lin(i,1)) = net(i);
end

% compute the partial deriative
for i=1:L
    for j=1:2
        player = lin(i,j); 
        temp = e(player);
        for k = 1:N
            if k ~= lin(i,3-j)
                temp = temp + strength(player,k)*e(k);
            else
                temp = temp + x(2*i-2+j)*e(k);
            end
        end
        z(lin(i,j),lin(i,3-j)) = db(temp)*e(lin(i,3-j)) - d;
    end
end
