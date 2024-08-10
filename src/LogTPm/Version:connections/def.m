function z = def(net)
% def: To compute the partial deriatives of the utility functions with
% respect to a given network
% Input net: a network in [0,1]^{L}
% output: a N*N matrix whose (i,j) element represents the partial deriative
% of i's utility function with respect to link ij.
  
global L Va gra N lin
numG = 2.^L;
z = zeros(N, N); %返回值，偏导数矩阵


for i = 1:L
    pr1 = ones(1,numG);
    for k = 1:numG
        g = gra(k,:);
        for t = 1:L
            if t ~= i
                pr1(k) = pr1(k)*(net(t)*g(t)+(1-net(t))*(1-g(t)));
            end
        end

        pr1(k) = pr1(k)*(2*g(i)-1);
    end
   
    
    z(lin(i,1),lin(i,2)) = pr1 * Va(:,lin(i,1));
    z(lin(i,2),lin(i,1)) = pr1 * Va(:,lin(i,2));
end

