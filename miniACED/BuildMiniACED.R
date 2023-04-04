## This script Builds up MiniACED starting from the Proficiency Model.
library(PNetica)


miniACED.PM <- ReadNetworks("MiniACEDPM.dne")
miniACED.prof <- NetworkAllNodes(miniACED.PM)


## Network comes pre-loaded with proficiency nodes, so label them all
## as proficiencies.
NetworkNodesInSet(miniACED.PM,"Proficiencies") <- miniACED.prof

## Force this into a P-net.
miniACED.PM <- as.Pnet(miniACED.PM)
PnetPriorWeight(miniACED.PM) <- 10      #Default weight

sgp <- miniACED.prof$SolveGeometricProblems
NodeLevels(sgp) <- effectiveThetas(NodeNumStates(sgp))
PnodeQ(sgp) <- TRUE
PnodeRules(sgp) <- "Compensatory"
PnodeLink(sgp) <- "normalLink"
PnodeLinkScale(sgp) <- 1
PnodeLnAlphas(sgp) <- 1
PnodeBetas(sgp) <- 0


## TODO -- Apparently, Diego and I used the normal model to fit these,
## but never recorded the parameters.  Need to go back and do that.
## Note this doesn't match prior.  Need to fix.
calcDPCFrame(ParentStates(sgp),NodeStates(sgp),
                               PnodeLnAlphas(sgp), PnodeBetas(sgp),
                               PnodeRules(sgp),PnodeLink(sgp),
                               PnodeLinkScale(sgp),PnodeQ(sgp),
                               PnodeParentTvals(sgp))


cr <- miniACED.prof$CommonRatio
NodeLevels(cr) <- effectiveThetas(NodeNumStates(cr))
PnodeQ(cr) <- TRUE
PnodeRules(cr) <- "Compensatory"
PnodeLink(cr) <- "normalLink"
PnodeLinkScale(cr) <- 1
PnodeLnAlphas(cr) <- c(SolveGeometricProblems=0)
PnodeBetas(cr) <- 0

## Note this doesn't match prior.  Need to fix.
calcDPCFrame(ParentStates(cr),NodeStates(cr),
                               PnodeLnAlphas(cr), PnodeBetas(cr),
                               PnodeRules(cr),PnodeLink(cr),
                               PnodeLinkScale(cr),PnodeQ(cr),
                               PnodeParentTvals(cr))

exg <- miniACED.prof$ExamplesGeometric
NodeLevels(exg) <- effectiveThetas(NodeNumStates(exg))
PnodeQ(exg) <- TRUE
PnodeRules(exg) <- "Compensatory"
PnodeLink(exg) <- "normalLink"
PnodeLinkScale(exg) <- 1
PnodeLnAlphas(exg) <- c(SolveGeometricProblems=0)
PnodeBetas(exg) <- 0

## Note this doesn't match prior.  Need to fix.
calcDPCFrame(ParentStates(exg),NodeStates(exg),
                               PnodeLnAlphas(exg), PnodeBetas(exg),
                               PnodeRules(exg),PnodeLink(exg),
                               PnodeLinkScale(exg),PnodeQ(exg),
                               PnodeParentTvals(exg))

ext <- miniACED.prof$ExtendGeometric
NodeLevels(ext) <- effectiveThetas(NodeNumStates(ext))
PnodeQ(ext) <- TRUE
PnodeRules(ext) <- "Compensatory"
PnodeLink(ext) <- "normalLink"
PnodeLinkScale(ext) <- 1
PnodeLnAlphas(ext) <- c(SolveGeometricProblems=0)
PnodeBetas(ext) <- 0

## Note this doesn't match prior.  Need to fix.
calcDPCFrame(ParentStates(ext),NodeStates(ext),
                               PnodeLnAlphas(ext), PnodeBetas(ext),
                               PnodeRules(ext),PnodeLink(ext),
                               PnodeLinkScale(ext),PnodeQ(ext),
                               PnodeParentTvals(ext))

mdg <- miniACED.prof$ModelGeometric
NodeLevels(mdg) <- effectiveThetas(NodeNumStates(mdg))
PnodeQ(mdg) <- TRUE
PnodeRules(mdg) <- "Compensatory"
PnodeLink(mdg) <- "normalLink"
PnodeLinkScale(mdg) <- 1
PnodeLnAlphas(mdg) <- c(SolveGeometricProblems=0)
PnodeBetas(mdg) <- 0

