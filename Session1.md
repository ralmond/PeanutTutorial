![](img/2021%20BN%20Session%20I0.png)

![](img/2021%20BN%20Session%20I1.jpg)

__Bayesian Networks in__  __Educational Assessment__

__Tutorial__

__Session I:__  __ __  __Evidence Centered Design__

__     Bayesian Networks__

Duanli Yan\, Diego Zapata\, ETS

Russell Almond\, FSU

Unpublished work © 2002\-2021

_SESSION_  __		__  _TOPIC_  __			__  _PRESENTERS_

__Session 1__ :   Evidence Centered Design 	Diego Zapata                       	         Bayesian Networks

__Session 2__ :   Bayes Net Applications 	           	Duanli Yan &                        	         ACED: ECD in Action 	 	Russell Almond

__Session 3__ :   Refining Bayes Nets with 	Russell Almond & 	         Data 				Duanli Yan

__Session 4__ :   Bayes Nets with R 		Duanli Yan & 		 				            Russell Almond

# The Interplay of Design and Statistical Modeling

Statistical models must be selected/tailored according to the needs of the assessment

Such selection and adaptation is only meaningful in the larger context of the assessment design

Understanding the discipline of assessment design is a necessary prerequisite for statistical modeling

Evidence Centered Design is an assessment design framework with general applicability and utility

# Test Design

* Stakeholders
* Requirements
  * Purpose of the test
  * Intended population
* Prospective Score Report
* Evidence\-Centered Design
  * Claims
  * Validity
* Specifications

# Evidence Centered Design

* Evidence Centered Design \(ECD\) provides a mechanism for
  * __Capturing and documenting__   __information__  about the structure and strength of evidentiary relationships\.
  * __Coordinating the work__  of test developers in authoring tasks and psychometricians in calibrating the measurement model\.
  * __Documenting the scientific information__  that provides the foundation for the assessment and its validity\.

![](img/2021%20BN%20Session%20I2.wmf)

* The Evidence Centered Design _ _ process is a series of procedures which center around the questions:
  * “What can we observe _ _ about an examinee's performance which will provide evidence _ _ that the examinee has or does not have the knowledge\, skills and abilities we wish to make claims _ _ about?”
  * “How can we structure situations to be able to make those observations?”
* This process results in a formal design for an assessment we call the  _Conceptual Assessment Framework \(CAF\)_

# The Initial Frame

* _Why_  are we measuring?
  * What are the goals and the desires for use of this assessment?
  * Prospective Score Report
* _Who_  are we measuring?
  * Who would take the assessment?
  * Who would view results and for what purpose?
* Goals of the assessment that represent the targets around which the rest of the design process is oriented

# Conceptual Assessment Framework (CAF)

_What_  we measure = Student __ __  <span style="color:#FF3300"> __Proficiency__ </span>  __ __ Model

<span style="color:#000000">Proficiency Model\(s\)</span>

_How_  we measure =  <span style="color:#FF3300"> __Evidence__ </span>  __ __ Model

_What_  _ _ we measure = Student __ __  <span style="color:#FF3300"> __Proficiency__ </span>  __ __ Model

<span style="color:#000000">Proficiency Model\(s\)</span>

_How_  we measure =  <span style="color:#FF3300"> __Evidence__ </span>  __ __ Model

_Where_  we measure =  <span style="color:#FF3300"> __Task__ </span>  __ __ Model

_What_  _ _ we measure = Student __ __  <span style="color:#FF3300"> __Proficiency__ </span>  __ __ Model

<span style="color:#000000">Proficiency Model\(s\)</span>

_How_  we measure =  <span style="color:#FF3300"> __Evidence__ </span>  __ __ Model

_Where_  we measure =  <span style="color:#FF3300"> __Task__ </span>  __ __ Model

_How Much_  we measure =  <span style="color:#FF3300"> __Assembly__ </span>  Model

_What_  _ _ we measure = Student __ __  <span style="color:#FF3300"> __Proficiency__ </span>  __ __ Model

<span style="color:#000000">Proficiency Model\(s\)</span>

_How_  we measure =  <span style="color:#FF3300"> __Evidence__ </span>  __ __ Model

_Where_  we measure =  <span style="color:#FF3300"> __Task__ </span>  __ __ Model

_How Much_  we measure =  <span style="color:#FF3300"> __Assembly__ </span>  Model

__                 __  _Customization_  __ __ =  <span style="color:#FF3300"> __Presentation & Delivery__ </span>  __ __ Models

<span style="color:#000000">Presentation Model</span>

_What_  _ _ we measure = Student __ __  <span style="color:#FF3300"> __Proficiency__ </span>  __ __ Model

<span style="color:#000000">Proficiency Model\(s\)</span>

