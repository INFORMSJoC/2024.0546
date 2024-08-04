function z = u0(x,i,j)
global pri N M lin L Sigma eta alpha
dfp = def(pri);

z = dfp(lin(i,j),lin(i,3-j)) + Sigma(2*i-2+j)*eta/x - (1-Sigma(2*i-2+j))*eta/(1-x);

end