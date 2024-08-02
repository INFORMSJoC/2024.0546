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

The codes in this folder handle a patent race model of Goyal & Joshi (2006). When applying LogTP to a new problem, 
one has to adjust the parameters in main.m and the formulas in def.m and def p.m.

# References
1. Goyal S, Joshi S (2006). Unequal connections. International Journal of Game Theory, 34:319–349.
