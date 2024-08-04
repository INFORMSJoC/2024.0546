[![INFORMS Journal on Computing Logo](https://INFORMSJoC.github.io/logos/INFORMS_Journal_on_Computing_Header.jpg)](https://pubsonline.informs.org/journal/ijoc)

# Pairwise Stability in Weighted Network Formation Games: Selection and Computation

This archive is distributed in association with the [INFORMS Journal on
Computing](https://pubsonline.informs.org/journal/ijoc) under the [MIT License](LICENSE).

The software and data in this repository are a snapshot of the software and data
that were used in the research reported on in the paper 
[Pairwise Stability in Weighted Network Formation Games: Selection and Computation](https://doi.org/10.1287/ijoc.2024.0546) by Caihua Chen, Junhao Tao and Yang Zhan. 

## Cite

To cite the contents of this repository, please cite both the paper and this repo, using their respective DOIs.

https://doi.org/10.1287/ijoc.2024.0546

https://doi.org/10.1287/ijoc.2024.0546.cd

Below is the BibTex for citing this snapshot of the repository.

```
@misc{PSWNFG,
  author =        {Caihua Chen and Junhao Tao and Yang Zhan},
  publisher =     {INFORMS Journal on Computing},
  title =         {Pairwise Stability in Weighted Network Formation Games: Selection and Computation},
  year =          {2024},
  doi =           {10.1287/ijoc.2024.0546.cd},
  url =           {https://github.com/INFORMSJoC/2024.0546},
  note =          {Available for download at https://github.com/INFORMSJoC/2024.0546},
}  
```

## Description

A path-following algorithm works in MatLab software for computing pairwise stable networks. This repository includes the source code and computational results for all randomly generated numerical instances presented in the paper. For more details of pairwise stability and our algorithm, one can refer to the file `Manual.pdf` or our paper.

## Code files
In the folder `src`, we show the codes of our algorithm LogTP. More precisely, LogTP has different versions that apply to different problems.

`LogTPc`: an algorithm for problems that agents all have concave and differentiable utility functions, used in Section 5.2 and 5.4 of the paper.

`LogTPm`: an algorithm for problems of mixed-extension, agents all have multi-linear utility functions, used in Section 5.1 and 5.3 of the paper.

`Comp/ALogTP`: an accelerated version of LogTP that applies to problems with a sparse structure. i.e. only direct connections matter. ALogTP is used in Section 5.4 of the paper.

## Results files

This results folder contains the numerical results of algorithms mainly reported in Section 5 of the paper.

`co-author`: algorithm 'LogTPm' for the co-author model introduced in Jackson & Wolinsky (1996), reported in Section 5.1.

`patent-race`: algorithm 'LogTPc' for the patent race network problem introduced in Goyal & Joshi (2006) and Bich & Morhaim (2020), reported in Section 5.2.

`connections`: the comparison between algorithms 'LogTPm' and 'Comp/LinTP' for the connections model introduced in Jackson & Wolinsky (1996), reported in Section 5.3.

`public-good`: the comparison among algorithms 'LogTPm', 'Comp/DaE' and 'Comp/ALogTP' for the public good provision network problem introduced in Bramoulle and Kranton (2007), reported in Section 5.4.

`Convergence to LinTP`: an example that shows the convergence of LogTP to LinTP as η approaches 0, reported in Section 4.2.

## Replicating

To replicate the results in Figure 1, apply `plot1.m` in folder `results/convergence to LinTP`.

To replicate the results in Figure 2 and 3, apply `main.m` in folder `src/LogTPm`.

To replicate the results in Table 1 and Figure 4, apply `main.m` and `check_PS.m` in folder `src/LogTPc`.

To replicate the results in Table 2 and Figure 5, apply the codes in folder `src/LogTPm/connections` and `src/Comp/LinTP`.

To replicate the results in Table 3, apply the codes in folder `src/LogTPc/public-good`and `src/Comp/DAE'.

To replicate the results in Table 4 and 5 and Figure 6, apply the codes in folder `src/LogTPc/public-good` and `src/Comp/ALogTP`.

# References
1. Bich P, Morhaim L (2020). On the existence of pairwise stable weighted networks. Mathematics of Operations Research, 45:1393–1404.
2. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.
3. Goyal S, Joshi S (2006). Unequal connections. International Journal of Game Theory, 34:319–349.
4. Jackson MO, Wolinsky A (1996). A strategic model of social and economic networks. Journal of Economic Theory, 71:44–74.
