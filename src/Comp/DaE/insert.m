function y = insert(net,Link)
%INSERT combine the nonrobust links with the robust ones
    y = Link;
    k = 1;
    for i = 1:length(Link)
        if Link(i) == -1
            y(i) = net(k);
            k = k+1;
        end

    end
end

