# 06-Attributes based measures

Class: Advanced Social Networks
Created: October 27, 2021 6:22 PM
Note: to revise
Reviewed: Yes
Transcripted: No

## Resourcefulness

Resource generator relates to people with more resources. Resourcefulness usually establishes the measures of zero (nothing) and total (everything). 

<aside>
💡 *It is not only related to money but for instance to happiness: the more happy people we're related with, the more good vibes we will gather.*

</aside>

![Untitled](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Untitled.png)

The resourceful alter can be computed through the total or the average:

- total:
    
    $$
    sum \ R_i = \sum_j x_{ij}r_j
    $$
    
- average
    
    $$
    avg \ R_i = \frac{ \sum_j x_{ij}r_j}{\sum_j x_{ij}}
    $$
    

[Example](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Example%20ed235a8a99884cccb98a70ee3b07e876.csv)

Consider the adjacency matrix beside, where the green table indicates the number of resources held by nodes and the blue one is the adjacency matrix. We could then compute the resourcefulness of each node, both in terms of sum and average, as shown in the table. 

![Untitled](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Untitled%201.png)

![08-graph.png](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/08-graph.png)

## Homophily

Which of the two networks is a good situation?

- it's good to be connected to similar people because they will get along, they understand each other, there's a common ground and they emphasize with each other;
- on the other side, to spread knowledge, exit from our echo chamber it is important also to face different realities.

We could simply compute **homophily** by computing the percentage of neighbours of the central node that belongs to the same category. 

<aside>
💡 *Suppose we talk about males and females ego networks. In the first example, there's 80% of homophily, followed by 40 and 60%.*

</aside>

![Untitled](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Untitled%202.png)

To properly define homophily in ego networks, we recur to:

$$
EI_i = \frac{E_i-I_i}{E_i+I_i}
$$

Whenever we change our perspective considering a global network, as the example on the right, also our interpretation may change. For instance, by considering a, b and d as in the previous example, their connections change if we extend their ego networks. 

We could build a matrix by considering:

- nodes who are the same or different type as ego;
- whether these nodes are directly connected or not to an ego.

In complete networks as the one on the right, the homophily is computed as:

$$
Q_i = \frac{ad-bc}{ad+bc}
$$

![Untitled](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Untitled%203.png)

![Untitled](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Untitled%204.png)

Whenever we have high b and c, we have atrophy, tendency to choose different people from us; whenever a and d are high, homophily increases. 

<aside>
💡 *In the second network, b tends to prefer women to men, since she excludes most of the men from her connections. There's a high tendency to homophily. 
In the third network, says that he builds more connections with females than random chance. Also, he did not connect to a lot of males that were available.*

</aside>

The odds ratio divides ad over bc. It causes problems whenever bc is zero since it tends to infinity. 

$$
odds = \frac{ad}{bc}
$$

## Diversity

Differences in characteristics imply differences in resources, so when we connect with different people, we have access to different types of resources. 

The **index of quality variation** looks at one person and we care about other people categories (i.e. to what resources they can access):

- if all neighbours belong to the same category, the index values 0;
- if we consider an ego network, in particular, the proportion of nodes per each category and sum their squared value, we get our value.
- if every alter belongs to a different category, the index equals 1.

All values are normalized by the maximum value that the index can assume. 

![Untitled](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Untitled%205.png)

![Untitled](06-Attributes%20based%20measures%20331ebce9a3044b5ab743bb5d74abf4fc/Untitled%206.png)

<aside>
💡 ***Remember**: 
heterophily among alters; 
homogeneity when all connections are the same category;
homophily among alters; 
atrophy within an ego network (people different from me that challenge me).*

</aside>