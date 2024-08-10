function f = homof(x)
% homof: to compute the homotopy system
% Input x: the point x in [0,1]^{2L+1}
% output y: the value of the homotopy system (in [0,1]^{2L})
    global Sigma M lin L eta p pri
    f = zeros(M,1);
    t = x(M+1);
    net = F(t,x(1:M,:),p);

    df = def(x(1:M,:),net);
    dfp = def(x(1:M,:),pri);
    t = x(M+1);

    for i = 1:L
        f(2*i-1) = t*df(lin(i,1),lin(i,2)) +(1-t)*dfp(lin(i,1),lin(i,2))+Sigma(2*i-1)*(1-t)*eta/x(2*i-1) - (1-Sigma(2*i-1))*(1-t)*eta/(1-x(2*i-1));
        f(2*i) = t*df(lin(i,2),lin(i,1))+(1-t)*dfp(lin(i,2),lin(i,1))+Sigma(2*i)*(1-t)*eta/x(2*i) - (1-Sigma(2*i))*(1-t)*eta/(1-x(2*i));
    end
end

