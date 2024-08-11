function f = ahomof(x,Link)
% ahomof: the system of equations in the corrector step
% Input: x, a point in [0,1]^{2num+1} (num is the number of non-robust links in this subnetwork);
% Link in [0,1]^L, a vector that records the structure of a subnetwork. (where strengths of the links not included in the
% subnetwork equal zero. The robustly absent or built links have strength 0 or 1, respectively. The strengths of the nonrobust
% links in the subnetwork are set as −1.) 
% Output: y, the value of the system of equations in the corrector step (in [0,1]^{2num+1})
global d0 b0

f = [
    homof(x,Link);
    d0'*x - b0
    ];
