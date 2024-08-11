function z = u0(x,i,j)
%  u0: to compute the elements of the homotopy system at t=0.
%  Input: x, link strength; i in {1,2..L},j in {1,2}, index for the link and player (in the sense of "lin").
%  Output: the 2*i+2-j -th element of the the homotopy system at t=0.
global pri d e N lin L Sigma eta
    player = lin(i,j);
    for k = 1:L
        net(lin(k,1),lin(k,2)) = pri(k);
        net(lin(k,2),lin(k,1)) = pri(k);
    end
    temp = e(player);
    for k = 1:N
        if k ~= lin(i,3-j)
            temp = temp + net(player,k)*e(k);
        else
            temp = temp + x*e(k);
        end
    end
    y = db(temp)*e(lin(i,3-j)) - d;

    z = y+Sigma(2*i-2+j)*eta/x - (1-Sigma(2*i-2+j))*eta/(1-x);
end
