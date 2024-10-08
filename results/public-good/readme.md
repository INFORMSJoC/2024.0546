In this folder, we show the numercial results on the public good provision model of Bramoulle & Kranton (2007), including comparision among LogTP, DAE and ALogTP. (in Section 5.4)

# Setup
For each n (scale of problem), we generate 20 random problems. 
The name of file shows the scale of problems. For example, `6.xlsx` records the results for problems with 6 agents.

For smaller-scaled problems(n = 6, 8 and 10), we solve each of them with DAE and LogTP. For LogTP, each problem is solved with 5 random starting points.
The results are shown in Table 3 in our paper.

For larger-scaled problems (n>10), the implement of DAE can be quite time-consuming. We then apply LogTP and ALogTP. 
For each random problem, we choose 5 random starting points for both algorithms. These results are summarized in Table 4 in our paper.

In figure 6-1 and 6-2, we show an example where DAE and LogTP yield different solutions.

# References
1. Bramoulle Y, Kranton R (2007). Public goods in networks. Journal of Economic Theory, 135:478–494.

