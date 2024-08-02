function f = homof(x,num,Link,target,M,Sigma,lin,e,d,N)
%Homotopy Mapping
global eta
    f = zeros(M,1);
    df = def(x,Link,target,num,e,d,N,lin,Sigma);
    dfp = def_p(x,Link,target,num,e,d,N,lin);
    t = x(M+1);
    
    for i = 1:num
        f(2*i-1) = t*df(i,lin(target(i),1))+ (1-t)*dfp(i,lin(target(i),1)) + Sigma(2*i-1)*(1-t)*eta/x(2*i-1) - (1-Sigma(2*i-1))*(1-t)*eta/(1-x(2*i-1));
        f(2*i) = t*df(i,lin(target(i),2)) + (1-t)*dfp(i,lin(target(i),2))+ Sigma(2*i)*(1-t)*eta/x(2*i) - (1-Sigma(2*i))*(1-t)*eta/(1-x(2*i));
    end
end