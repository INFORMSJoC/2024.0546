# LogTPm for a connections model
In this folder, we show the version of LogTPm applied to a connections model of Jackson & Wolinsky (1996), discussed in Section 5.3. In this version, we assume the agents are located on a circle and adjust the codes in `links.m`, `graphs.m` and `values.m` accordingly. We rename them by `loop_link.m`, `loop_graph.m` and `loop_values.m`. We avoid the redundant copies of codes. To derive the whole software, one has to substitute the files `main.m`, `links.m`, `graphs.m`, and `values.m` in `src/LogTPm` with the corresponding ones here. Also one has to add the code file `floyd.m`.

# Technical details
- `main.m`: the main program of LogTPm, including the parameter setting in the connections model.
  
- `floyd.m`: to compute the shortest distance between the agents in a given network with the well-known floyd algorithm. We require these data later in `loop_values.m`.

  Input: net, a network in [0,1]^L; N, number of players.

  Output: an N × N matrix whose (i,j)-th element represents the shortest
 distance between agent i and j in the network net.

  
- `loop_link.m`: to show the set of all possible links when assuming the agents are located on a circle.
  
	 Input: numP, number of players.
  
	 Output: a numP × 2 matrix lin whose each row represents a possible link. For example, the row given by (i,j) represents the link between agent i and j. 

- `loop_graph.m`:  to show the set of all possible unweighed networks when assuming the agents are located on a circle.
  
  Input: L, the number of links.
  
  Output: a 2^L × L matrix whose each row represents a possible network. 
  
- `loop_values.m`: to compute the payoff vectors in each possible network when assuming the agents are located on a circle.
  
  Input: gra, a 2^L × L matrix recording all possible networks derived from `loop_graph.m`; w, a 1 × N vector of social values in the connections model.
  
  Output: a 2^L × N matrix whose each row corresponds to the payoff vector.

# References
1.Jackson MO, Wolinsky A (1996). A strategic model of social and economic networks. Journal of Economic Theory, 71:44–74.
