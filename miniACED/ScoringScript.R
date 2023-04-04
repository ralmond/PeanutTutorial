## Scoring Script
## Preliminaries
library(RNetica)
library(CPTtools)

sess <- NeticaSession()
startSession(sess)

## Read in network -- Do this every time R is restarted
profModel <- ReadNetworks("miniACEDPnet.dne",session = sess)
## If profModels already exists could also use

## Reconnect nodes -- Do this every time R is restarted
allNodes <- NetworkAllNodes(profModel)
sgp <- allNodes$SolveGeometricProblems
profNodes <- NetworkNodesInSet(profModel,"Proficiencies")

#####################################################
## Aside 1 -- Node Sets
## Node sets can be viewed as either 
## (A) a set of labels assigned to each node.
## (B) a set of nodes which have a particular label.
## In RNetica, these are very useful as they define collections 
## of nodes that might be interesting in some way (e.g., 
## Proficiency variables, Observable variable, background variables)
## Node set operations yeild a list of nodes; 
## iterating over that set is often very useful.

## Node Sets
NetworkNodeSets(profModel)
NetworkNodesInSet(profModel,"pnodes")
NodeSets(sgp)

## These are all settable
NodeSets(sgp) <- c(NodeSets(sgp),"HighLevel")
NodeSets(sgp)

##############################################################
## Aside 2:  Common Net operations
## Just about everything that can be done through the Netica GUI, 
## can be done through the Netica API, and hence through R Netica.
## [In practice, the API version has lagged the GUI version, and my 
## RNetica release lag Norsys's API updates.]  Many more examples are in
## the RNetica help.  

## Querying Nodes
NodeStates(sgp)   #List states
NodeParents(sgp)  #List parents
NodeLevels(sgp)   #List numeric values associated with states
NodeProbs(sgp) # Conditional Probability Table (as array)
sgp[] # Conditional Probability Table (as data frame)
## These are all settable (can be used on RHS of <-) for model
## construction

## Inference
CompileNetwork(profModel) #Lightning bolt on GUI 
## Must do this before inference
## Recompiling an already compiled network is harmless

## Enter Evidence by setting values for these functions
NodeValue(sgp) #View or set the value
NodeLikelihood(sgp) #Virtual evidence

## Query beliefs
NodeBeliefs(sgp) #Current probability (given entered evidence)
NodeExpectedValue(sgp) #If node has values, EAP
## These aren't settable

## Retract Evidence
RetractNodeFinding(profNodes$ExamplesGeometric)
RetractNetFindings(profModel)

## Example
## Enter Evidence
NodeFinding(profNodes$CommonRatio) <- "Medium"
## Enter Evidence "Not Low" ("High or Medium")
NodeLikelihood(profNodes$ExamplesGeometric) <- c(1,1,0)

NodeBeliefs(sgp) #Current probability (given entered evidence)
NodeExpectedValue(sgp) #If node has values, EAP

## Retract Evidence
RetractNetFindings(profModel)

## Many more examples
help(RNetica)

####################################
## Back to work


## Read in task->evidence model mapping
EMtable <- read.csv("MiniACEDEMTable.csv",row.names=1,
                    as.is=2) #Keep EM names as strings
head(EMtable)


### @@@@@@@@@@@@@@@@@@@@@ Simple Scoring Example @@@@@@@@@@@@@@@@@@@@@@@@@@
### Start New Student
## Copy the master proficiency model 
## to make student model
Fred.SM <- CopyNetworks(profModel,"Fred")
Fred.SMvars <- NetworkAllNodes(Fred.SM)
CompileNetwork(Fred.SM)

## Setup score history
prior <- NodeBeliefs(Fred.SMvars$SolveGeometricProblems)
Fred.History <- matrix(prior,1,3)
row.names(Fred.History) <- "*Baseline*"
colnames(Fred.History) <- names(prior)
Fred.History

### Fred does a task
t.name <- "tCommonRatio1a"
t.isCorrect <- "Yes"

## Adjoin SM and EM
EMnet <- ReadNetworks(paste(EMtable[t.name,"EM"],"dne",sep="."),
                      session = sess)
