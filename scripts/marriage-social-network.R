library(igraph)

marriages.taiwan <- read.csv("data-raw/taiwanese-families-dluhosova.csv")
marriages.taiwan$husband_familyname_std <- marriages.taiwan$TranslatedTargetFamilyName
marriages.taiwan$wife_familyname_std <- marriages.taiwan$TranslatedSourceFamilyName
marriages.taiwan.sn <- graph.data.frame(data.frame(marriages.taiwan$husband_familyname_std,marriages.taiwan$wife_familyname_std),directed=F)
plot(marriages.taiwan.sn)
V(marriages.taiwan.sn)$degree <- degree(marriages.taiwan.sn)

V(marriages.taiwan.sn)$betweenness <- betweenness(marriages.taiwan.sn)
V(marriages.taiwan.sn)$pr <- unname(unlist(page_rank(marriages.taiwan.sn)$vector))

save(marriages.taiwan, file="marriages-taiwan.RData")

plot(marriages.taiwan.sn,
     vertex.size=V(marriages.taiwan.sn)$betweenness/10000,
     vertex.label.cex= V(marriages.taiwan.sn)$pr*100,
     vertex.label.degree=V(marriages.taiwan.sn)$degree)

