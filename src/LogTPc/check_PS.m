function z = check_PS(net,e,d,N,lin)
%CHECK_PS Judge whether the subnetwork is pairwise stable
    z = 1;
    L = N*(N-1)/2;
    for i = 1:L
        delta_u1= dvalue(N,e,d,net,lin(i,1),lin(i,2),lin);
        delta_u2= dvalue(N,e,d,net,lin(i,2),lin(i,1),lin);

        if net(i) == 1
            if delta_u1 < 0 || delta_u2 <0
                z = 0;
            end
        end
        if net(i) == 0
            if delta_u1 > 0 && delta_u2 >0
                z = 0;
            end
        end
        if z == 0
            break
        end
    end
end

