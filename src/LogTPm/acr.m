function y = acr(x)
%accuracy for fsolve
if x < 0.9
y = 1/(100+99900*x/0.9);
else 
    y=1e-5;
end

