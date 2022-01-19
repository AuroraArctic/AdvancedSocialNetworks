# 11-Subgroups and Structural Equivalence

Class: Advanced Social Networks
Created: November 21, 2021 10:05 PM
Reviewed: Yes
Transcripted: No

## Subgroups

```r
# Network creation
library(sna)
# cliques

network<-matrix(c(
0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0),19,19)
```

### Components

*Who would be able to “eventually” share information with each other?* 

A subset where everyone is directly or indirectly connected to everyone else is said **component**. 

<aside>
💡 *Note that if actors $a$ and $b$ are at least indirectly connected, and actor $c$ is at least indirectly connected to $b$, then actor $c$ is at least indirectly connected to a. Hence all actors belong to one and only one component.*

</aside>

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled.png)

### Cliques

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%201.png)

A subset where everyone is directly connected to everyone else in the subset is called a **clique**.

<aside>
💡 *Note that both an actor and a dyad might belong to more than one clique.*

</aside>

### K-cliques

A subset where everyone is connected to everyone else in the subset by at most $K$ steps is called $K$-cliques. 

By considering the previous network, the $2$-cliques are: 

- 14, 15, 17, 18, 19;
- 14, 15, 16, 17, 18;
- 9, 10, 11, 12;
- 1, 2, 3, 6, 7;
- 1, 2, 3, 6, 4, 5;

![12-network.png](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/12-network.png)

<aside>
💡 Note that actors might become cliques through others that are not members themselves. For instance, if we consider the 2-clique composed by $K_2 = \{14,15,17,18,19\}$ thanks to 16.

</aside>

By considering instead 3-cliques, we obtain: 

- 14, 15, 16, 17, 18, 19;
- 1, 2, 3, 4, 5, 6, 7;
- 9, 10, 11, 12.

If $K = N-1$, then we get a component, while if $K=1$, we get a normal clique. 

```r
# Compute the cliques
clique.census(network, mode = "graph")

# Returns number of cliques per each node
```

### K-clans

A $K$-clique where everyone is connected to everyone else in the subset by at most K steps through its own members is called $K$-clan. This means that actors become cliques only through cliques members. 

Some 2-clans in the network are:

- 14, 15, 18, 19;
- 14, 17, 18, 19;
- 9, 10, 11, 12;
- 1, 2, 3, 6, 7;
- 1, 2, 3, 6, 4, 5.

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%202.png)

## Equivalence

### Core periphery

If we try to represent the network with an adjacency matrix, we would notice that cliques are evident by 1s zones. In order to get a completely filled by 1s zone, there should be a direct path between all nodes. Based on the size of these blocks, we can distinguish the core from the periphery. In fact, the periphery will have zeros zones, if not connected to anyone, or 1 and 0s zones, while the core will have 1s zones. 

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%203.png)

### Structural equivalence

In social network analysis, two nodes are considered **structurally equivalent** if they have the same neighbourhoods – that is, they are connected to the same others.  

<aside>
💡 *For instance, in the network below, we know that there are some nodes that have the same behaviours: $\{f, g\}, \{c, d\}, \{i, j\}$.*

</aside>

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%204.png)

### Regular equivalence

Two actors are **regular equivalent** if they are equally related to equivalent others. Two nodes are said to play the same role (i.e., are regularly equivalent) if they have ties to the same roles.

<aside>
💡 *For instance, we can distinguish two types of nodes: $\{b,c,d,e\}, \{f,g,h,i,j\}$.*

</aside>

### Blockmodeling

**Blockmodel** (sometimes also **block model**) in blockmodeling (part of network science) is defined as a multitude of structures, which are obtained with:

- **identification of all vertices** (e.g., units, nodes) within a cluster and at the same time representing each cluster as a vertex, from which vertices for another graph can be constructed;
- **combination of all the links** (ties), represented in a block as a single link between positions, while at the same time constructing one tie for each block. In a case, when there are no ties in a block, there will be no ties between the two positions, that define the block.

Some types of blocks can be:

- complete: filled with 1s;
- null: filled with 0s;
- regular: one covered rows and columns;
- row-dominant or col-dominant, whenever we can distinguish a block of nodes and links as a cluster (there exists at least one row/column with all 1s);
- row-functional or col-functional: all starting nodes link to some other nodes and vice-versa, if there is just one 1 in each row/column;
- row-regular or col-regular: each row/column is covered;

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%205.png)

## Structural Equivalence on R

```r
# equivalence
network_2<-matrix(c(
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  1,0,0,0,1,1,0,0,
  0,1,0,0,1,1,0,0,
  0,1,0,0,0,1,0,0,
  0,1,0,0,1,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0),8,8,byrow=T)
```

### Hamming Structural Equivalence

