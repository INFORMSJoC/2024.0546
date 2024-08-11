# Manual for ALogTP
Inspired by the insightful approach of Leung (2020), we develop ALogTP, an accelerated version of LogTP, that applies to problems with a sparse structure.
i.e. the utility function of each agent only depends on his direct connections. 
Its basic idea is to first figure out the links that are surely to be absent or built. These links decompose the whole network into smaller ones, to which we then apply LogTP.

- `main.m`: the main program of ALogTP, including the parameter settings, decomposition
of networks, and the implementation of LogTP to the subnetworks.

- `robust_links.m`: to figure out the robustly absent and built links.
  
  Input: parameters in the model. Take the public provision model of Bramoull´e and
  Kranton (2007) as an example. (in Section 5.4 of our paper) e, the effort
  vector; d > 0, cost for links.
  
  Output: two N × N matrice M and D. A link ij is surely to be absent if
  Mij = 0 or Mji = 0. This link is sure to be established if Dij = 0 and Dji = 0.
  
- `combine.m`: to summarize the results of `robust_link.m` and prepare for the
  decomposition.
  
  Input: the matrice M and D derived from `robust_link.m`.
  
  Output: a N × N matrix ˜D. For link ij, ˜Dij = 0 if the link is surely to be absent
  or built and ˜Dij = 1 otherwise. With this matrix, we can decompose the network
  into smaller ones (via the Matlab function “conncomp(˜D )”).
  
- `search_subproblem.m`: to modify the results of the Matlab function `conncomp`
  in the decomposition step.

  Input: S, the output of “conncomp(˜D)”; D, the N × N matrix derived from `robust_link.m`; num S, the number of connected conponents computed by Matlab
  codes max(S).
  
  Output: group, a matrix of N columns. Each row of the matrix corresponds to
  a subnetwork. Its (i, j)-th element equals to 1 if agent j is included in the i-th
  subnetwork and 0 otherwise.
  
- `solution.m`: to figure out the non-robust links in a subnetwork and then apply
  LogTP to compute the corresponding pairwise stable subnetwork. (to determine
  the strength of the non-robust links).
  
  Input: group, a 1 × N vector that records a subnetwork.

  Output: sol in [0,1]^L, a pairwise stable subnetwork; indicator, the number of nonrobust
  links in this subnetwork.
  
- `path-following.m`: the main program of LogTP, which is applied to the subnetworks.
 
  Input: Link in [0,1]^L, a network where strengths of the links not included in the
  subnetwork equal zero. (In problems with a sparse structure, it makes no difference
  when computing the utility functions and their partial derivatives) The robustly
  absent or built links have strength 0 or 1, respectively. The strengths of the nonrobust
  links in the subnetwork are set as −1.

  Output: PS in [0,1]^L, a pairwise stable subnetwork that we derive from Link by replacing
  the −1’s with the results of LogTP (we do this with the function `insert.m`); num, number of the non-robust links.

  We omit the introductions to the functions applied in LogTP. For more details, one may refer to the file `src/LogTPc/readme.md`.

# Application

The codes in this folder consider the public good provision model of Bramoulle and Kranton (2007). When applying ALogTP to a new problem, one has to adjust the parameters in `main.m` and the formulas in `def.m`.

# References
1. Leung, M. P. (2020). Equilibrium computation in discrete network games. Quantitative Economics, 11:1325–1347.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.

