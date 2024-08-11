# Manual for LinTP
LinTP is the algorithm of Herings & Zhan (2024) that computes pairwise stable networks in problems of mixed-extension where agents all have multi-linear utility functions. 
Herings & Zhan (2024) establish the equivalent between pairwise stable networks and Nash equilibria of certain noncooperative games. They then apply the linear tracing procedure
of Harsanyi & Selten (1988) to select and compute the pairwise stable networks.

LinTP is similar to LogTPc since it also applies a predictor-corrector method to numerically trace a homotopy path. The only difference is that their path is determined by a homotopy system of a higher dimension.

We compare LinTP with our algorithm LogTP in Section 5.3 of our paper upon a connections model of Jackson & Wolinsky (1996).

- `main.m`: the main program of LinTP, including the parameter settings and the
  implementation of the predictor-corrector method.

- `loop_link.m`: to show the set of all possible links when assuming the agents are located on a circle.
  
	 Input: numP, number of players.
  
	 Output: a numP*2 matrix lin whose each row represents a possible link. For example, the row given by (i,j) represents the link between agent i and j. 

- `loop_graphs.m`:  to show the set of all possible unweighed networks when assuming the agents are located on a circle.
  
  Input: L, the number of links.
  
  Output: a 2^L×L matrix gra whose each row represents a possible network. (global
  variable)
  
- `loop_values.m`: to compute the payoff vectors in each possible network when assuming the agents are located on a circle.
  
  Input: gra, a 2^L×L matrix recording all possible networks derived from `graphs.m`.
  
  Output: a 2^L × N matrix Va whose each row corresponds to the payoff vector.
  
- `def.m`: To compute the partial deriatives of the utility functions with respect to a given network.
  
   Input net: a network in [0,1]^{L}.
  
   Output: a N*N matrix whose (i,j) and (j,i) -th element represents the
   partial derivatives of i's and j's utility functions with respect to link
   ij, respectively.


- `homof.m`: to compute the homotopy system.
  
   Input x: the point x in [0,1]^{4L+1}.
  
   Output y: the value of the homotopy system (in [0,1]^{4L}).

- `ahomof.m`: the system of equations in the corrector step.
  
   Input x: the point x in [0,1]^{4L+1}.

   Output y: the value of the system of equations in the corrector step (in [0,1]^{4L+1}).

# References
1. Herings PJJ, Zhan Y (2024) The computation of pairwise stable networks. Mathematical Programming 203:443–473.
2. Harsanyi JC, Selten R (1988) A general theory of equilibrium selection in games (Cambridge: MIT Press).
3. Jackson MO, Wolinsky A (1996) A strategic model of social and economic networks. Journal of Economic Theory 71:44–74.
