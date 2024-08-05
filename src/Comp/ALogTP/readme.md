# Manual for ALogTP
Inspired by the insightful approach of Leung (2020), we develop ALogTP, an accelerated version of LogTP, that applies to problems with a sparse structure.
i.e. the utility function of each agent only depends on his direct connections. 
Its basic idea is to first figure out the links that are surely to be absent or built. These links decompose the whole network into smaller ones, to which we then apply LogTP.

There are some code files that are of importance:
- `main.m`: the main program of ALogTP, including the parameter settings, decomposition
of networks, and the implementation of LogTP to the subnetworks.
- `links.m`: this function returns a L × 2 matrix, each of whose rows corresponds to
a link. For example, the row with elements 1, 2 denotes the link between agent 1
and 2.
- `def.m`: this functions returns the partial deriatives of the utility functions with respect to the actual network x.
- `def_p.m`: this functions returns the partial deriatives of the utility functions with respect to the prior p.
- `robust_links.m`: this function returns two N ×N matrix M and D that help figure
out the links surely to be absent or built. A link ij ∈ L is surely to be absent if
Mij = 0 or Mji = 0. A link is surely to be established if Dij = 0 and Dji = 0.
- `combine.m`: this function combines M and D and returns a new N × N matrix
˜D
. For ij ∈ L, ˜Dij = 0 if the link is surely to be absent or built and ˜Dij = 1
otherwise. With this matrix, we can decompose the network into smaller ones (via
the Matlab function “conncomp”).
- `search_subproblem.m`: this function generates a matrix of N columns from the
output of the matlab function “conncomp”. The number of its rows equals the
number of subnetworks. Each of its rows indicates the agents involved in the
corresponding subnetwork.
- `solution2.m` & `path_following.m`: in these two functions we apply LogTP to the
subnetworks.

The codes in this folder consider the public good provision model of Bramoulle and Kranton (2007). When applying ALogTP to a new problem, one has to adjust the parameters in 
`main.m` and the formulas in `def.m` and `def_p.m`.

# References
1. Leung, M. P. (2020). Equilibrium computation in discrete network games. Quantitative Economics, 11:1325–1347.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.
