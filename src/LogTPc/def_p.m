function z = def_p(x0)
%decision under prior p
global pri N lin L alpha
   z = zeros(2*L,1); % record the partial deriative 
    
   for i = 1:L
        for j=1:2
            x = pri;
            x(i) = x0(2*i-2+j);
            net = zeros(N,N);
            for k = 1:L
                net(lin(k,1),lin(k,2)) = x(k);
                net(lin(k,2),lin(k,1)) = x(k);
            end
            A = zeros(1,N);
            B = 0;
            for k = 1:N
                A(k) = alpha(k) + sum(net(k,:));
                B = B+log(A(k));
            end
            
            
            z(2*i-2+j) = 1/(B*A(lin(i,j))) - (log(A(lin(i,j)))*(1/A(lin(i,j))+1/A(lin(i,3-j))))/(B^2);
        end
    end

end
