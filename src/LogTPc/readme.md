# Manual for LogTPc
We develop the algorithm LogTPc that applies to network formation games with concave and differentiable utility functions.
In its implement, we require the following code files:

- `main.m`: the main program of LogTP, including the parameter settings and the
implementation of the predictor-corrector method.
- `links.m`: this function returns a L × 2 matrix, each of whose rows corresponds to
a link. For example, the row with elements 1, 2 denotes the link between agent 1
and 2.
- `def.m`: this functions returns the partial deriatives of the utility functions with respect to the actual network x.
- `def_p.m`: this functions returns the partial deriatives of the utility functions with respect to the prior p.

The codes in this folder handle a patent race model of Goyal & Joshi (2006). When applying LogTPc to a new problem, 
one has to adjust the parameters in `main.m` and the formulas in `def.m` and `def_p.m`. Another version for the public good provision model of Bramoulle & Kranton (2007) is shown in folder `public-good`.

As argued in our paper, the utility functions in the patent race model sometimes are not concave. That is, the algorithm may 
end at some networks that are not pairwise stable. To solve this problem, we draw the graphs of the utility functions via `check_PS.m`. With the graphs, one can
easily check pairwise stability of a certain network, according to our Theorem 2.

# References
1. Goyal S, Joshi S (2006). Unequal connections. International Journal of Game Theory, 34:319–349.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.
