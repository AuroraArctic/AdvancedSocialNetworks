##############################
# DYAD
##############################
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
library(igraph)
mat6i<-graph_from_adjacency_matrix(mat6,mode=c("directed"),diag=F)
igraph::reciprocity(mat6i)
# [1] 0.6666667

igraph::edge_density(mat6i)
# [1] 0.4


##############################
# TRIAD
##############################
mat6<-matrix(c(0,0,0,1,0,0,
               0,0,1,0,0,0,
               0,1,0,0,0,0,
               1,1,1,0,1,1,
               0,0,1,1,0,1,
               0,0,0,0,1,0),6,6, byrow=T)

# Triad census
sna::triad.census(mat6)

sna::gtrans(mat6)
# [1] 0.4375

sna::gden(mat6)
# [1] 0.4

# Check if it's random
RG100<-sna::rgraph(20,100,tprob=.2)
hist(sna::gden(RG100))
hist(sna::gtrans(RG100))
