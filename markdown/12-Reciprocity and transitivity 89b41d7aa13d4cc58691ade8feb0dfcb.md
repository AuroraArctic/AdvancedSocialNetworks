# 12-Reciprocity and transitivity

Class: Advanced Social Networks
Created: November 24, 2021 6:19 PM
Reviewed: Yes
Transcripted: No

## Dyads

### Dyad census

With **dyad census**, we count how many mutual, asymmetric and null dyads there are in the network. 

By looking at this network, there are:

- mutual dyads: $4$;
- asymmetric dyads: $4$;
- null dyads: $6*5/2 - 8 = 7$ (removing all links, counting mutual dyads one time).

![Untitled](12-Reciprocity%20and%20transitivity%2089b41d7aa13d4cc58691ade8feb0dfcb/Untitled.png)

<aside>
💡 *Get the total dyads available as $n(n-1)/2$ and then remove the total amount of dyads actually existing (sum mutual and asymmetric's).*

</aside>

*Given the density, what would be the expected dyad census?*

- Mutual dyads: $d*d$;
- Asymmetric dyads: $2d*(1-d)$;
- Null dyads: $(1-d)(1-d)$;

In total, if all dyads existed in the network, the density would be: 

$$
d*d+2d*(1-d)+(1-d)(1-d) \\
= d*(d+1-d)+(1-d)*(d+1-d) \\
= d+1-d = 1
$$

### Reciprocity

*Is there more reciprocity in the network than by chance?*

There are two indexes for computing reciprocity:

- Compute the number of mutual dyads in the network and compare it for the total amount of possible mutual dyads ($2 * mutual + asymmetric$):
    
    $$
    \frac{2*M}{2*M+A}
    $$
    
    <aside>
    💡 *In the previous example, we would get $2*4/(2*4+4) = 8/12 = 0.667$.*
    
    </aside>
    
    <aside>
    💡 *Suppose that the previous network doesn't have reciprocal edges, then reciprocity would be $0/(0+8) = 0$, because the index of reciprocity would be $2*0/(2*0+A) = 0$.
     If instead all edges are mutual, then the highest reachable value is 1, because $2*M/(2*M+A) = 2M/(2M) = 1$.*
    
    </aside>
    
- Considering the density, we would obtain the reciprocity index by:
    
    $$
    \frac{2*M}{2*M+A} = \frac{2d*d}{2 d*d+2d*(1-d)} = \frac{d}{d+(1-d)} = d
    $$
    

### On R

```r
mat6<-matrix(c(0,0,0,1,0,0,
							 0,0,1,0,0,0,
							 0,1,0,0,0,0,
							 1,1,1,0,1,1,
							 0,0,1,1,0,1,
							 0,0,0,0,1,0),6,6, byrow=T)

# Dyad Census
sna::dyad.census(mat6, g=NULL)
#      Mut Asym Null
# [1,] 4   4    7

# Like edgewise but multiplied for m/(m+a)
sna::grecip(mat6,measure="dyadic")
# Mut
# 0.7333333

# Edgewise (like we have seen before)
sna::grecip(mat6,measure="edgewise")
# Mut
# 0.6666667

# Density
sna::gden(mat6)
# [1] 0.4

# With igraph
mat6i<-graph_from_adjacency_matrix(mat6,mode=c("directed"),diag=F)
igraph::reciprocity(mat6i)
# [1] 0.6666667

igraph::edge_density(mat6i)
# [1] 0.4
```

## Triads

![Untitled](12-Reciprocity%20and%20transitivity%2089b41d7aa13d4cc58691ade8feb0dfcb/Untitled%201.png)

![Untitled](12-Reciprocity%20and%20transitivity%2089b41d7aa13d4cc58691ade8feb0dfcb/Untitled%202.png)

### Triad Census

According to the Davis and Leinhardt triad census, there are 16 ways to arrange a triad. The `sna` library on R helps to count how many of them there are in a network. 

```r
mat6<-matrix(c(0,0,0,1,0,0,
               0,0,1,0,0,0,
               0,1,0,0,0,0,
               1,1,1,0,1,1,
               0,0,1,1,0,1,
               0,0,0,0,1,0),6,6, byrow=T)

# Triad census
sna::triad.census(mat6)
#      003 012 102 021D 021U 021C 111D 111U 030T 030C 201 120D 120U 120C 210 300
# [1,]   3   1   4    2    0    0    1    5    0    0   1    1    1    0   1   0
```

![Untitled](12-Reciprocity%20and%20transitivity%2089b41d7aa13d4cc58691ade8feb0dfcb/Untitled%203.png)

By considering the code output and the triad census legend, we could focus for instance on 111U triad and try to detect them:

- $a_1, a_4, a_6$
- $a_1, a_4, a_2$
- $a_1, a_4, a_3$
- $a_2, a_4, a_5$
- $a_3, a_5, a_6$

### Transitivity

In order to know whether a network is transitive, we can compare the transitivity computed through `gtrans()` with the density of the network. Transitivity is computed as the ratio between a dyad and the number of dyads between these two nodes plus the number of tryads there are. 

```r
sna::gtrans(mat6)
# [1] 0.4375
sna::gden(mat6)
# [1] 0.4
```