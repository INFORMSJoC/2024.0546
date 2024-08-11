function z = u0(x,i,j)
%  u0: to compute the elements of the homotopy system at t=0.
%  Input: x: link strength; i in {1,2..L},j in {1,2}, index for the link and player (in the sense of "lin").
%  output: the 2*i-2+j -th element of the homotopy system at t=0.
global pri N lin L Sigma eta alpha
    net = zeros(N,N);
  
    temp = pri;
    temp(i) = x;
    for k = 1:L
        net(lin(k,1),lin(k,2)) = temp(k);
        net(lin(k,2),lin(k,1)) = temp(k);
    end
    A = zeros(1,N);
    B = 0;
    for k = 1:N
        A(k) = alpha(k) + sum(net(k,:));
        B = B+log(A(k));
    end

    y = 1/(B*A(lin(i,j))) - (log(A(lin(i,j)))*(1/A(lin(i,j))+1/A(lin(i,3-j))))/(B^2);

    z = y + Sigma(2*i-2+j)*eta/x - (1-Sigma(2*i-2+j))*eta/(1-x);
end
