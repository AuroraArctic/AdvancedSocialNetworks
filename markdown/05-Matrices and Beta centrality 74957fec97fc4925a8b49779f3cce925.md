# 05-Matrices and Beta centrality

Class: Advanced Social Networks
Created: October 14, 2021 4:36 PM
Reviewed: Yes
Transcripted: No

## Matrix Algebra

### Adding two matrices

The matrices X and Y indicate the ties for 2 different network relations (e.g. communication and friendship network) for the same set of 5 actors (a,b,c,d,e):

![Untitled](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Untitled.png)

![Untitled](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Untitled%201.png)

Suppose we want to sum $X+2Y$. Considering their adjacency matrix, we get:

$$
\left(  
\begin{array}{ccccc}
0 & 1 & 1 & 0 & 0\\
1 & 0 & 1 & 0 & 0 \\
1 & 1 & 0 & 1 & 0 \\
0 & 0 & 1 & 0 & 1 \\
0 & 0 & 0 & 1 & 0 \\
\end{array}
\right)+2
\left(  
\begin{array}{ccccc}
0 & 1 & 0 & 1 & 1\\
1 & 0 & 1 & 0 & 0 \\
0 & 1 & 0 & 1 & 0 \\
1 & 0 & 1 & 0 & 0 \\
1 & 0 & 0 & 0 & 0 \\
\end{array}
\right) = 
\left(  
\begin{array}{ccccc}
0 & 3 & 1 & 2 & 2\\
3 & 0 & 3 & 0 & 0 \\
1 & 3 & 0 & 3 & 0 \\
2 & 0 & 3 & 0 & 1 \\
2 & 0 & 0 & 1 & 0 \\
\end{array}
\right)
$$

### Cell Multiplication

Suppose we want to compute $XY$. Considering their adjacency matrix, we get: 

![Untitled](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Untitled%202.png)

$$
\left(  
\begin{array}{ccccc}
0 & 1 & 1 & 0 & 0\\
1 & 0 & 1 & 0 & 0 \\
1 & 1 & 0 & 1 & 0 \\
0 & 0 & 1 & 0 & 1 \\
0 & 0 & 0 & 1 & 0 \\
\end{array}
\right)\times
\left(  
\begin{array}{ccccc}
0 & 1 & 0 & 1 & 1\\
1 & 0 & 1 & 0 & 0 \\
0 & 1 & 0 & 1 & 0 \\
1 & 0 & 1 & 0 & 0 \\
1 & 0 & 0 & 0 & 0 \\
\end{array}
\right) = 
\left(  
\begin{array}{ccccc}
0 & 1 & 0 & 0 & 0\\
1 & 0 & 1 & 0 & 0 \\
0 & 1 & 0 & 1 & 0 \\
0 & 0 & 1 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 \\
\end{array}
\right)
$$

### Matrix Multiplication of different matrices

Suppose the two matrices represent the flights and trains from a place to another. Then we can imagine the next scenarios:

- From point A to point A
- From point A to point B
- From point B to point B

## Bonacich Beta Centrality

Imagine there can be a repeated influence, such that it spreads on two or more steps. The image below represents some of the one, two, three and four steps paths inside the network:

![Untitled](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Untitled%203.png)

$$
R = \sum^\infty_{k=1}(\beta^{k-1}X^k) = X+\beta X^2+\beta^2 X^3+\dots
$$

Imagine there can be a repeated influence and we want to capture popularity (i.e. being connected to many popular people). By looking at one single step, we get that node $d$ has beta centrality $\beta*(1+1+1+3)$, which represent the number of nodes that neighbours can reach. We then add an additional term $\beta^2$, multiplied for the number of nodes each neighbour can reach in two steps. 

![Untitled](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Untitled%204.png)

![Untitled](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Untitled%205.png)

Given the matrix $X$, we have the adjacency matrix of nodes A, B, C and D. We can compute all the two-steps adjacency paths and so on (i.e. $X^2, X^3, X^4,\dots$). We could compute the centrality by summing them up:

