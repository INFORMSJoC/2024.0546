function f = homof(x)
%homotopy mapping
    global Sigma d e N M lin L eta p
    f = zeros(M,1);
    df = def(x);
    dfp = def_p(x);
    t = x(M+1);

    for i = 1:L
        f(2*i-1) = t*df(lin(i,1),lin(i,2)) +(1-t)*dfp(2*i-1)+Sigma(2*i-1)*(1-t)*eta/x(2*i-1) - (1-Sigma(2*i-1))*(1-t)*eta/(1-x(2*i-1));
        f(2*i) = t*df(lin(i,2),lin(i,1))+(1-t)*dfp(2*i)+Sigma(2*i)*(1-t)*eta/x(2*i) - (1-Sigma(2*i))*(1-t)*eta/(1-x(2*i));
    end
end

