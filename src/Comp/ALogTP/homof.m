function f = homof(x,Link)
% homof: to compute the homotopy system
% Input: x, the point x in [0,1]^{2num+1}; Link in [0,1]^L, a vector that
% records the structure of the subnetwork.
% output y: the value of the homotopy system (in [0,1]^{2num})
global pri eta lin Sigma m p num target
    f = zeros(m,1);
    t = x(m+1);

    % the strength of the nonrobust links
    net = F(t,x(1:m,:),p);
    net = insert(net,Link); %put the nonrobust links togerther with the robust ones

    df = def(x,Link,net);
    dfp = def(x,Link,pri);
    
    
    for i = 1:num
        f(2*i-1) = t*df(i,lin(target(i),1))+ (1-t)*dfp(i,lin(target(i),1)) + Sigma(2*i-1)*(1-t)*eta/x(2*i-1) - (1-Sigma(2*i-1))*(1-t)*eta/(1-x(2*i-1));
        f(2*i) = t*df(i,lin(target(i),2)) + (1-t)*dfp(i,lin(target(i),2))+ Sigma(2*i)*(1-t)*eta/x(2*i) - (1-Sigma(2*i))*(1-t)*eta/(1-x(2*i));
    end
end