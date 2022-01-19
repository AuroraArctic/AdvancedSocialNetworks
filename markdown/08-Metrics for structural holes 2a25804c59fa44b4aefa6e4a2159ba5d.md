# 08-Metrics for structural holes

Class: Advanced Social Networks
Created: November 3, 2021 6:17 PM
Reviewed: Yes
Transcripted: No

## Ego density

Consider the Medici family, which has 6 alters. The number of ties between these alters is 1, while the maximum is $6*5/2 = 15$. This means that the ego density is the ratio between the first value and the maximum: $1/15 = 0.067$:

$$
\text{ego density} = \frac{ \text{\# ties between alters }}{\text{\# maximum links between alters}}
$$

We could repeat the computation for the remaining families:

<aside>
💡 *For instance, the Peruzzi family has 3 alters, between which there are 2 ties, while the maximum is $3/2/2 = 3$. Therefore the ego density equals $2/3 = 0.667$.*

</aside>

<aside>
💡 *For instance, the Tornabuoni family has 3 neighbours and between them, there's a link, while the maximum is 3. The ego density equals $1/3 = 0.33$. Same happens to Bischeri, Castellani, Ridolfi and Strozzi.*

</aside>

![Florence Familiies.svg](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Florence_Familiies.svg)

## Ego betweenness

The ego betweenness measures whether a node is within the shortest path between couples of nodes. 

<aside>
💡 *Consider the **Medici** Family. It has:
- 5 from Salviati to any other node;
- 5 from Acciaiuoli to any other;
- 5 from Albizzi to any other;
- 5 from Barbadori to any other;
- 4 from Tornabuoni to any other but Ridolfi;
- 4 from Ridolfi to any other but Tornabuoni.
In total, its ego betweenness is 28.*

</aside>

<aside>
💡 *Consider the **Guadagni** family. They have 4 alters:
- from Lamberteschi to any other: 3;
- from Bischeri: 3;
- from Albizzi: 3;
- from Tornabuoni: 3;
In total, its ego betweenness is 12.*

</aside>

<aside>
💡 *Consider the **Peruzzi** Family. They are NOT in the shortest path from Bischeri to Strozzi, neither from Castellani and Strozzi, but since there are two possible paths from Bischeni to Castellani and vice versa, the ego betweenness is 0.5 (1 if we sum up both versus).*

</aside>

<aside>
💡 *Consider the **Strozzi** Family. It has:
- 0.5 from Bischeri to Castellani and vice versa (1)
- 1 from Bischeri/Castellani/Peruzzi to Ridolfi (3) and vice versa (3);
In total, its ego betweenness is 7.*

</aside>

*By summing the betweenness for every possible path we get the ego-betweenness of the single node.* 

In Florence's scenario, De Medici is the structural hole, while Pazzi, Pucci, Ginori and Acciaiuoli are the most closed families.   

## Constraint index

The constraint index is the opposite of structural holes, which indicate that we're limited by our network. With no constraint, nodes are free to do whatever they want. 

$$
c_{i}=\sum_{j=1}^{n}\left[c_{i j}\right]=\sum_{j=1}^{n}\left[p_{i j}+\sum_{k=1}^{n} p_{i k} p_{k j}\right]^{2} \quad \text { with } \quad k \neq j \neq i
$$

Suppose $a$ is the ego, in four different situations:

- all alters are connected with each other: if a truncates the relationship, there is no affection to theirs;
- same as the previous case, but lower number of alters: higher constraint index;
- no alter is connected to any other alter of a;
- same as the previous case, but lower number of alters, which reduces the constraint index;

A lower value for the constraint index indicates a higher presence of structural holes. With lower connections, each of them is dangerous, since their loss implies the closure of nodes. If there are fewer friends that are connected with each other there's a higher constraint. Whenever $a$ becomes central and regulates relationships between nodes, there's a structural node and the constraint falls.

### Pilot Example

For each direct link starting from $a$, compute the probability of choosing that link plus the two-step paths that link a to the related node. 

- Example 1: 1/4 probability per each node with within links
    
    $$
    \begin{aligned}
    ab &= (p_{ab}+p_{ac}p_{cb}+p_{ad}p_{db}+p_{ae}p_{eb})
    \\&= (1/4+1/4*1/3+1/4*1/3+1/4*1/3)^2 =(1/2)^2 \\
    & = ac = ad = ae\\
    &\text{Constraint index} = ab+ac+ad+ae = 1
    \end{aligned}
    $$
    
    ![Untitled](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Untitled.png)
    

- Example 2: 1/4 probability per each node with no link
    
    $$
    \begin{aligned}
    ab &= (p_{ab}+p_{ac}p_{cb}+p_{ad}p_{db}+p_{ae}p_{eb})
    \\&= (1/4+1/4*0+1/4*0+1/4*0)^2 =(1/4)^2 \\
    & = ac = ad = ae\\
    &\text{Constraint index} = ab+ac+ad+ae = 1/4
    \end{aligned}
    $$
    
    ![Untitled](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Untitled%201.png)
    

- Example 3: 1/2 probability per each node with link
    
    $$
    \begin{aligned}
    ab &= (p_{ab}+p_{ac}p_{cb})
    \\&= (1/2+1/2*1)=1\\
    & = ac\\
    &\text{Constraint index} = ab+ac= 2
    \end{aligned}
    $$
    
    ![Untitled](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Untitled%202.png)
    

- Example 3: 1/2 probability per each node with no link
    
    $$
    \begin{aligned}
    ab &= (p_{ab}+p_{ac}p_{cb})
    \\&= (1/2+1/2*0)=1/2\\
    & = ac\\
    &\text{Constraint index} = ab+ac= 1
    \end{aligned}
    $$
    
    ![Untitled](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Untitled%203.png)
    

### Florencian Families Example

```r
igraph::constraint(graph, nodes = V(graph), weights = NULL)

PFM<-read.csv("Padgett_FlorentineFamilies_Marriage.csv",
							stringsAsFactors=FALSE,
							row.names=1)
PFM_i<-graph_from_adjacency_matrix(as.matrix(PFM),
																	 mode="undirected", 
																	 diag=F)
constraint(PFM_i)

# ACCIAIUOLI   ALBIZZI      BARBADORI    BISCHERI 
# 1.0000000    0.3333333    0.5000000    0.4822531 
# CASTELLANI   GINORI       GUADAGNI     LAMBERTESCHI 
# 0.4822531    1.0000000    0.2500000    1.0000000 
# MEDICI       PAZZI        PERUZZI      PUCCI 
# 0.2098765    1.0000000    0.6558642    NaN 
# RIDOLFI      SALVIATI     STROZZI      TORNABUONI 
# 0.4598765    0.5000000    0.4583333    0.4598765
```

<aside>
💡 *To know whether $a$ spends the same amount of time between all of its neighbours, the strength of the relationship may be necessary. Otherwise, we will assume that its attention will be equally split among all alters.*

</aside>

Let's try to compute the index with some families:

- Pazzi
    
    Pazzi only has 1 alter: Salviati. Therefore the constraint index will be equal to the term that counts the probability of going from Pazzi to Salviati (which equals 1^2 = 1). 
    

![Untitled](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Untitled%204.png)

- Barbadori
    
    Barbadori only has two alters: Medici and Castellani:
    
    $$
    BM = (p_{BM}+p_{BC}*p_{CM})^2 = (1/2+1/2*0)^2 = 1/4 \\
    BC = (p_{BC}+p_{BM}*p_{MC})^2 = (1/2+1/2*0)^2 = 1/4\\
    \text{Constraint index} = BM+BC = 1/2 = 0.5
    $$
    

![Untitled](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Untitled%205.png)

- Bischeri
    
    Bischeri has three neighbours: Guadagni, Strozzi and Peruzzi:
    
    $$
    \begin{aligned}
    BG &= (p_{BG}+p_{BP}*p_{PG}+p_{BS}*p_{SG})^2\\
    &=(1/3+1/3*0+1/3*0)^2 = 0.1111\\
    BS &= (p_{BS}+p_{BP}*p_{PS}+p_{BG}*p_{GS})^2\\
    &= (1/3+1/3*1/3+1/3*0)^2 = 0.1975\\
    BP &= (p_{BP}+p_{BG}*p_{GP}+p_{BS}*p_{SP})^2 \\&= (1/3+1/3*0+1/3*1/4)^2 = 0.1736
    \end{aligned}\\
    \text{Constraint index} = BG+BS+BP = 0.4823
    $$
    

![Untitled](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/Untitled%206.png)

<aside>
💡 *Note that this method of computing the constraint index is graph one, while UCINET automatically removes the starting edge that links the intermediary node to the starting ego node, leading to a greater or equal value for CI.*

</aside>

## Exercise

![09-constraint_index_example.png](08-Metrics%20for%20structural%20holes%202a25804c59fa44b4aefa6e4a2159ba5d/09-constraint_index_example.png)

Given node $a$ as ego, compute the constraint index:

- ab
    
    $$
    ab = (p_{ab}+p_{ac}* p_{cb})^2 =  (2/11)^2 = (14/77)^2
    $$
    
- ac
    
    $$
    ac = p_{ab}*p_{bc}+p_{ac}+p_{ad}*p_{dc}+p_{ae}*p_{ec}+p_{af}*p_{fc} =\\
    = (2/11*0+5+1/11*5/7+1/11*0+2/11*0)^2= \\
    = (5/11+5/77)^2 = (40/77)^2
    $$
    
- ad
    
    $$
    ad = p_{ab}*p_{bd}+p_{ac}*p_{cd}+p_{ad}+p_{ae}*p_{ed}+p_{af}*p_{fd} =\\
    = (2/11*0+5/11*0+1/11+1/11*0+2/11*0 )^2= (1/11)^2 = (7/77)^2
    $$
    
- ae
    
    $$
    ad = p_{ab}*p_{be}+p_{ac}*p_{ce}+p_{ad}*p_{de}+p_{ae}+p_{af}*p_{fe} =\\
    = (2/11*0+5/11*0+1/11*2/7+1/11+2/11*2/2)^2=\\
    = (2/77+1/11+2/11) ^2 = (23/77)^2
    $$
    
- af
    
    $$
    af = p_{ab}*p_{bf}+p_{ac}*p_{cf}+p_{ad}*p_{df}+p_{ae}*p_{ef}+p_{af}=\\
    = (2*0+5*0+1*0+1*0+2/11)^2 = (2/11)^2 = (14/77)^2
    $$
    

Seems like af and ab have the same constraint index, which is higher for ac and ae and lower for ad.