function E = def(x0)
%partial deriative w.r.t x
    global N M L alpha eta pri lin p
    E = zeros(N,N);
    t = x0(M+1);
    x = zeros(1,L);
    str = zeros(N,N);
    for i = 1:L
        x(i) = F(t,x0(2*i-1),x0(2*i),p(2*i-1),p(2*i),eta,i);
        str(lin(i,1),lin(i,2)) = x(i);
        str(lin(i,2),lin(i,1)) = x(i);
    end
    
    A = zeros(1,N);
    B = 0;
    for i = 1:N
        A(i) = alpha(i) + sum(str(i,:));
        B = B+log(A(i));
    end

    for i=1:L
        E(lin(i,1),lin(i,2)) = 1/(A(lin(i,1))*B) - log(A(lin(i,1)))*(1/A(lin(i,1))+1/A(lin(i,2)))/(B^2);
        E(lin(i,2),lin(i,1)) = 1/(A(lin(i,2))*B) - log(A(lin(i,2)))*(1/A(lin(i,1))+1/A(lin(i,2)))/(B^2);
    end
end
