
function f = ahomof(x,num,Link,target,M,Sigma,lin,e,d,N,d0,b0)


f = [
    homof(x,num,Link,target,M,Sigma,lin,e,d,N);
    d0'*x - b0
    ];