###########################
# TWO MODE PROJECTIONS
###########################

library(sna)

# Importing data
DSAm <- as.matrix(read.csv(
    "Datasets/Davis_SouthernWomen_Attendance.csv",
    stringsAsFactors = FALSE, row.names=1))


# Limit letters to the first two letters
DSAmS<-DSAm
#Change names in new object
rownames(DSAmS)<-substring(rownames(DSAm),1,2)
DSAmS

# Now draw the network
gplot(DSAmS, displaylabels=TRUE, 
      usearrows=FALSE, gmode="twomode")



###########################
# ONE MODE PROJECTIONS
###########################

DSAmS%*%t(DSAmS)
t(DSAmS)%*%DSAmS
mean(DSAmS)

# Example dataset
scientists_papers<-matrix(c(1,0,0,0,0,0,0,0,
                   1,0,0,1,0,0,0,0,
                   1,1,0,0,0,0,0,0,
                   1,1,1,0,0,0,0,0,
                   0,0,1,1,1,1,1,1,
                   0,0,0,0,0,0,1,1),
                 6,8,byrow=TRUE)
rownames(scientists_papers)<-c("a1","a2","a3","a4","a5","a6")
colnames(scientists_papers)<-c("e1","e2","e3","e4","e5","e6","e7","e8")
gplot(scientists_papers, displaylabels=TRUE, usearrows=FALSE, gmode="twomode")
rowSums(scientists_papers)
colSums(scientists_papers)

#Example of valued network
MATRIX2V<-matrix(c(5,1,0,0,
                   0,3,0,1,
                   0,0,1,3,
                   0,0,0,5,
                   1,5,1,0,
                   0,0,7,4),6,4, byrow=TRUE)
rownames(MATRIX2V)<-c("a","b","c","d","e","f")
colnames(MATRIX2V)<-c("w","x","y","z")
gplot(MATRIX2V, displaylabels=TRUE, 
      usearrows=FALSE, gmode="twomode")
gplot(MATRIX2V, displaylabels=TRUE, 
      usearrows=FALSE, gmode="twomode",edge.lwd=1)

# Centrality Measures
rowSums(scientists_papers)
rowSums(scientists_papers)/NCOL(scientists_papers)
colSums(scientists_papers)
colSums(scientists_papers)/NROW(scientists_papers)


t(scientists_papers)/colSums(scientists_papers)
t(t(scientists_papers)/colSums(scientists_papers))
rowSums(t(t(scientists_papers)/colSums(scientists_papers)))