In this folder, we show the results of the comparison between LogTP and LinTP on the connections model introduced in Jackson & Wolinsky (1996). (in Section 5.3)

# Setup
We assume the agents are located on a circle. That is,  every agent can only make
connections to neighbors. We consider problems with 6, 8, 10, 12, 14 and 16 agents.

For each case, we generated 20 network formation games by
randomly drawing the social values from a standard log-normal distribution and solve each problem with
LogTP and LinTP.  For each problem, we choose η = 0.5, 0.3 or 0.1, and generate three starting points by
choosing 0.1 · 1, 0.5 · 1 and 0.9 · 1 as the prior and σ in LogTP and as the prior in LinTP, where 1 represents
the vector of ones.
The name of file shows the scale of problems. For example, `6.xlsx` records the results for problems with 6 agents.

These results are summarized in Table 2 and Figure 5 in our paper.

# References
1. Jackson MO, Wolinsky A (1996). A strategic model of social and economic networks. Journal of Economic Theory, 71:44–74.
