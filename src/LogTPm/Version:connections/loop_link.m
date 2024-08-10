function z = loop_link(numP)
% loop_link: to show the set of all possible links when assuming the agents
% are located on a circle
% Input numP: number of players 
% output: a numP*2 matrix whose each row represents a possible link. For
% example, the row given by (i,j) represents the link between agent i and j. 
    z = zeros(numP,2);
    for i = 1:numP-1
        z(i,1) = i;
        z(i,2) = i+1;
    end
    z(numP,1) = 1;
    z(numP,2) = numP;