## Note this doesn't match prior.  Need to fix.
calcDPCFrame(ParentStates(mdg),NodeStates(mdg),
                               PnodeLnAlphas(mdg), PnodeBetas(mdg),
                               PnodeRules(mdg),PnodeLink(mdg),
                               PnodeLinkScale(mdg),PnodeQ(mdg),
                               PnodeParentTvals(mdg))

tbg <- miniACED.prof$TableGeometric
NodeLevels(tbg) <- effectiveThetas(NodeNumStates(tbg))
PnodeQ(tbg) <- TRUE
PnodeRules(tbg) <- "Compensatory"
PnodeLink(tbg) <- "normalLink"
PnodeLinkScale(tbg) <- 1
PnodeLnAlphas(tbg) <- c(SolveGeometricProblems=0)
PnodeBetas(tbg) <- 0

## Note this doesn't match prior.  Need to fix.
calcDPCFrame(ParentStates(tbg),NodeStates(tbg),
                               PnodeLnAlphas(tbg), PnodeBetas(tbg),
                               PnodeRules(tbg),PnodeLink(tbg),
                               PnodeLinkScale(tbg),PnodeQ(tbg),
                               PnodeParentTvals(tbg))

PnetPnodes(miniACED.PM) <- miniACED.prof
WriteNetworks(miniACED.PM,"miniACEDPnet.dne")
if (FALSE) { ## This reads in the previous steps instead of redoing them
miniACED.PM <- ReadNetworks("miniACEDPnet.dne")
miniACED.prof <- NetworkAllNodes(miniACED.PM)
sgp <- miniACED.prof$SolveGeometricProblems
cr <- miniACED.prof$CommonRatio
exg <- miniACED.prof$ExamplesGeometric
ext <- miniACED.prof$ExtendGeometric
mdg <- miniACED.prof$ModelGeometric
tbg <- miniACED.prof$TableGeometric
}
###############################################################
## Evidence Models

### Levels 1, 2 and 3 refer to easy, medium and hard difficulty.  a
### and b are variants at the same level of difficulty.

## Common Ratio tCommonRatioXx.1
## Three Levels of difficulty Easy (-1), Medium (0) and Hard (1)
## One parent with alpha=1.
## Compensatory models.

item <- NewDiscreteNode(miniACED.PM,"isCorrect")
NodeLevels(item) <- c(1,0)
NodeParents(item) <- list(cr)
PnodeQ(item) <- TRUE
PnodeRules(item) <- "Compensatory"
PnodeLink(item) <- "partialCredit"
PnodeLnAlphas(item) <- c(CommonRatio=0)
NodeSets(item) <- c("Observables","pnodes","onodes")


## Make the Easy Variant EM
PnodeBetas(item) <- -1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(cr)+c(0,100) #In column with CR
CommonRatioEasyEM <- CreateNetwork("CommonRatioEasyEM")
CopyNodes(list(item),newnet=CommonRatioEasyEM)
WriteNetworks(CommonRatioEasyEM,"CommonRatioEasyEM.dne")


## Medium
PnodeBetas(item) <- 0
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(cr)+c(0,300) #In column with CR
CommonRatioMedEM <- CreateNetwork("CommonRatioMedEM")
CopyNodes(list(item),newnet=CommonRatioMedEM)
WriteNetworks(CommonRatioMedEM,"CommonRatioMedEM.dne")

## Hard
PnodeBetas(item) <- 1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(cr)+c(0,500) #In column with CR
CommonRatioHardEM <- CreateNetwork("CommonRatioHardEM")
CopyNodes(list(item),newnet=CommonRatioHardEM)
WriteNetworks(CommonRatioHardEM,"CommonRatioHardEM.dne")

## Examples -- tExamplesGeometricXx
## Three Levels of difficulty Easy (-1), Medium (0) and Hard (1)
## One parent with alpha=1.
## Compensatory models.

NodeParents(item) <- list(exg)
PnodeLnAlphas(item) <- c(ExamplesGeometric=0)


## Make the Easy Variant EM
PnodeBetas(item) <- -1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(exg)+c(0,100) #In column with EXG
ExamplesEasyEM <- CreateNetwork("ExamplesEasyEM")
CopyNodes(list(item),newnet=ExamplesEasyEM)
WriteNetworks(ExamplesEasyEM,"ExamplesEasyEM.dne")


## Medium
PnodeBetas(item) <- 0
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(exg)+c(0,300) #In column with EXG
ExamplesMedEM <- CreateNetwork("ExamplesMedEM")
CopyNodes(list(item),newnet=ExamplesMedEM)
WriteNetworks(ExamplesMedEM,"ExamplesMedEM.dne")

