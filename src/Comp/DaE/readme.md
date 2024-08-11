# Manual for DAE
DAE is the insightful approach of Leung (2020) that computes pairwise stable networks in problems with a sparse structure.
i.e. the utility function of each agent only depends on his direct connections. 
Its basic idea is to first figure out the links that are surely to be absent or built. These links decompose the whole network into smaller ones, to which we then conduct an exhaustive searching.

In this folder, we show our implementation of DAE and distribute it along with our algorithm LogTP.

- `main.m`: the main program of DAE, including the parameter settings, decomposition
of networks, and the implementation of LogTP to the subnetworks.

- `dvalue.m`: to compute the difference of payoff in a given network.
 
   Input: N, e, d, parameters for the problem; net in [0,1]^L, a given
  network; i, j, the corresponding agents; lin, output of `link.m`.
  
  Output: y, the difference (between the cases xij = 1 ad xij=0) of agent i's payoff functions in a given network.

- `value_ind.m`: to compute the payoff of a particular agent in a given
 network.

  Input: N, number of players; e, d, parameters of the model; net in
  [0,1]^L, a given network; i, index for the player.
 
  Output: the payoff of agent i in network net.

- `robust_links.m`: to figure out the robustly absent and built links.
  
  Input: N, number of players and other parameters in the model. Take the public provision model of Bramoull´e and
  Kranton (2007) as an example. (in Section 5.4 of our paper) e, the effort
  vector; d > 0, cost for links.
  
  Output: two N × N matrice M and D. A link ij is surely to be absent if
  Mij = 0 or Mji = 0. This link is sure to be established if Dij = 0 and Dji = 0.
  
- `combine.m`: to summarize the results of `robust_link.m` and prepare for the
  decomposition.
  
  Input: N, number of players; the matrice M and D derived from `robust_link.m`.
  
  Output: a N × N matrix ˜D. For link ij, ˜Dij = 0 if the link is surely to be absent
  or built and ˜Dij = 1 otherwise. With this matrix, we can decompose the network
  into smaller ones (via the Matlab function “conncomp(˜D )”).
  
- `search_subproblem.m`: to modify the results of the Matlab function `conncomp`
  in the decomposition step.

  Input: N, number of players; S, the output of “conncomp(˜D)”; D, the N × N matrix derived from `robust_link.m`; num S, the number of connected conponents       
  computed by Matlab codes max(S).
  
  Output: group, a matrix of N columns. Each row of the matrix corresponds to
  a subnetwork. Its (i, j)-th element equals 1 if agent j is included in the i-th
  subnetwork and 0 otherwise.
  
- `solution1.m`: to figure out the non-robust links in a subnetwork and then conduct an exhaustive searching. (in this process, we label all the candidate networks with the function `decom`).
  
  Input: group, a 1 × N vector that records a subnetwork.

  Output: sol, a subset of [0,1]^L that reports all pairwise stable subnetworks; indicator, the number of nonrobust
  links in this subnetwork.


# Application
We compare DAE with our algorithm LogTP in Section 5.4 of our paper on a public good provision model of Bramoulle & Kranton (2007).

# References
1. Leung, M. P. (2020). Equilibrium computation in discrete network games. Quantitative Economics, 11:1325–1347.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.