$$
\text { Hamming }_{i j}=\sum_{k}^{N}\left(\left|x_{i k}-x_{j k}\right|+\left|x_{k i}-x_{k j}\right|\right)
$$

Suppose there are two nodes $i,j$ and we want to compute the Hamming distance between the link of these two nodes with $k$:

- if both $i,j$ are linked to $k$, then $|1-1| = 0$;
- if both $i,j$ are not linked to $k$, then $|0-0| = 0$;
- if only one of them is linked to $k$, then $|1-0| = 1$.

<aside>
💡 *Note that this example covers only the situations with direct links from $i,j$ to $k$, but also the vice-versa must be considered.*

</aside>

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%206.png)

```r
# Constructing the distance matrix with the Hamming distance
network_2_SEH<-sedist(network_2, method="hamming")
network_2_SEH 
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
# [1,]    0    4    2    4    4    4    1    1
# [2,]    4    0    6    4    2    2    3    3
# [3,]    2    6    0    2    4    4    3    3
# [4,]    4    4    2    0    2    2    3    3
# [5,]    4    2    4    2    0    0    5    5
# [6,]    4    2    4    2    0    0    5    5
# [7,]    1    3    3    3    5    5    0    0
# [8,]    1    3    3    3    5    5    0    0
```

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%207.png)

```r
# Clustering
network_2_SEHD<-as.dist(network_2_SEH)
network_2_SEHD_HC<-hclust(network_2_SEHD,method="complete")
plot(network_2_SEHD_HC)
```

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%208.png)

### Euclidean Structural Equivalence

$$
Euclidean_{ij} = \sqrt{\sum_k^N \Big((x_{ik}-x{jk})^2+(x_{ki}-x_{kj})^2\Big)}
$$

```r
network_2_SEE<-sedist(network_2, method="euclidean")
network_2_SEE

#          [,1]     [,2]     [,3]     [,4]     [,5]     [,6]     [,7]     [,8]
# [1,] 0.000000 2.000000 1.414214 2.000000 2.000000 2.000000 1.000000 1.000000
# [2,] 2.000000 0.000000 2.449490 2.000000 1.414214 1.414214 1.732051 1.732051
# [3,] 1.414214 2.449490 0.000000 1.414214 2.000000 2.000000 1.732051 1.732051
# [4,] 2.000000 2.000000 1.414214 0.000000 1.414214 1.414214 1.732051 1.732051
# [5,] 2.000000 1.414214 2.000000 1.414214 0.000000 0.000000 2.236068 2.236068
# [6,] 2.000000 1.414214 2.000000 1.414214 0.000000 0.000000 2.236068 2.236068
# [7,] 1.000000 1.732051 1.732051 1.732051 2.236068 2.236068 0.000000 0.000000
# [8,] 1.000000 1.732051 1.732051 1.732051 2.236068 2.236068 0.000000 0.000000

network_2_SEED<-as.dist(network_2_SEE)
network_2_SEED_HC<-hclust(network_2_SEED,method="complete")
plot(network_2_SEED_HC)
```

Suppose having two nodes $i,j$ pointing to $k$. We aim to compute the euclidean distance between $x_{ik}$ and $x_{jk}$. 

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%209.png)

```r
# Euclidean Structural Equivalence
network_2_SEE<-sedist(network_2, method="euclidean")
network_2_SEE

#          [,1]     [,2]     [,3]     [,4]     [,5]     [,6]     [,7]     [,8]
# [1,] 0.000000 2.000000 1.414214 2.000000 2.000000 2.000000 1.000000 1.000000
# [2,] 2.000000 0.000000 2.449490 2.000000 1.414214 1.414214 1.732051 1.732051
# [3,] 1.414214 2.449490 0.000000 1.414214 2.000000 2.000000 1.732051 1.732051
# [4,] 2.000000 2.000000 1.414214 0.000000 1.414214 1.414214 1.732051 1.732051
# [5,] 2.000000 1.414214 2.000000 1.414214 0.000000 0.000000 2.236068 2.236068
# [6,] 2.000000 1.414214 2.000000 1.414214 0.000000 0.000000 2.236068 2.236068
# [7,] 1.000000 1.732051 1.732051 1.732051 2.236068 2.236068 0.000000 0.000000
# [8,] 1.000000 1.732051 1.732051 1.732051 2.236068 2.236068 0.000000 0.000000
```

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%2010.png)

```r
## Clustering on euclidean distance
network_2_SEED<-as.dist(network_2_SEE)
network_2_SEED_HC<-hclust(network_2_SEED,method="complete")
plot(network_2_SEED_HC)
```

![Untitled](11-Subgroups%20and%20Structural%20Equivalence%201fdb3010039c44adb922986d698d699e/Untitled%2011.png)