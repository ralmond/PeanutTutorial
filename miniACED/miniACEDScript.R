library(RNetica)
library(CPTtools)

## These commands need to be rerun every time R is restarted.
## (re)Load Network
miniACED <- ReadNetworks("MiniACEDPM-Motif.dne")
## Connect to the Network
miniACED.nodes <- NetworkAllNodes(miniACED)
## Can select nodes by name from list
cr <- miniACED.nodes$CommonRatio

## Can access and set node properties.
NodeLevels(cr)
NodeLevels(cr) <- c(1,0,-1)
NodeLevels(cr)

NodeParents(cr)

## Set effective thetas for parent variable.
effectiveThetas(3)  ## Produces equally spaced points on normal distribution.
NodeLevels(cr) <- effectiveThetas(3)


## Create a new observable node.
tCommonRatio1a <- NewDiscreteNode(miniACED,
                                  "tCommonRatio1a",
                                  c("Right","Wrong"))
## Set parents to a list of nodes
NodeParents(tCommonRatio1a) <- list(cr)
WriteNetworks(miniACED)                 #Save Network

## Can use CPTtools to calculate CPT
calcDPCFrame(list(cr=NodeStates(cr)),
             NodeStates(tCommonRatio1a),
             c(cr=0),betas=1
             )

## Use Squared Bracket Notation to set/access CPT as data frame
tCommonRatio1a[] <- calcDPCFrame(list(cr=NodeStates(cr)),
                                 NodeStates(tCommonRatio1a),
                                 c(cr=0),betas=-1)
## Use NodeProbs() to set/access CPT as multiway array

## Node with two parents
tee <- miniACED.nodes$tableExtendEasy
NodeParents(tee)
calcDPCFrame(list(tab=NodeStates(cr),ext=NodeStates(cr)),
             NodeStates(tee),
             c(tab=.33,ext=0),betas=-1,
             rules="Compensatory")