obs <- AdjoinNetwork(Fred.SM,EMnet)
NetworkAllNodes(Fred.SM) 
## Fred.SM is now the Motif for the current task.
CompileNetwork(Fred.SM)

## Enter finding
NodeFinding(obs$isCorrect) <- t.isCorrect

## Calculate statistics of interest
post <- NodeBeliefs(Fred.SMvars$SolveGeometricProblems)
Fred.History <- rbind(Fred.History,new=post)
rownames(Fred.History)[nrow(Fred.History)] <- paste(t.name,t.isCorrect,sep="=")
Fred.History

## Cleanup and Observable no longer needed, so absorb it:
DeleteNetwork(EMnet) ## Delete EM
##AbsorbNodes(obs)
## Currently, there is a Netica bug with Absorb Nodes, we will
## leave this node in place, as that is mostly harmless.


### Fred does another task
t.name <- "tCommonRatio2a"
t.isCorrect <- "No"

EMnet <- ReadNetworks(paste(EMtable[t.name,"EM"],"dne",sep="."),session=sess)
obs <- AdjoinNetwork(Fred.SM,EMnet)
NetworkAllNodes(Fred.SM) ## Fred.SM is now the Motif for the current task.
CompileNetwork(Fred.SM)

NodeFinding(obs[[1]]) <- t.isCorrect
post <- NodeBeliefs(Fred.SMvars$SolveGeometricProblems)
Fred.History <- rbind(Fred.History,new=post)
rownames(Fred.History)[nrow(Fred.History)] <- paste(t.name,t.isCorrect,sep="=")
Fred.History

## Cleanup:  Delete EM and Absorb observables
DeleteNetwork(EMnet) ## Delete EM
##AbsorbNodes(obs)
## Currently, there is a Netica bug with Absorb Nodes, we will leave
##this the node in place as that is mostly harmless.

## Fred logs out
WriteNetworks(Fred.SM,"FredSM.dne")
DeleteNetwork(Fred.SM)
is.active(Fred.SM)  ## No longer active in Netica space

## Fred logs back in
Fred.SM <- ReadNetworks("FredSM.dne",session=sess)
is.active(Fred.SM)

####################################
## Score an entire set of cases.

miniACED.data <- read.csv("miniACED-Geometric.csv",row.names=1)
head(miniACED.data)
names(miniACED.data)
## Mark columns of table corresponding to tasks
first.task <- 9
last.task <- ncol(miniACED.data)
## Code key for numeric values
t.vals <- c("No","Yes")

## Pick a student, we might normally iterate over this.
Student.row <- 1

## Setup for student in sample
## Create Student Model from Proficiency Model
Student.SM <- CopyNetworks(profModel,"Student")
Student.SMvars <- NetworkAllNodes(Student.SM)
CompileNetwork(Student.SM)

## Initialize history list
prior <- NodeBeliefs(Student.SMvars$SolveGeometricProblems)
Student.History <- matrix(prior,1,3)
row.names(Student.History) <- "*Baseline*"
colnames(Student.History) <- names(prior)

## Now loop over tasks
for (itask in first.task:last.task) {
  
  ## Look up the EM for the task, and adjoin it.
  tid <- names(miniACED.data)[itask]
  EMnet <- ReadNetworks(paste(EMtable[tid,"EM"],"dne",sep="."), session=sess)
  obs <- AdjoinNetwork(Student.SM,EMnet)
  CompileNetwork(Student.SM)

  ## Add the evidence
  t.val <- t.vals[miniACED.data[Student.row,itask]] #Decode integer
  NodeFinding(obs[[1]]) <- t.val
  
  ## Update the history
  post <- NodeBeliefs(Student.SMvars$SolveGeometricProblems)
  Student.History <- rbind(Student.History,new=post)
  rownames(Student.History)[nrow(Student.History)] <- paste(tid,t.val,sep="=")

  ## Cleanup, Delete EM and Absob Observables
  DeleteNetwork(EMnet)
  ## AbsorbNodes(obs) # Still broken
}

## Now examine scoring history
head(Student.History)
woeBal(Student.History,c("High","Medium"),"Low",
       title=paste("Evidence Balance Sheet for ",
                   rownames(miniACED.data)[Student.row]))

## More ways to display scores
help(CPTtools)

