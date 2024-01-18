library(igraph)


noself.matrix <- matrix(c(0,1,1,0,
                           0,0,1,1,
                           0,0,0,1,
                           0,0,0,0),nrow=4,ncol=4)

noself.graph <- graph_from_adjacency_matrix(noself.matrix,mode="undirected")
V(noself.graph)$name <- c("A","B","C","D")
plot(noself.graph)
V(noself.graph)$eigen <- unname(unlist(eigen_centrality(noself.graph)$vector))

initial.matrix <- matrix(c(1,1,1,0,
                           0,0,1,1,
                           0,0,0,1,
                           0,0,0,0),nrow=4,ncol=4)
initial.graph <- graph_from_adjacency_matrix(initial.matrix,mode="undirected")
V(initial.graph)$name <- c("A","B","C","D")
plot(initial.graph)
V(initial.graph)$eigen <- unname(unlist(eigen_centrality(initial.graph)$vector))


modified.matrix <- matrix(c(0,2,1,1,0,
                            0,0,1,1,0,
                            0,0,0,1,1,
                            0,0,0,0,1,
                            0,0,0,0,0),
                          nrow=5,ncol=5)
modified.graph <- graph_from_adjacency_matrix(modified.matrix,mode="undirected")
V(modified.graph)$name <- c("A","A'","B","C","D")
plot(modified.graph)
V(modified.graph)$eigen <- unname(unlist(eigen_centrality(modified.graph)$vector))
