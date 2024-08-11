function z = u0(x,i,j,Link,sigma)
%  u0: to compute the elements of the homotopy system at t=0.
%  Input: x in [0,1], link strength; i in {1,2..num},j in {1,2}, index for the link and player (in the sense of "lin");
%  Link in [0,1]^L, a vector that records the structure of the subnetwork;
%  sigma>0, weight for the logarithmic penalty.
%  output: the 2*i+2-j -th element of the the homotopy system at t=0.
global pri d e N M lin L eta
    player = lin(i,j);
    net = insert(pri,Link);
    net1 = zeros(N,N);
    for k = 1:L
        net1(lin(k,1),lin(k,2)) = net(k);
        net1(lin(k,2),lin(k,1)) = net(k);
    end
    temp = e(player);
    for k = 1:N
        if k ~= lin(i,3-j)
            temp = temp + net1(player,k)*e(k);
        else
            temp = temp + x*e(k);
        end
    end
    y = db(temp)*e(lin(i,3-j)) - d;

    z = y+sigma*eta/x - (1-sigma)*eta/(1-x);
end
