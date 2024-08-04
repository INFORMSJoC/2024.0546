function f = ahomof(x)

global d0 b0

f = [
    homof(x);
    d0'*x - b0
    ];