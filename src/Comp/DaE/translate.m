function y = translate(N,num,net,player)
%TRANSLATE vector2matrix
    y = zeros(1,N*(N-1)/2);
    str = zeros(N,N);
    lin = link(N);
    lin1 = link(num);
    for i=1:length(net)
        str(player(lin1(i,1)),player(lin1(i,2))) = net(i);
        str(player(lin1(i,2)),player(lin1(i,1))) = net(i);
    end
    for i=1:N*(N-1)/2
        y(i) = str(lin(i,1),lin(i,2));
    end
end

