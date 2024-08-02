function z = def(x,Link,target,num,e,d,N,lin,Sigma)
%partial derivatives of utilities with respect to x
global eta p
z = zeros(num, N); %partial deriative marix
t = x(2*num+1);

% the strength of the nonrobust links
net = zeros(1,num);
for i = 1:num
    net(i) = F(t,x(2*i-1),x(2*i),p(2*i-1),p(2*i),eta,i,num,Sigma);
end
net = insert(net,Link); %put the nonrobust links togerther with the robust ones
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