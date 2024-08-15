# Manual for LinTP
LinTP is the algorithm of Herings & Zhan (2024) that computes pairwise stable networks in problems of mixed extension where agents all have multi-linear utility functions. 

In this folder, we show our implementation of LinTP and distribute it along with our algorithm LogTP.
Both LinTP and LogTP use the predictor-corrector method to numerically trace the homotopy paths. However, their paths are determined by different homotopy systems. 

We compare LinTP with LogTP, more precisely LogTPm, in Section 5.3 of the paper on a connections model of Jackson & Wolinsky (1996).

# Technical details
- `main.m`: the main program of LinTP, including the parameter settings and the
  implementation of the predictor-corrector method.

- `loop_link.m`: to show the set of all possible links when assuming the agents are located on a circle.
  
	 Input: numP, number of players.
  
	 Output: a numP × 2 matrix lin whose each row represents a possible link. For example, the row given by (i,j) represents the link between agent i and j. 

- `loop_graph.m`:  to show the set of all possible unweighed networks when assuming the agents are located on a circle.
  
  Input: L, the number of links.
  
  Output: a 2^L × L matrix gra whose each row represents a possible network. (global variable)
  
- `loop_values.m`: to compute the payoff vectors in each possible network when assuming the agents are located on a circle.
  
  Input: gra, a 2^L × L matrix recording all possible networks; w, a 1 × N vector of social values in the connections model.
  
  Output: a 2^L × N matrix Va whose each row corresponds to the payoff vector.

- `startingpoint.m`: to determine the starting point of the homotopy path.
  
	Input: p in [0,1]^L, a prior.

	Output: z in [0,1]^{4L+1}, the starting point of the path.
  
- `def.m`: To compute the partial derivatives of the utility functions for a given network.
  
   Input: net, a network in [0,1]^{L}.
  
   Output: an N × N matrix whose (i,j) and (j,i) -th element represents the partial derivatives of i's and j's utility functions concerning link ij, respectively.


- `homof.m`: to compute the homotopy system.
  
   Input: x, a point in [0,1]^{4L+1}.
  
   Output: y, the value of the homotopy system (in [0,1]^{4L}).

- `ahomof.m`: the system of equations to solve in the corrector step.
  
   Input: x, a point in [0,1]^{4L+1}.

   Output: y, the value of the system of equations in the corrector step (in [0,1]^{4L+1}).

# References
1. Herings PJJ, Zhan Y (2024) The computation of pairwise stable networks. Mathematical Programming 203:443–473.
2. Jackson MO, Wolinsky A (1996) A strategic model of social and economic networks. Journal of Economic Theory 71:44–74.
