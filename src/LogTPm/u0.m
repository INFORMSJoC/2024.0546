function z = u0(x,i,j)
%  u0: to compute the elements of the homotopy system at t=0.
%  Input: x, link strength; i in {1,2..L},j in {1,2}, index for the link and player (in the sense of "lin").
%  Output: the 2*i+2-j -th element of the the homotopy system at t=0.
global pri lin Sigma eta

dfp = def(pri);
z = dfp(lin(i,j),lin(i,3-j)) + Sigma(2*i-2+j)*eta/x - (1-Sigma(2*i-2+j))*eta/(1-x);
end
