function y = F(t,s,p)
%F: to combine the favorite strength via the decision of link players.
% Input: t in [0,1], t-value; s in [0,1]^{2num}, the vector of favorite
% strengths; p in [0,1]^{3num}, the prior.
% Output: y in [0,1]^num, a network derived from the decision of link
% players (by combining the favorite strengths of different agents upon the same link)
global Sigma num eta M
    y = zeros(num,1);
    
    for i = 1:num
        A = t*s(2*i-1)-t*s(2*i) + (1-t)*p(2*i-1) - (1-t)*p(2*i) ;
        B = (1-t)*eta;
        C = 1/2-(A+2*B-4*B*Sigma(2*num+i))/(2*(B+sqrt((A+B)^2-4*A*B*Sigma(2*num+i))));
        y(i) = C*s(2*i-1) + (1-C)*s(2*i);
        if isnan(y(i))
            y(i) = min(s(2*i-1),s(2*i));
        end
    end
end
