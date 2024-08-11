# Manual for LogTPc
We develop the algorithm LogTPc that applies to network formation games with concave and differentiable utility functions.
In its implement, we require the following code files:

- `main.m`: the main program of LogTPc, including the parameter settings and the
implementation of the predictor-corrector method.

- `links.m`: to show the set of all possible links.
  
	Input: N, number of players.
  
	Output: a L*2 matrix lin whose each row represents a possible link. For
 	example, the row given by (i,j) represents the link between agent i and j. 

- `init.m`:  to search for the starting point of the homotopy path.
  
 	Input: none.
 
	Output: a 2L*1 vector y such that [y;0] is the starting point of the
 	homotopy path.

- `u0.m`: to compute the elements of the homotopy system at t=0.
  
  	Input: x, link strength; i in {1,2..L}, j in {1,2}, index for the link and player (in the sense of "lin").
  
	Output: the 2*i-2+j -th element of the homotopy system at t=0.

- `F.m`: to combine the favorite strength via the decision of link players.
 
 	Input: t in [0,1], t-value; s in [0,1]^{2L}, the vector of favorite
 	strengths; p in [0,1]^{3L}, the prior.

 	Output: y in [0,1]^L, a network derived from the decision of link
 	players (by combining the favorite strengths of different agents upon the same link).

- `def.m`: to compute the partial derivatives of the utility functions at point s in [0,1]^{2L} with
 respect to a given network x.

 	Input: s in [0,1]^{2L}, the vector of favorite strengths; x: a network in
 	in [0,1]^{L}.
 
 	Output: a N*N matrix whose (i,j) and (j,i) -th element equals to the
	partial derivatives of agent i and j's utility functions with respect to
	link ij, respectively.

- `homof.m`: to compute the homotopy system.
  
 	Input: x, the point x in [0,1]^{2L+1}.

 	Output: y, the value of the homotopy system (in [0,1]^{2L}).

- `ahomof.m`: the system of equations in the corrector step.
 
 	Input: x, the point x in [0,1]^{2L+1}.

 	Output: y, the value of the system of equations in the corrector step (in [0,1]^{2L+1}).



# Application
The codes in this folder handle a patent race model of Goyal & Joshi (2006). As argued in our paper, the utility functions in the patent race model are sometimes not concave. As a result, the algorithm may end at some networks that are not pairwise stable. To solve this problem, we draw the graphs of the utility functions via `check_PS.m`. With the graphs, one can easily check the pairwise stability of a certain network, according to our Theorem 2.

When applying LogTPc to a new problem, one has to adjust the parameters in `main.m` and the formulas in `def.m`. We show an example in folder  `Version:public-good`. This version applies to the public good provision model of Bramoulle & Kranton (2007), which is investigated in Section 5.4 of our paper. (It is different from the version shown in `src/LogTPc` in the parameter settings in `main.m` and formulas in `def.m`.)


# References
1. Goyal S, Joshi S (2006). Unequal connections. International Journal of Game Theory, 34:319–349.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.

