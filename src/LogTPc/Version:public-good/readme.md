# LogTPc for a public good provision model
In this folder, we show the version of LogTPc applied to a public-good provision model of Bramoulle & Kranton (2007), discussed in Section 5.4.  We remove the redundant copies of codes. To derive the whole software, we only have to substitute the code files `main.m`, `def.m`, and `u0.m` in `src/LogTPc` with the corresponding ones here. Also, one has to add the function `b.m` and `db.m` which are required to compute the utility functions and their partial derivatives.

# References
1. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.
