function z = def_p(x,Link,target,num,e,d,N,lin)
%partial derivatives of utilities w.r.t. prior
global pri
z = zeros(num, N); 
t = x(2*num+1);

% the strength of the nonrobust links
net = insert(pri,Link);
str = zeros(N,N);
for i = 1:N*(N-1)/2
    str(lin(i,1),lin(i,2)) = net(i);
    str(lin(i,2),lin(i,1)) = net(i);
end

% compute the partial deriative
for i=1:num
    for j=1:2
        player = lin(target(i),j); 
        temp = e(player);
        for k = 1:N
            if k ~= lin(target(i),3-j)
                temp = temp + str(player,k)*e(k);
            else
                temp = temp + x(2*i-2+j)*e(k);
            end
        end
        z(i,player) = db(temp)*e(lin(target(i),3-j)) - d;
    end
end