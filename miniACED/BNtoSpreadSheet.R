## Q-Matrix to Spreadsheet
miniACED.Motif1 <- ReadNetworks("miniACEDFullMotif1.dne")
miniACED.Motif1 <- as.Pnet(miniACED.Motif1)
NetworkNodeSets(miniACED.Motif1)
PnetPnodes(miniACED.Motif1)
miniACED.prof <- NetworkNodesInSet(miniACED.Motif1,"Proficiencies")

miniACED.obs <- NetworkNodesInSet(miniACED.Motif1, "Observables") 


miniACED.Qmat <- Pnet2Qmat(miniACED.Motif1, miniACED.obs, miniACED.prof)
write.csv(miniACED.Qmat,file="miniACED.Qmat.csv")
