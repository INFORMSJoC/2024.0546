function z = homof(x0)
% homof: to compute the homotopy system.
% Input: x0, a point in [0,1]^{4L+1}.
% Output: z, the value of the homotopy system (in [0,1]^{4L}).
    global L M p lin
    sigma1 = zeros(L,1);
    sigma2 = zeros(L,1);
    mu1 = zeros(L,1);
    mu2 = zeros(L,2);
    x = zeros(L,1);
    y = zeros(L,1);
    alpha = zeros(L,1);
    beta = zeros(L,1);
    
    for i = 1:L
        y(i) = max(x0(2*i-1),0).^2;
        beta(i) = max(-x0(2*i-1),0).^2;
        x(i) = max(x0(2*i),0).^2;
        alpha(i) = max(-x0(2*i),0).^2;
        mu1(i) = max(-x0(2*L+2*i-1),0).^2;
        sigma1(i) = max(x0(2*L+2*i-1),0).^2;
        sigma2(i) = max(x0(2*L+2*i),0).^2;
        mu2(i) = max(-x0(2*L+2*i),0).^2;
    end

    t = x0(M+1);
    z = zeros(M,1);
    F1 = def(x);
    F2 = def(p);

    for i = 1:L
        z(4*i-3) = sigma1(i)*(t*F1(lin(i,1),lin(i,2))+(1-t)*F2(lin(i,1),lin(i,2))) + sigma2(i)*(t*F1(lin(i,2),lin(i,1))+(1-t)*F2(lin(i,2),lin(i,1)))+alpha(i)-beta(i);
        z(4*i-2) = (t*F1(lin(i,1),lin(i,2))+(1-t)*F2(lin(i,1),lin(i,2)))-(t*F1(lin(i,2),lin(i,1))+(1-t)*F2(lin(i,2),lin(i,1)))+mu2(i)-mu1(i);
        z(4*i-1) = sigma1(i) + sigma2(i) -1;
        z(4*i) = x(i) + y(i) - 1;
    end
end