## Hard
PnodeBetas(item) <- 1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(exg)+c(0,500) #In column with EXG
ExamplesHardEM <- CreateNetwork("ExamplesHardEM")
CopyNodes(list(item),newnet=ExamplesHardEM)
WriteNetworks(ExamplesHardEM,"ExamplesHardEM.dne")

## Extend -- tExtendGeometricXx (note, also have 1c and 1d).
## Three Levels of difficulty Easy (-1), Medium (0) and Hard (1)
## One parent with alpha=1.
## Compensatory models.

NodeParents(item) <- list(ext)
PnodeLnAlphas(item) <- c(ExtendGeometric=0)

## Make the Easy Variant EM
PnodeBetas(item) <- -1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(ext)+c(0,100) #In column with EXT
ExtendEasyEM <- CreateNetwork("ExtendEasyEM")
CopyNodes(list(item),newnet=ExtendEasyEM)
WriteNetworks(ExtendEasyEM,"ExtendEasyEM.dne")


## Medium
PnodeBetas(item) <- 0
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(ext)+c(0,300) #In column with EXT
ExtendMedEM <- CreateNetwork("ExtendMedEM")
CopyNodes(list(item),newnet=ExtendMedEM)
WriteNetworks(ExtendMedEM,"ExtendMedEM.dne")

## Hard
PnodeBetas(item) <- 1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(ext)+c(0,500) #In column with EXT
ExtendHardEM <- CreateNetwork("ExtendHardEM")
CopyNodes(list(item),newnet=ExtendHardEM)
WriteNetworks(ExtendHardEM,"ExtendHardEM.dne")

## Table-Extend -- tTableExtendGeometricXx
## Three levels of Difficulty
## Log alpha for Table is .45, for extend is 0.

NodeParents(item) <- list(tbg,ext)
PnodeLnAlphas(item) <- log(c(TableGeometric=1.5,ExtendGeometric=1))

## Make the Easy Variant EM
PnodeBetas(item) <- -1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(tbg)+c(0,100) #In column with TBG
TableExtendEasyEM <- CreateNetwork("TableExtendEasyEM")
CopyNodes(list(item),newnet=TableExtendEasyEM)
WriteNetworks(TableExtendEasyEM,"TableExtendEasyEM.dne")


## Medium
PnodeBetas(item) <- 0
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(tbg)+c(0,300) #In column with TBG
TableExtendMedEM <- CreateNetwork("TableExtendMedEM")
CopyNodes(list(item),newnet=TableExtendMedEM)
WriteNetworks(TableExtendMedEM,"TableExtendMedEM.dne")

## Hard
PnodeBetas(item) <- 1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(tbg)+c(0,500) #In column with TBG
TableExtendHardEM <- CreateNetwork("TableExtendHardEM")
CopyNodes(list(item),newnet=TableExtendHardEM)
WriteNetworks(TableExtendHardEM,"TableExtendHardEM.dne")

## Model-Table-Extend --tModelTableExtendGeometricXx
## Three levels of Difficulty
## Log alpha for model is .45, for other is 0

NodeParents(item) <- list(mdg,tbg,ext)
PnodeLnAlphas(item) <- log(c(ModelGeometric=1.5,TableGeometric=1,
                             ExtendGeometric=1))

## Make the Easy Variant EM
PnodeBetas(item) <- -1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(mdg)+c(0,100) #In column with MDG
ModelTableExtendEasyEM <- CreateNetwork("ModelTableExtendEasyEM")
CopyNodes(list(item),newnet=ModelTableExtendEasyEM)
WriteNetworks(ModelTableExtendEasyEM,"ModelTableExtendEasyEM.dne")


## Medium
PnodeBetas(item) <- 0
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(mdg)+c(0,300) #In column with MDG
ModelTableExtendMedEM <- CreateNetwork("ModelTableExtendMedEM")
CopyNodes(list(item),newnet=ModelTableExtendMedEM)
WriteNetworks(ModelTableExtendMedEM,"ModelTableExtendMedEM.dne")

## Hard
PnodeBetas(item) <- 1
BuildTable(item)
NodeVisPos(item) <- NodeVisPos(mdg)+c(0,500) #In column with MDG
ModelTableExtendHardEM <- CreateNetwork("ModelTableExtendHardEM")
CopyNodes(list(item),newnet=ModelTableExtendHardEM)
WriteNetworks(ModelTableExtendHardEM,"ModelTableExtendHardEM.dne")

###
## Done with item, so delete it from the proficiency model.
DeleteNodes(item)



