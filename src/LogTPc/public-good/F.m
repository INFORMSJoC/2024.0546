function y = F(t,x1,x2,p1,p2,eta,i)
%F combine the favorite strength via the decision of link players
global Sigma L
    A = t*x1-t*x2 + (1-t)*p1 - (1-t)*p2 ;
    B = (1-t)*eta;
    C = 1/2-(A+2*B-4*B*Sigma(2*L+i))/(2*(B+sqrt((A+B)^2-4*A*B*Sigma(2*L+i))));
    y = C*x1 + (1-C)*x2;
    if isnan(y)
        y = min(x1,x2);
    end
end

