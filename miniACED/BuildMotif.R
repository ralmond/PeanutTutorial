## This script Builds up MiniACED starting from the Proficiency Model.
library(PNetica)

## Read in proficiency model
miniACED.Motif <- ReadNetworks("MiniACEDPnet.dne")
miniACED.prof <- NetworkAllNodes(miniACED.Motif)

if (FALSE) { ## Set to true to rebuild table
####### Build up a observable to evidence model table.
miniACED.EMtable <- c(
    "tCommonRatio1a"="CommonRatioEasyEM",
    "tCommonRatio1b"="CommonRatioEasyEM",
    "tCommonRatio2a"="CommonRatioMedEM",
    "tCommonRatio2b"="CommonRatioMedEM",
    "tCommonRatio3a"="CommonRatioHardEM",
    "tCommonRatio3b"="CommonRatioHardEM",
    "tExamplesGeometric1a"="ExamplesEasyEM",
    "tExamplesGeometric1b"="ExamplesEasyEM",
    "tExamplesGeometric2a"="ExamplesMedEM",
    "tExamplesGeometric2b"="ExamplesMedEM",
    "tExamplesGeometric3a"="ExamplesHardEM",
    "tExamplesGeometric3b"="ExamplesHardEM",
    "tExtendGeometric1a"="ExtendEasyEM",
    "tExtendGeometric1b"="ExtendEasyEM",
    "tExtendGeometric2a"="ExtendMedEM",
    "tExtendGeometric2b"="ExtendMedEM",
    "tExtendGeometric3a"="ExtendHardEM",
    "tExtendGeometric3b"="ExtendHardEM",
    "tTableExtendGeometric1a"="TableExtendEasyEM",
    "tTableExtendGeometric1b"="TableExtendEasyEM",
    "tTableExtendGeometric2a"="TableExtendMedEM",
    "tTableExtendGeometric2b"="TableExtendMedEM",
    "tTableExtendGeometric3a"="TableExtendHardEM",
    "tTableExtendGeometric3b"="TableExtendHardEM",
    "tModelExtendTableGeometric1a"="ModelTableExtendEasyEM",
    "tModelExtendTableGeometric1b"="ModelTableExtendEasyEM",
    "tModelExtendTableGeometric2a"="ModelTableExtendMedEM",
    "tModelExtendTableGeometric2b"="ModelTableExtendMedEM",
    "tModelExtendTableGeometric3a"="ModelTableExtendHardEM",
    "tModelExtendTableGeometric3b"="ModelTableExtendHardEM")

colX <- sapply(miniACED.prof[-1],
               function (n) NodeVisPos(n)["x"])
colY <- sapply(miniACED.prof[-1],
               function (n) NodeVisPos(n)["y"])


miniACED.EMtable <- data.frame(EM=miniACED.EMtable,X=rep(colX,each=6),
                               Y=rep(colY,each=6)+rep((1:6)*120,5))
write.csv(miniACED.EMtable,"MiniACEDEMTable.csv")
} else {
miniACED.EMtable <- read.csv("MiniACEDEMTable.csv",row.names=1,
                             as.is = 2)
} ## Read instead of rebuilding table.
## Now build up the motif.
for (i in 1:nrow(miniACED.EMtable)) {
  newNet <- ReadNetworks(paste(miniACED.EMtable[i,"EM"],"dne",sep="."))
  oname <- row.names(miniACED.EMtable)[i]
  newnode <- AdjoinNetwork(miniACED.Motif,newNet,oname)[[1]] #Should be only
                                        #one node.
  NodeName(newnode) <- oname
  #NodeVisPos(newnode) <- miniACED.EMtable[i,c("X","Y")]
  NodeSets(newnode) <- c("onodes","pnodes","Observables")
  DeleteNetwork(newNet)

}
WriteNetworks(miniACED.Motif,"miniACEDFullMotif.dne")

for (i in 1:nrow(miniACED.EMtable)) {
  anode <- NetworkFindNode(miniACED.Motif,row.names(miniACED.EMtable)[i])
  NodeVisPos(anode) <- miniACED.EMtable[i,c("X","Y")]
}

WriteNetworks(miniACED.Motif,"miniACEDFullMotif1.dne")

