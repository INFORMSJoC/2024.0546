function [PS,num] = path_following(Link)
%PATH_FOLLOWING the predictor-corrector method to solve the subproblems
global pri eta e d lin N L Sigma m p
    opt1 = optimset('Display','off'); 
    tol0 = 1.0e-2;   %velocity 1
    tol1 = 1.0e-2;   %velocity2
    slength = 1;   %steplength
    eta = 0.5;

    %figure out the nonrobust links
    target = zeros(1,1);
    num = 1; %number of nonrobust links
    for i = 1:L
        if Link(i) == -1
            target(num) = i; %record the nonrobust links
            num = num+1;
        end
    end
    num = num-1; %number of nonrobust links: decide the dimension of LogTP
    

    % standrad homotopy
    m = 2*num; % number of homotopy variables
    Sigma = unifrnd(0,1,3*num,1);
    p = unifrnd(0,1,2*num,1);
    pri = zeros(1,num);
    for i = 1:num
        pri(i) = min(p(2*i-1),p(2*i));
    end
    

    % initialization
    x0 = [init(num,Link,target);0];

    h0 = 0.5;
    g = [zeros(m,1);1];

    x1 = x0+ h0*g;
    e2 = min(x1(m+1),1-x1(m+1));% avoid that the predictor step get out of feasible region: remain positive
    while e2< -1.0e-10
        h0 = 0.9*h0;
        x1 = x0+ h0*g;
        e2 = min(x1(m+1),1-x1(m+1));
    end
    e3 = norm(homof(x1,num,Link,target,m,Sigma,lin,e,d,N));% keep that the predictor step is not far away
    while e3 > tol1
        h0 = 0.9*h0;
        x1 = x0 + h0*g;
        f0 = homof(x1,num,Link,target,m,Sigma,lin,e,d,N);
        e3 = norm(f0);
    end
    d0 = g;
    b0 = d0'*x1;
    x = fsolve(@(x) [homof(x,num,Link,target,m,Sigma,lin,e,d,N);x(m+1)-x1(m+1)], x1,opt1);
    g = -(x0 - x)/norm(x0 - x);
    x0 = x;


    % further iteration
    e1 = 0;%t
    ni = 1;
    fid = fopen('record.txt','w');
    while 1-e1 > tol0
        h0 = slength;
        e2 = -1;
        while e2 < -1.0e-10
            h0 = 0.9*h0;
            x1 = x0 + h0*g;
            e2 = min(x1(m+1),1-x1(m+1));
        end
        e3 = norm(homof(x1,num,Link,target,m,Sigma,lin,e,d,N));
        while e3 > tol1
            h0 = 0.9*h0;
            x1 = x0 + h0*g;
            f0 = homof(x1,num,Link,target,m,Sigma,lin,e,d,N);
            e3 = norm(f0);
        end
    
        d0 = g;
        b0 = d0'*x1;
        opt1 = optimset('Display','off','TolFun',acr(e1));
        [x,~,exitflag] = fsolve(@(x) ahomof(x,num,Link,target,m,Sigma,lin,e,d,N,d0,b0), x1,opt1);
    
    
        dist = x0 - x;
        g = -dist/norm(dist);
        x0 = x;
        ni = ni + 1;
        e1 = x0(m+1)
  
    end
    [x,fval,exitflag] = fsolve(@(x) [homof(x,num,Link,target,m,Sigma,lin,e,d,N);x(m+1)-1], x0,opt1);
    PS = zeros(1,num);
    for i = 1:num
        PS(i) = min(x(2*i-1),x(2*i));
    end
    PS = insert(PS,Link); % combine the solution with the robust links
end

