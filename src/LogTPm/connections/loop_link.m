function z = loop_link(numP)
%all possible links: circle
    z = zeros(numP,2);
    for i = 1:numP-1
        z(i,1) = i;
        z(i,2) = i+1;
    end
    z(numP,1) = 1;
    z(numP,2) = numP;