$$
c_B(A) = 2+5+10+23+48+\dots
$$

Instead of just summing them, we could insert the beta $\beta$ term which reduces the importance of the paths that necessitate of multiple steps:

$$
c_B(i) = XI+\beta X^2I+\beta^2X^3I+\dots
$$

By choosing, for example, $\beta = 0.1$, the beta centrality of $A$ becomes:

$$
c_B(A) = 1*2+0.1*5+0.01*10+0.001*23+0.0001*48+\dots
$$

In the end, we get for each node:

[Beta Centrality](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Beta%20Centrality%200b37ba2b6f9244e5b40412406e0c6e49.csv)

```r
MAT4<-matrix(c(0, 1, 1, 0,
							 1, 0, 1, 0,
 							 1, 1, 0, 1,
							 0, 0, 1, 0),4,4)
MAT4i<-graph_from_adjacency_matrix(MAT4,
																	 mode=c("undirected"),diag=F)
# Beta value = 0.1
bonpow(MAT4i, exponent=0.1)
# [1] 0.9746799 0.9746799 1.3577419 0.5064930

# Beta value = 0.1, with normalized values
bonpow(MAT4i, exponent=0.1)/sum(bonpow(MAT4i, exponent=0.1))
# [1] 0.2555804 0.2555804 0.3560268 0.1328125

# Beta value = 0.2
bonpow(MAT4i, exponent=0.2)/sum(bonpow(MAT4i, exponent=0.2))
# [1] 0.2601626 0.2601626 0.3414634 0.1382114

```

We could change the beta value to 0.2 and obtain:

[Beta Centrality 0.2](05-Matrices%20and%20Beta%20centrality%2074957fec97fc4925a8b49779f3cce925/Beta%20Centrality%200%202%20f72c49fb97dd44f1b6240b521d2e25f0.csv)

## Graph exercise

```r
MAT11<-matrix(c(
0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0,
0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0,
0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1,
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),11,11)

# Creation of the graph
GRAPH11<-graph_from_adjacency_matrix(MAT11,mode=c("undirected"),diag= FALSE)

bonpow(GRAPH11, exponent=.1)/sum(bonpow(GRAPH11, exponent=.1)) # Beta value = 0.1
# [1] 0.05570 0.055707 0.055707 0.182418 0.055707 0.055707 0.055707 0.182418 0.158428 0.095475 0.047013

bonpow(GRAPH11, exponent=.2)/sum(bonpow(GRAPH11, exponent=.2)) # Beta value = 0.2
# [1] 0.05970 0.059709 0.059709 0.170758 0.059709 0.059709 0.059709 0.170758 0.163504 0.092633 0.044084

bonpow(GRAPH11, exponent=.3)/sum(bonpow(GRAPH11, exponent=.3)) # Beta value = 0.3
# [1] 0.06278 0.062782 0.062782 0.162562 0.062782 0.062782 0.062782 0.162562 0.166688 0.090369 0.041124

bonpow(GRAPH11, exponent=.4)/sum(bonpow(GRAPH11, exponent=.4)) # Beta value = 0.4
# [1] 0.06536 0.065361 0.065361 0.156663 0.065361 0.065361 0.065361 0.156663 0.168616 0.087995 0.037894

bonpow(GRAPH11, exponent=.5)/sum(bonpow(GRAPH11, exponent=.5)) # Beta value = 0.5
# [1] 0.06779 0.067796 0.067796 0.152542 0.067796 0.067796 0.067796 0.152542 0.169491 0.084745 0.033898

bonpow(GRAPH11, exponent=0)/sum(bonpow(GRAPH11, exponent=0)) # Beta value = 0
# [1] 0.05 0.05 0.05 0.20 0.05 0.05 0.05 0.20 0.15 0.10 0.05

bonpow(GRAPH11, exponent=-.1)/sum(bonpow(GRAPH11, exponent=-.1)) # Beta value = -0.1
# [1] 0.04083 0.04083 0.04083 0.22937 0.04083 0.04083 0.04083 0.22937 0.13455 0.10879 0.05289
```