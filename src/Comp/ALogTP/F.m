function y = F(t,x1,x2,p1,p2,eta,i,num,Sigma)
%F combine the favorite strength via the decision of link players
    A = t*x1-t*x2 + (1-t)*p1 - (1-t)*p2 ;
    B = (1-t)*eta;
    C = (A+B-sqrt((A+B)^2-4*A*B*Sigma(2*num+i)))/(2*A);
    y = C*x1 + (1-C)*x2;
    if isnan(y)
        y = min(x1,x2);
    end
end