# Activity 1: Driver’s License Exam

Redesign the driver’s licensure exam

Write down several claims you would like to make about people who receive a driver’s license

Group your claims into several proficiency variables related to the driver’s test

Do the claims hold for high\, medium or low values of those variables?

Use Netica as a drawing tool and add your variables

# Activity 1 (cont)

List a bunch of activities that you may want prospective drivers to do in their exam

What is environment of the task

What are manipulable features of the task?

Pick one of the tasks you created and build an evidence model for it\.

What are some observable outcomes? their possible values?

Which proficiencies do they measure?

Think a bit about putting this driver’s test together

How many tasks do we need of what types?

How much time will be spent in written tests?  On the road?  In simulators?

How do we verify the identity of applicants?

# ECD  Bayes Nets

Represent Qualitative ECD argument with a graph \(Domain Modeling\) \(Session I\)

Turn graphical structure into probability distribution over proficiency variables and observable outcomes \(Bayes net; Session I\)

Perform inference \(scoring\) using that Bayes net \(Session II\)

Express probabilities in terms of unknown parameters \-\- learn parameters \(Session III\)

Refine model based on how well it fits data \(Session IV\)

# Cup and Cap notation

# Conditional Probability

Definition

Law of Total Probability

![](img/2021%20BN%20Session%20I3.png)

![](img/2021%20BN%20Session%20I4.png)

# Bayes Theorem

![](img/2021%20BN%20Session%20I5.png)

Prior

Likelihood

Posterior

![](img/2021%20BN%20Session%20I6.png)

![](img/2021%20BN%20Session%20I7.png)

![](img/2021%20BN%20Session%20I8.png)

# Independence

![](img/2021%20BN%20Session%20I9.png)

A provides no information about B

# Accident Proneness (Feller, 1968)

* Driving Skill:  5/6 Normal\, 1/6 Accident Prone
* Probability of an accident in a given year
  * 1/100 for Normal drivers
  * 1/10 for Accident prone drivers
* Accidents happen independently in each year
* What is the probability a randomly chosen driver will have an accident in Year 1?
* Given a driver had an accident in Year 1\, what is probability of accident in Year 2?

# Accident Proneness (cont)

What is the probability a randomly chosen driver will have an accident in Year 1?  Year 2?

![](img/2021%20BN%20Session%20I10.png)

Given a driver had an accident in Year 1\, what is probability of accident in Year 2?

![](img/2021%20BN%20Session%20I11.png)

# Conditional Independence

![](img/2021%20BN%20Session%20I12.png)

Years are  _conditionally independent _ given driving skill

Years are  _marginally dependent_

Separation in graph tells the story

![](img/2021%20BN%20Session%20I13.png)

# Competing Explanations

* Skill 1 and Skill 2 are \(a priori\) independent in population
* Task X requires both skills \(conjunctive model\)
* Answer the following questions:
  * What is posterior after learning X=False\, and =High?
  * What is posterior after learning X=False\, and =High?
  * What is true of joint posterior of  and after learning X=False?

# D-Separation

For \, \, and  edges conditioning on middle variables renders outer variables independent

For  \(collider\) edges\, if middle variable \(or descendent is known\) then variables are dependent

A path is  _active_  if collider with middle node observed\, or non\-collider with middle node unobserved

# D-Separation Exercise

* Are  _A_  and  _C_  independent if
  * We have observed no other variables?
    * What could we condition on to make  _A_  and  _C_  independent?
  * We have observed  _F_  and  _H?_
    * What else could we condition on to make  _A_  and  _C_  independent?
  * We have observed  _G_ ?
    * What else could we condition on to make  _A_  and  _C_  independent?

# Building Up Complex Networks

Recursive representation of probability distributions:

All orderings are equally correct\, but some are more beneficial because they capitalize on causal\, dependence\, time\-order\, or theoretical relationships that we posit:Terms simplify when there is conditional independence –

in ed measurement\, due to unobservable student variables\.

# Building Up Complex Networks, cont.

For example\, in IRT\, item responses are conditionally independent given q:

# Bayes net

![](img/2021%20BN%20Session%20I14.png)

One factor for each node in graph in recursive representation

This factor is conditioned on parents in graph

“Prior” nodes have no parents

_p\(A\)p\(B\)p\(C|A\,B\)p\(D|C\)p\(E|C\)p\(F|D\,E\) = p\(A\,B\,C\,D\,E\,F\)_

Digraph must be acyclic

# Activity 2: Build a Bayes Net

Pick one of the tasks you created and build an a Bayes net in Netica:

Proficiency variables\, their possible values

Observable variables\, their possible values

Conditional probabilities between Proficiency variables and Observable variables

Add your observables to the proficiency model you made in Netica

