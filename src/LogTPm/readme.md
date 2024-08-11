
# Manual for LogTPm
The LogTPm applies to a special type of network formation games with multi-affine
utility functions. They are called mixed extension of network formation games, analogous
to mixed extension of non-cooperative games. In these games, each xij is interpreted as the probability that link ij forms and the agents maximize their expected payoff.

Since the utility functions are multi-linear, their partial deriatives are determined by the payoff the agents receive from the unweighted networks.
We computeTte partial derivatives with the codes in:

- `graphs.m`:  to show the set of all possible unweighed networks.
  
  Input: L, the number of links.
  
  Output: a 2^L×L matrix gra whose each row represents a possible network. (global
  variable)
  
- `values.m`: to compute the payoff vectors in each possible network.
  
  Input: gra, a 2^L×L matrix recording all possible networks derived from `graphs.m`.
  
  Output: a 2^L × N matrix Va whose each row corresponds to the payoff vector.
  
- `def.m`: To compute the partial deriatives of the utility functions with respect to a given network.
  
   Input net: a network in [0,1]^{L}.
  
   Output: a N*N matrix whose (i,j) and (j,i) -th element represents the
   partial derivatives of i's and j's utility functions with respect to link
   ij, respectively.

The rest parts of the codes are the same as LogTPc.

- `main.m`: the main program of LogTPm, including the parameter settings and the
  implementation of the predictor-corrector method.

- `links.m`: to show the set of all possible links.
  
	 Input: numP, number of players.
  
	 Output: a numP*2 matrix lin whose each row represents a possible link. For example, the row given by (i,j) represents the link between agent i and j. 

- `init.m`:  to search for the starting point of the homotopy path.
  
   Input: none.
  
   Output: a 2L*1 vector y such that [y;0] is the starting point of the
   homotopy path

- `u0.m`: to compute the elements of the homotopy system at t=0.
  
  Input: x, link strength; i in {1,2..L}, j in {1,2}, index for the link and player (in the sense of "lin").
  
  Output: the 2*i-2+j -th element of the homotopy system at t=0.

- `F.m`: to combine the favorite strength via the decision of link players.

   Input: t in [0,1], t-value; s in [0,1]^{2L}, the vector of favorite
   strengths; p in [0,1]^{3L}, the prior.
 
   Output: y in [0,1]^L, a network derived from the decision of link
   players (by combining the favorite strengths of different agents upon the same link).

- `homof.m`: to compute the homotopy system.
  
   Input x: the point x in [0,1]^{2L+1}.
  
   Output y: the value of the homotopy system (in [0,1]^{2L}).

- `ahomof.m`: the system of equations in the corrector step.
  
   Input x: the point x in [0,1]^{2L+1}.

   Output y: the value of the system of equations in the corrector step (in [0,1]^{2L+1}).

# Application

The codes in this folder handle the coauthor model of Jackson & Wolinsky (1996). When applied to
a new problem, one only has to adjust the formulas in `values.m` apart from necessary
adjustments to the parameters in `main.m`. Another version for the connections model of Jackson & Wolisnky (1996) is shown in folder `Version:connections`, which is applied in Section 5.3.

# References
1. Jackson MO, Wolinsky A (1996). A strategic model of social and economic networks. Journal of Economic Theory, 71:44–74.
