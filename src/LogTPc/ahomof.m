function f = ahomof(x)
% ahomof: the system of equations in the corrector step.
% Input: x, a point in [0,1]^{2L+1}.
% Output: f, the value of the system of equations in the corrector step (in [0,1]^{2L+1}).
global d0 b0

f = [
    homof(x)
    d0'*x - b0
    ];
