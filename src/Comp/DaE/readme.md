# Manual for DAE
DAE is the insightful approach of Leung (2020) that computes pairwise stable networks. This algorithm handles problems with a sparse structure.
i.e. the utility function of each agent only depends on his direct connections. 
Its basic idea is to first figure out the links that are surely to be absent or built. These links decompose the whole network into smaller ones, to which we then 
conduct an exhaustive searching. 

We compare DAE with our algorithm LogTP in Section 5.4 of our paper upon a public good provision model of Bramoulle & Kranton (2007).

# References
1. Leung, M. P. (2020). Equilibrium computation in discrete network games. Quantitative Economics, 11:1325–1347.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.
