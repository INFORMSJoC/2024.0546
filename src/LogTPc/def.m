function z = def(s,x)
% def: to compute the partial derivatives of the utility functions at point s in [0,1]^{2L} with
% respect to a given network x.
% Input: s in [0,1]^{2L}, the vector of favorite strengths; x, a network in
% in [0,1]^{L}.
% Output: a N*N matrix whose (i,j) and (j,i) -th element equals to the
% partial drivatives of agent i and j's utility functions with respect to
% link ij, resepectively.
   global N lin L alpha
   z = zeros(N,N); % record the partial deriative 
   for i = 1:L
        for j=1:2
            temp = x;
            temp(i) = s(2*i-2+j);
            net = zeros(N,N);
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
            
            z(lin(i,j),lin(i,3-j)) = 1/(B*A(lin(i,j))) - (log(A(lin(i,j)))*(1/A(lin(i,j))+1/A(lin(i,3-j))))/(B^2);
        end
   end
end
