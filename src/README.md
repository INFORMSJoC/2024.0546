This `src` folder contains codes of five algorithms for computing pairwise stable networks. 
1. `LogTPc`: an algorithm for problems that agents all have concave and differentiable utility functions, used in Section 5.2 and 5.4 of the paper.
2. `LogTPm`: an algorithm for problems of mixed-extension, agents all have multi-linear utility functions, used in Section 5.1 and 5.3 of the paper.
3. `Comp/LinTP`: the algorithm of Herings & Zhan (2024), used in Section 5.3 for comparison.
4. `Comp/DaE`: the algorithm of Leung (2020), used in Section 5.4 for comparison.
5. `Comp/ALogTP`: the accelerated version of our algorithm that exploits the algorithm of Leung (2020), used in Section 5.4 of the paper.

Note that LogTP and ALogTP are the algorithms we develop in the paper. For DaE and LinTP, we show our own implementation and distribute them.

For a more detailed introduction to our algorithm, see the file `src/Manual.pdf` or use the help function in Matlab.

# References
1. Herings PJJ, Zhan Y (2024). The computation of pairwise stable networks. Mathematical Programming, 203:443–473.
2. Leung MP (2020). Equilibrium computation in discrete network games. Quantitative Economics, 11:1325–1347.
