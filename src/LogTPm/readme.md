# Manual for LogTPm
The LogTPm applies to a special type of network formation games with multi-affine
utility functions. They are called mixed extension of network formation games, analogous
to mixed extension of non-cooperative games. In these games, each xij is interpreted as the probability that link ij forms and the agents maximize their expected payoff.
We show the main program in `main.m`, which includes the parameter settings and the
implementation of the path-following method. 

Since the utility functions are multi-linear, their partial deriatives are determined by the payoff the agents receive from the unweighted networks.
The partial deriatives can be derived with the codes in:
- `graphs.m`: this function returns a 2^L × L matrix, each of whose rows corresponds
to an unweighted network that may form.
- `values.m`: this function returns a 2^L × N matrix, whose i-th row gives the payoff
vector of all agents in the unweighted network given by the i-th row of the output
of “graphs.m”.


The codes in this folder handle the coauthor model of Jackson & Wolinsky (1996). When applied to
a new problem, one only has to adjust the formulas in `values.m` apart from necessary
adjustments to the parameters in `main.m`.

# References
1. Jackson MO, Wolinsky A (1996). A strategic model of social and economic networks. Journal of Economic Theory, 71:44–74.
