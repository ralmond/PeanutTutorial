![](img/2021%20BN%20Session%20IIIa_RNetica0.jpg)

![](img/2021%20BN%20Session%20IIIa_RNetica1.png)

__Bayesian Networks in__  __Educational Assessment__

__Tutorial__

__Session III:__  __ __  __Bayes Net with R__

Duanli Yan\, Diego Zapata\, ETS

Russell Almond\, FSU

2021 NCME Tutorial: Bayesian Networks in Educational Assessment

_SESSION_  __		__  _TOPIC_  __							__  _PRESENTERS_

__Session 1__ :   Evidence Centered Design 		Diego Zapata                       	               Bayesian Networks

__Session 2__ :   Bayes Net Applications 	           	Duanli Yan &                        	               ACED: ECD in Action 	 	      Russell Almond

__Session 3__ :   Bayes Nets with R 				Russell Almond & 		 											Duanli Yan

__Session 4__ :   Refining Bayes Nets with 		Duanli Yan & 	         	   Data 								Russell Almond

# RNetica

# Quick Start Guide
Scoring A Student

RNetica Quick Start

# Downloading

* [http://pluto\.coe\.fsu\.edu/RNetica/](http://pluto.coe.fsu.edu/RNetica/)
* Four Packages:
  * RNetica – R to Netica link
  * CPTtools – Design patterns for CPTs
  * Peanut/PNetica \-\- Object\-Oriented Parameterized Network
* Source & binary version \(Win 64\, Mac OS X\)
  * Binary versions include Netica\.dll/libNetica\.so
    * In RStudio select “Package Archive” rather than CRAN
  * Source version need to download from [http://www\.norsys\.com/](http://www.norsys.com/) first
    * See INSTALLATION

RNetica Quick Start

# License

* R – GPL\-3 \(Free and open source\)
* RNetica – Artistic \(Free and open source\)
* Netica\.dll/libNetica\.so – Commercial \(open API\, but not open source\)
  * Free Student/Demo version
    * Limited number of nodes
    * Limited usage \(education\, evaluation of Netica\)
  * Paid version \(see [http://www\.norsys\.com/](http://www.norsys.com/) for price information\)
    * Need to purchase API not GUI version of Netica
    * May want both \(use GUI to visualize networks build in RNetica\)
* CPTtools – Artistic \(Free and open source\)\, does not depend on Netica

RNetica Quick Start

# Installing the License Key

* When you purchase a license\, Norsys will send you a license key\.  Something that looks like:  “\+Course/FloridaSU/Ex15\-05\-30\,120\,310/XXXXX” \(Where I’ve obscured the last 5 security digits\)
* To install the license key\, start R in your project directory and type:
  * > NeticaLicenseKey <\- “\+Course/FloridaSU/Ex15\-05\-30\,120\,310/XXXXX”
  * > q\(“yes”\)
* Restart R and type
    * > library\(RNetica\)
* If license key is not installed\, then you will get the limited/student mode\.  Most of these examples will run

RNetica Quick Start

# The R heap and the Netica heap

R and Netica have two different workspaces \(memory heaps\)

R workspace is saved and restored automatically when you quick and restart R\.

Netica heap must be reconnected manually\.

RNetica Quick Start

# Active and Inactive pointers

When RNetica creates/finds a Netica object it creates a corresponding R object

If the R object is active then it points to the Netica object\, and the Netica object points back at it

If the pointer gets broken \(saving & restarting R\, deleting the network/node\) then the R object becomes inactive\.

The function is\.active\(nodeOrNet\) test to see if the node/net is active

RNetica Quick Start

# Mini-ACED Proficiency model

Subset of ACED network \(Shute\, Hansen & Almond \(2008\); [http://ecd\.ralmond\.net/ecdwiki/ACED](http://ecd.ralmond.net/ecdwiki/ACED) \)

Proficiency Model subset:

![](img/2021%20BN%20Session%20IIIa_RNetica2.png)

RNetica Quick Start

# Mini-ACED EM Fragments

All ACED tasks were scored correct/incorrect

Each evidence model is represented by a fragment consisting of observables with  _stub _ edges indicating where it should be  _adjoined_  with the network\.

![](img/2021%20BN%20Session%20IIIa_RNetica3.png)

![](img/2021%20BN%20Session%20IIIa_RNetica4.png)

Common Ratio Easy

Model Extend Table Hard

RNetica Quick Start

# Task to EM map

Need a table to tell us which EM to use with which task

| Task ID | EM Filename | X | Y |
| :-: | :-: | :-: | :-: |
| tCommonRatio1b | CommonRatioEasyEM | 108 | 414 |
| tCommonRatio2a | CommonRatioMedEM | 108 | 534 |
| tCommonRatio2b | CommonRatioMedEM | 108 | 654 |
| tCommonRatio3a | CommonRatioHardEM | 108 | 774 |
| tCommonRatio3b | CommonRatioHardEM | 108 | 894 |
| tExamplesGeometric1a | ExamplesEasyEM | 342 | 294 |
| tExamplesGeometric1b | ExamplesEasyEM | 342 | 414 |
|  |  |  |  |

RNetica Quick Start

# Scoring Script

Follow along using the script found in ScoringScript\.R in the miniACED folder\.

Don’t forget to setwd\(\) to the miniACED folder \(as it needs to find its networks\)\.

Don’t forget to set the license key before issuing library\(RNetica\) command\.

RNetica Quick Start

# Reloading Nets and Nodes

<span style="color:#00B050">\#\# Scoring Script</span>

<span style="color:#00B050">\#\# Preliminaries</span>

library\(RNetica\)

library\(CPTtools\)

<span style="color:#00B050">\#\# Read in network – Do this every time R is restarted</span>

profModel <\- ReadNetworks\("miniACEDPnet\.dne"\)

<span style="color:#00B050">\#\# If </span>  <span style="color:#00B050">profModels</span>  <span style="color:#00B050"> already exists could also use</span>

<span style="color:#00B050">\#\# Reconnect nodes – Do this every time R is restarted</span>

allNodes <\- NetworkAllNodes\(profModel\)

sgp <\- allNodes$SolveGeometricProblems

profNodes <\- NetworkNodesInSet\(profModel\,"Proficiencies"\)

RNetica Quick Start

# Aside 1: Node Sets

* Netica defines a node set functionality which
  * Adds a collection of labels \(sets\) to each node
  * Defines a collection of nodes with that label
* Netica GUI really only offers the opportunity to color nodes by set
* RNetica can loop over node sets \(lists of nodes\)
* <span style="color:#00B050">\#\# Node Sets</span>
* NetworkNodeSets\(profModel\)
* NetworkNodesInSet\(profModel\,"pnodes"\)
* NodeSets\(sgp\)
* <span style="color:#00B050">\#\# These are all settable</span>
* NodeSets\(sgp\) <\- c\(NodeSets\(sgp\)\,"HighLevel"\)
* NodeSets\(sgp\)

RNetica Quick Start

# Aside 2:  RNetica Functions

<span style="color:#00B050">\#\# Querying Nodes</span>

NodeStates\(sgp\)    <span style="color:#00B050">\#List states</span>

NodeParents\(sgp\)   <span style="color:#00B050">\#List parents</span>

NodeLevels\(sgp\)    <span style="color:#00B050">\#List numeric values associated with states</span>

NodeProbs\(sgp\)  <span style="color:#00B050">\# Conditional Probability Table \(as array\)</span>

sgp\[\]  <span style="color:#00B050">\# Conditional Probability Table \(as data frame\)</span>

<span style="color:#00B050">\#\# These are all settable \(can be used on RHS of <\-\) for </span>

<span style="color:#00B050">\#\# model construction</span>

<span style="color:#00B050">\#\# Inference</span>

CompileNetwork\(profModel\)  <span style="color:#00B050">\#Lightning bolt on GUI</span>

<span style="color:#00B050">\#\# Must do this before inference</span>

<span style="color:#00B050">\#\# Recompiling an already compiled network is harmless</span>

RNetica Quick Start

# Aside 2: Inference

<span style="color:#00B050">\#\# Enter Evidence by setting values for these functions</span>

NodeValue\(sgp\)  <span style="color:#00B050">\#View or set the value</span>

NodeLikelihood\(sgp\)  <span style="color:#00B050">\#Virtual evidence</span>

<span style="color:#00B050">\#\# Query beliefs</span>

NodeBeliefs\(sgp\)  <span style="color:#00B050">\#Current probability \(given entered evidence\)</span>

NodeExpectedValue\(sgp\)  <span style="color:#00B050">\#If node has values\, EAP</span>

<span style="color:#00B050">\#\# These aren't settable</span>

<span style="color:#00B050">\#\# Retract Evidence</span>

RetractNodeFinding\(profNodes$ExamplesGeometric\)

RetractNetFindings\(profModel\)

RNetica Quick Start

# Aside 2: Example

<span style="color:#00B050">\#\# Enter Evidence</span>

NodeValue\(profNodes$CommonRatio\) <\- "Medium"

<span style="color:#00B050">\#\# Enter Evidence "Not Low" \("High or Medium"\)</span>

NodeLikelihood\(profNodes$ExamplesGeometric\) <\- c\(1\,1\,0\)

NodeBeliefs\(sgp\)  <span style="color:#00B050">\#Current probability \(given entered evidence\)</span>

NodeExpectedValue\(sgp\)  <span style="color:#00B050">\#If node has values\, EAP</span>

<span style="color:#00B050">\#\# Retract Evidence</span>

RetractNetFindings\(profModel\)

<span style="color:#00B050">\#\# Many more examples</span>

help\(RNetica\)

RNetica Quick Start

# Back to work

Load the evidence model table

Row names are task IDs

EM column contains evidence model name

EM filename has suffix “\.dne” attached\.

<span style="color:#00B050">\#\# Read in task\->evidence model mapping</span>

EMtable <\- read\.csv\("MiniACEDEMTable\.csv"\,row\.names=1\,

as\.is=2\)  <span style="color:#00B050">\#Keep EM names as strings</span>

head\(EMtable\)

RNetica Quick Start

# A student walks into the test center …

* Student gives the name “Fred”
* Student is the right grade/age for ACED \(8th or 9th grader\, pre\-algebra\)
* Bayes net has three states
  * Fred logs into ACED
  * Fred attempts the task tCommonRatio1a and gets it right
  * Fred attempts the task tCommonRatio2a and gets it wrong

RNetica Quick Start

# Start a new student

<span style="color:#00B050">\#\# Copy the master proficiency model</span>

<span style="color:#00B050">\#\# to make student model</span>

Fred\.SM <\- CopyNetworks\(profModel\,"Fred"\)

Fred\.SMvars <\- NetworkAllNodes\(Fred\.SM\)

CompileNetwork\(Fred\.SM\)

<span style="color:#00B050">\#\# Setup score history</span>

prior <\- NodeBeliefs\(Fred\.SMvars$SolveGeometricProblems\)

Fred\.History <\- matrix\(prior\,1\,3\)

row\.names\(Fred\.History\) <\- "\*Baseline\*"

colnames\(Fred\.History\) <\- names\(prior\)

Fred\.History

RNetica Quick Start

# Score 1st Task

<span style="color:#00B050">\#\#\# Fred does a task</span>

t\.name <\- "tCommonRatio1a"

t\.isCorrect <\- "Yes"

<span style="color:#00B050">\#\# Adjoin SM and EM</span>

EMnet <\- ReadNetworks\(paste\(EMtable\[t\.name\,"EM"\]\,"dne"\,sep="\."\)\)

obs <\- AdjoinNetwork\(Fred\.SM\,EMnet\)

NetworkAllNodes\(Fred\.SM\)

<span style="color:#00B050">\#\# Fred\.SM is now the Motif for the current task\.</span>

CompileNetwork\(Fred\.SM\)

<span style="color:#00B050">\#\# Enter finding</span>

NodeFinding\(obs$isCorrect\) <\- t\.isCorrect

RNetica Quick Start

# Stats and Cleanup for 1st task

<span style="color:#00B050">\#\# Calculate statistics of interest</span>

post <\- NodeBeliefs\(Fred\.SMvars$SolveGeometricProblems\)

Fred\.History <\- rbind\(Fred\.History\,new=post\)

rownames\(Fred\.History\)\[nrow\(Fred\.History\)\] <\- paste\(t\.name\,t\.isCorrect\,sep="="\)

Fred\.History

<span style="color:#00B050">\#\# Cleanup and Observable no longer needed\, so absorb it:</span>

DeleteNetwork\(EMnet\) \#\# Delete EM

<span style="color:#00B050">\#\#</span> AbsorbNodes\(obs\)

<span style="color:#00B050">\#\# Currently\, there is a </span>  <span style="color:#00B050">Netica</span>  <span style="color:#00B050"> bug with Absorb Nodes\, we will leave</span>

<span style="color:#00B050">\#\# this node in place as that is mostly harmless\.</span>

RNetica Quick Start

# 2nd Task

<span style="color:#00B050">\#\#\# Fred does another task</span>

t\.name <\- "tCommonRatio2a"

t\.isCorrect <\- "No"

EMnet <\- ReadNetworks\(paste\(EMtable\[t\.name\,"EM"\]\,"dne"\,sep="\."\)\)

obs <\- AdjoinNetwork\(Fred\.SM\,EMnet\)

NetworkAllNodes\(Fred\.SM\)

<span style="color:#00B050">\#\# Fred\.SM is now the Motif for the current task\.</span>

CompileNetwork\(Fred\.SM\)

NodeFinding\(obs\[\[1\]\]\) <\- t\.isCorrect

post <\- NodeBeliefs\(Fred\.SMvars$SolveGeometricProblems\)

Fred\.History <\- rbind\(Fred\.History\,new=post\)

rownames\(Fred\.History\)\[nrow\(Fred\.History\)\] <\-

paste\(t\.name\,t\.isCorrect\,sep="="\)

Fred\.History

\# <span style="color:#00B050">\# Cleanup:  Delete EM and Absorb observables</span>

DeleteNetwork\(EMnet\) \#\# Delete EM

<span style="color:#00B050">\#\#</span>  AbsorbNodes\(obs\)

RNetica Quick Start

# Save and Restore

<span style="color:#00B050">\#\# Fred logs out</span>

WriteNetworks\(Fred\.SM\,"FredSM\.dne"\)

DeleteNetwork\(Fred\.SM\)

is\.active\(Fred\.SM\)

<span style="color:#00B050">\#\# No longer active in </span>  <span style="color:#00B050">Netica</span>  <span style="color:#00B050"> space</span>

<span style="color:#00B050">\#\# Fred logs back in</span>

Fred\.SM <\- ReadNetworks\("FredSM\.dne"\)

is\.active\(Fred\.SM\)

RNetica Quick Start

# Getting Serious

* ACED field test has 230 students attempt all 63 tasks\.
* File miniACED\-Geometric contains 30 task subset
  * There may be data registration issues here\, don’t publish using these data before checking with me for an update
* Each row is one student Record
* Lets score the first student
  * And build a score history

RNetica Quick Start

# Setup for mini-ACED

miniACED\.data <\- read\.csv\("miniACED\-Geometric\.csv"\,row\.names=1\)

head\(miniACED\.data\)

names\(miniACED\.data\)

<span style="color:#00B050">\#\# Mark columns of table corresponding to tasks</span>

first\.task <\- 9

last\.task <\- ncol\(miniACED\.data\)

<span style="color:#00B050">\#\# Code key for numeric values</span>

t\.vals <\- c\("No"\,"Yes"\)

RNetica Quick Start

# Setup new Student

<span style="color:#00B050">\#\# Pick a student\, we might normally iterate over this\.</span>

Student\.row <\- 1

<span style="color:#00B050">\#\# Setup for student in sample</span>

<span style="color:#00B050">\#\# Create Student Model from Proficiency Model</span>

Student\.SM <\- CopyNetworks\(profModel\,"Student"\)

Student\.SMvars <\- NetworkAllNodes\(Student\.SM\)

CompileNetwork\(Student\.SM\)

<span style="color:#00B050">\#\# Initialize history list</span>

prior <\- NodeBeliefs\(Student\.SMvars$SolveGeometricProblems\)

Student\.History <\- matrix\(prior\,1\,3\)

row\.names\(Student\.History\) <\- "\*Baseline\*"

colnames\(Student\.History\) <\- names\(prior\)

RNetica Quick Start

# Loop Part 1:  Add Evidence

<span style="color:#00B050">\#\# Now loop over tasks</span>

for \(itask in first\.task:last\.task\) \{

<span style="color:#00B050"> \#\# Look up the EM for the task\, and adjoin it\.</span>

tid <\- names\(miniACED\.data\)\[itask\]

EMnet <\- ReadNetworks\(paste\(EMtable\[tid\,"EM"\]\,"dne"\,sep="\."\)\)

obs <\- AdjoinNetwork\(Student\.SM\,EMnet\)

CompileNetwork\(Student\.SM\)

<span style="color:#00B050">\#\# Add the evidence</span>

t\.val <\- t\.vals\[miniACED\.data\[Student\.row\,itask\]\]  <span style="color:#00B050">\#Decode integer</span>

NodeFinding\(obs\[\[1\]\]\) <\- t\.val

RNetica Quick Start

# Loop Part 2: Capture Statistics

<span style="color:#00B050">\#\# Update the history</span>

post <\- NodeBeliefs\(Student\.SMvars$SolveGeometricProblems\)

Student\.History <\- rbind\(Student\.History\,new=post\)

rownames\(Student\.History\)\[nrow\(Student\.History\)\] <\- paste\(tid\,t\.val\,sep="="\)

<span style="color:#00B050">\#\# Cleanup\, Delete EM and </span>  <span style="color:#00B050">Absob</span>  <span style="color:#00B050"> Observables</span>

DeleteNetwork\(EMnet\)

<span style="color:#00B050">\#\# </span>  <span style="color:#00B050">AbsorbNodes</span>  <span style="color:#00B050">\(</span>  <span style="color:#00B050">obs</span>  <span style="color:#00B050">\) \# Still broken</span>

\}

RNetica Quick Start

# Weight of Evidence

Good \(1985\)

_H_  is binary hypothesis\, e\.g\.\,  _Proficiency_  >  _Medium_

_E_  is evidence for hypothesis

Weight of Evidence \(WOE\) is

