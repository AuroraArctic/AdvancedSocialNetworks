# 09-Statistical Tests on Nodal Level

Class: Advanced Social Networks
Created: November 10, 2021 6:10 PM
Reviewed: Yes
Transcripted: No

## Classic Approach

### Correlation

The correlation coefficient measures the association between two interval or ratio variables. 

Consider two variables $x_i$ and $y_i$. How are two continuous variables related? The correlation could be positive if increases, null if there is none and negative if decreases:

$$
r_{xy} = \frac{1}{n-1}\sum^n_{i=1} \frac{(x_i-\bar{x})(y_i-\bar{y})}{s_xs_y}
$$

where $\bar{x}, \bar{y}$ are the means and $s_x,s_y$ are the standard deviations. 

## Significance test

It is based on the idea that a feature or variable provides some useful information about data.

1. Sample: make a statement about the relation between two variables for a well defined and finite population. Since it is difficult to collect information for the whole population, **randomly sampling** is a solution.
2. Hypothesis: Before looking at data, make a statement about the population $H_0$ that we will reject in favour of an alternative statement about the population $H_A$. What we aspire to do is to prove that $H_0$ is very unlikely. 
3. Probabilities: Look at sample results. Assuming that the null hypothesis $H_0$ is true, how much chance do we have of obtaining a sample that has a correlation that is that extreme or more extreme (than we observed with the sample).
4. Conclusion: reject the null hypothesis $H_0$ in favour of the alternative hypothesis $H_a$ if the probability of such an extreme or more extreme outcome is lower than 5% ($\rho<0.05$). 

## Permutation Based Approach

<aside>
💡 *Imagine we have data about five people, knowing their age. We want to explore eventual correlations between outdegree and age.*

</aside>

```r
OD = c(3,1,2,2,3) # Out degree
age = c(19,45,32,25,21) # Ages
cor.test(OD,age) # Correlation test

# Pearson's product-moment correlation

# data:  OD and age
# t = -5.166, df = 3, p-value = 0.01407
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.9966747 -0.4028377
# sample estimates:
#        cor 
# -0.9481293
```

According to this test, with a p-value below 0.05, there is a negative correlation that explains that, by increasing the age, the number of out links decreases. 

*What happens if we permute nodes position?* 

```r
OD = c(3,1,2,2,3) # Out degree still the same
age = c(45,32,25,21,19) # Ages permuted
cor.test(OD,age)

# Pearson's product-moment correlation

# data:  OD and age
# t = 0.17794, df = 3, p-value = 0.8701
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.8573755  0.9030401
# sample estimates:
#       cor 
# 0.1021936
```

If we permute ages, then the p-value rises, to reject our alternative hypothesis and accept the null one.  A **permutation test** (also called re-randomization test) is an exact test, a type of statistical significance test in which the distribution of the test statistic under the null hypothesis is obtained by calculating all possible values of the test statistic under all possible rearrangements of the observed data points.

It's interesting to notice that by permuting ages, we will in the end get a normal distribution for our correlation.