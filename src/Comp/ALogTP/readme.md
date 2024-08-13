# Manual for ALogTP
Inspired by the approach of Leung (2020), we developed ALogTP, an accelerated version of LogTP, that applies to problems with a sparse structure.
i.e. the utility function of each agent only depends on his direct connections. 
Its basic idea is to first figure out the links that are sure to be absent or built. These links decompose the whole network into smaller ones, to which we then apply LogTP.

# Outline
We first figure the robust links in the problem with the functions `robust links.m`
and `combine.m`. Then we decompose the network into smaller ones with the
Matlab function `conncomp` and figure out the agents involved in the subnetworks
with `search subproblem.m`. Finally, we apply LogTP to the subnetworks via
functions `solution.m` and `path-following.m`.

# Technical details

- `main.m`: the main program of ALogTP, including the parameter settings, decomposition
of networks, and the implementation of LogTP to the subnetworks.

- `robust_links.m`: to figure out the robustly absent and built links.
  
  Input: parameters in the model. Take the public provision model of Bramoull´e and
  Kranton (2007) as an example. (in Section 5.4 of our paper) e, the effort
  vector; d > 0, cost for links.
  
  Output: two N × N matrice M and D. A link ij is surely to be absent if
  Mij = 0 or Mji = 0. This link is sure to be established if Dij = 0 and Dji = 0.
  
- `combine.m`: to summarize the results of `robust_link.m` and distinguish between
the non-robust links and the robust ones.
  
  Input: the matrice M and D derived from `robust_link.m`.
  
  Output: an N × N symmetric matrix ˜D. For link ij, ˜Dij = 0 if the link is surely to be absent
  or built and ˜Dij = 1 otherwise. The matrix ˜D can be viewed as the
  adjacency matrix of an undirect graph, whose connected components provide the
  subproblems. We figure out the connected components via the Matlab function
  `conncomp`.
  
- `search subproblem.m`: to figure out the agents involved in each subproblem. A
  subproblem contains the agents in a connected component of the graph given by
  ˜D and the agents connected to them via a robustly built link.
  
  Input: a 1 × N vector S, the output of “conncomp(˜D )”; D, the N × N matrix
  derived from “robust link.m”; num S, the number of connected conponents.
  
  Output: group, a matrix of N columns. Each row of the matrix corresponds to
  a subnetwork. Its (i, j)-th element equals 1 if agent j is contained in the i-th
  subnetwork and 0 otherwise.
  
- `solution.m`: to figure out a pairwise stable subnetwork with LogTP. To do so,
  we first generate a vector Link in [0,1]^L that records the structure of the subnetwork.
  Precisely, the strengths of the links not included in the subnetwork equal zero.
  (In problems with a sparse structure, it makes no difference when computing the
  utility functions and their partial derivatives) The robustly absent or built links
  have strength 0 or 1, respectively. The strengths of the non-robust links in the
  subnetwork are set as −1. The number of non-robust links is denoted by num.
  The subproblem is then tackled with `path-following.m` the main program of
  LogTP, with input Link in [0,1]^L.

  Input: group, a 1 × N vector that records players in a subnetwork.
  Output: sol in [0,1]^L, a pairwise stable subnetwork; num, the number of non-robust
  links in this subnetwork.
  
- `insert.m`: to combine the strengths of the nonrobust links and robust ones.
  
  Input: x in [0, 1]^num, a vector recording the strengths of the non-robust links;
  Link in [0,1]^L, a vector that records the structure of the subnetwork.
  
  Output: a network in [0,1]^L derived from Link by replacing the −1s with the elements
  in x.
  
- `path-following.m`: the main program of LogTP, which is applied to the subnetworks.
Here we handle a homotopy system of 2num dimensions, corresponding to
the non-robust links. There are a few adjustments to the codes when computing
the partial derivatives of the utility functions: we have to combine the strengths
of the non-robust links and the robust ones with the Matlab function `insert.m`
before the computation. The rest technical details are the same as the basic version
LogTPc.

Input: Link in [0,1]^L, a network records the structure of the subnetwork.

Output: PS in [0,1]^L, a pairwise stable subnetwork that we derive from Link by
replacing the −1’s with the results of LogTP; num, number of the non-robust links.

We omit the introductions to the functions applied in LogTP. For more details, one may refer to the file `src/LogTPc/readme.md` or `src/Manual.pdf`.

# Application

The codes in this folder consider the public good provision model of Bramoulle and Kranton (2007). When applying ALogTP to a new problem, one has to adjust the parameters in `main.m` and the formulas in `robust_links.m` and `def.m`.

# References
1. Leung, M. P. (2020). Equilibrium computation in discrete network games. Quantitative Economics, 11:1325–1347.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.
