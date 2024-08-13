# Manual for LogTPm
The LogTPm applies to a special type of network formation games with multi-affine utility functions. They are called mixed extensions of network formation games, analogous
to mixed extensions of non-cooperative games. In these games, each xij is interpreted as the probability that link ij forms and the agents maximize their expected payoff.

# Technical details
The difference between LogTPm and LogTPc is in the computation of the partial derivatives of the utility functions. In mixed-extended problems, the partial derivative of agent i's utility function concerning link ij is irrelevant to the strength of link ij. It depends on the strengths of the rest links and the payoff of the unweighted networks. Based on this observation, we make the computation with the following method:  

- `graphs.m`:  to show the set of all possible unweighed networks.
  
  Input: L, the number of links.
  
  Output: a 2^L × L matrix gra whose each row represents a possible network. 
  
- `values.m`: to compute the payoff vectors in each possible network.
  
  Input: gra, a 2^L × L matrix recording all possible networks derived from `graphs.m`.
  
  Output: a 2^L × N matrix Va whose each row corresponds to the payoff vector.
  
- `def.m`: to compute the partial derivatives of the utility functions with respect to a given network.
  
   Input net: a network in [0,1]^{L}.
  
   Output: an N × N matrix whose (i,j) and (j, i) -th element represents the
   partial derivatives of i's and j's utility functions with respect to link
   ij, respectively.

The rest parts of the codes are the same as LogTPc and we omit their introductions here.


# Application

The codes in this folder handle the coauthor model of Jackson & Wolinsky (1996). When applying LogTPm
to a new model, the codes in `def.m` need not be adjusted . Instead, one has to adjust the formulas in `values.m` that compute the payoff the agents receive from the unweighted networks.

Another version of the connections model of Jackson & Wolisnky (1996) is shown in folder `src\LogTPm\Version: connections`, which is applied in Section 5.3. In this version, we assume the agents are located on a circle and then adjust the codes in `links.m`, `graphs.m`, and `values.m` accordingly. (We rename them by `loop_link.m`, `loop_graph.m` and `loop_values.m`.) In the folder, we remove the redundant copies of codes. To derive the whole software, one has to substitute the files `main.m`, `links.m`, `graphs.m`, and `values.m` with the corresponding ones in `src\LogTPm\Version: connections`. 

# References
1. Jackson MO, Wolinsky A (1996). A strategic model of social and economic networks. Journal of Economic Theory, 71:44–74.

