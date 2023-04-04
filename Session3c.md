![](img/2021%20BN%20Session%20IIIc_LearningCPTs0.jpg)

![](img/2021%20BN%20Session%20IIIc_LearningCPTs1.png)

__Bayesian Networks in__  __Educational Assessment__

__Tutorial__

__Session III:__  __ __  __Bayes Net with R__

Duanli Yan\, Diego Zapata\, ETS

Russell Almond\, FSU

2021 NCME Tutorial: Bayesian Networks in Educational Assessment

_SESSION_  __		__  _TOPIC_  __				__  _PRESENTERS_

__Session 1__ :   Evidence Centered Design 		Diego Zapata                       	              	         Bayesian Networks

__Session 2__ :   Bayes Net Applications 	           		Duanli Yan &                        	               	         ACED: ECD in Action 	 		Russell Almond

__Session 3__ :   Bayes Nets with R 			Russell Almond &									Duanli Yan

__Session 4__ :   Refining Bayes Nets with 		Duanli Yan &

Data 					Russell Almond

# Learning CPTs

# Thanks to Bob Mislevy for letting me use some of the slides from his class.

# First Layer

A simple model with two skills and 3 observables

# Distributions and Variables

Variables \(values are person specific\)

_Distributions_  provide probabilities for variables

# Different People, Same Distributions

# Second Layer

![](img/2021%20BN%20Session%20IIIc_LearningCPTs2.png)

Distributions have Parameters

Parameters are the same across all people

Parameters drop down into first layer to do person specific computations \(e\.g\.\, scoring\)

Probability distributions of parameters are called  _Laws_

![](img/2021%20BN%20Session%20IIIc_LearningCPTs3.png)

Distributions have Parameters

Parameters are the same across all people

Parameters drop down into first layer to do person specific computations \(e\.g\.\, scoring\)

Probability distributions of parameters are called  _Laws_

![](img/2021%20BN%20Session%20IIIc_LearningCPTs4.png)

![](img/2021%20BN%20Session%20IIIc_LearningCPTs5.png)

# Speigelhalter And Lauritzen (1990)

_Global Parameter Independence_  – parameters of laws for different CPTs are independent

_Local Parameter Independence – _ parameters for laws for different rows of CPTs are independent

Under these two assumptions\, the natural conjugate law of a Bayesian network is a  _hyper\-_  _Dirichlet_   _law_ \, a law where the probabilities on each row of each CPT follow a Dirichlet law\.

Abusing the definition\, we say that a CPT for which each rows is given an independent Dirichlet law follows a  _hyper\-_  _Dirichlet_  _ distribution \(_ really should be law\)\.

# A closer look at the binomial distribution

__Binomial\.__    For counts of successes in binary trials\, each with probability p\, in n independent trials\.   E\.g\.\, n coin flips\, with p the common probability of heads\.

Count of successes

Count of failures

The “success probability” parameter

The failure probability

The success probability

We will be using this as a likelihood in an example of the use of conjugate distributions\.

# A closer look at the Beta distribution

__Beta\.__   Defined on \[0\,1\]\.  Conjugate prior for the probability parameter in Bernoulli & binomial models\.

p ~ dbeta\(a\,b\)

Mean\(p\):

Variance\(p\):

Mode\(p\):

PseudoCount

of successes

PseudoCount

of failures

The variable:

“success probability”

The failure

probability

Shape\, or

“prior sample info”

The success

probability

# An example with a continuous variable: A beta-binomial example--the Prior Distribution

* The prior distribution:
* Let’s suppose we think it is more likely that the coin is close to fair\, so p is probably nearer to \.5 than it is to either 0 or 1\.  We don’t have any reason to think it is biased toward either heads or tails\, so we’ll want a prior distribution that is symmetric around \.5\.  We’re not real sure about what p might be\-\-say about as sure as only 6 observations\.  This corresponds to 3 pseudo\-counts of H and 3 of T\, which\, if we want to use a beta distribution to express this belief\, corresponds to beta\(4\,4\):

__Beta\.__   Defined on \[0\,1\]\.  Conjugate prior for the probability parameter in Bernoulli & binomial models\.

p ~ dbeta\(4\,4\)

Mean\(p\):

Variance\(p\):

Mode\(p\):

PseudoCount

of successes

PseudoCount

of failures

The variable:

“success probability”

The failure

probability

Shape\, or

“prior sample info”

The success

probability

# An example with a continuous variable: A beta-binomial example--the Likelihood

* The likelihood:
* Next we will flip the coin ten times\.  Assuming the same true \(but unknown to us\) value of p is in effect for each of ten independent trials\, we can use the binomial distribution to model the probability of getting any number of heads: i\.e\.\,

Count of  _observed_  successes

Count of  _observed_

failures

The “success probability” parameter

The failure probability

The success probability

* The likelihood:
* We flip the coin ten times\, and observe 7 heads; i\.e\.\, r=7\. The likelihood is obtained now using the same form as in the preceding slide\, except now r is fixed at 7 and we are interested in the relative value of this function at different possible values of p:

# An example with a continuous variable: Obtaining the posterior by Bayes Theorem

posterior              likelihood        prior

General form:

In our example\, 7 plays the role of x\*\, and p plays the role of y\. Before normalizing:

This function is proportional to a beta\(11\,7\) distribution\.

After normalizing:

Now\, how can we get an idea of what this means we believe about p after combining our prior belief and our observations?

# An example with a continuous variable: In pictures

Prior

x

Likelihood

Posterior

# Dirichlet—Categorical conjugate distribution

Assume a variable  _X_  takes on category  _1\,…\,K _ with probabilities  _p_  _1_  _\,…_  _p_  _K_

Take  _N_  draws from this distribution and observe counts  _N=X_  _1_  _\+ … \+ X_  _K_

Likelihood is

Dirichlet Prior:

Posterior:

![](img/2021%20BN%20Session%20IIIc_LearningCPTs6.png)

![](img/2021%20BN%20Session%20IIIc_LearningCPTs7.png)

![](img/2021%20BN%20Session%20IIIc_LearningCPTs8.png)

# Updating an unconditional probability table (no parent variables)

Prior is a table of alphas:

Sum of alphas is pseudo\-sample size for prior:  Netica calls this Node Experience

Sufficient statistic is a table of counts in each category

Posterior is an updated table

With updated Node Experience  _A’=A\+N_

| a1 | … | aK |
| :-: | :-: | :-: |


![](img/2021%20BN%20Session%20IIIc_LearningCPTs9.png)

| X1 | … | XK |
| :-: | :-: | :-: |


| a1+X1 | … | aK+XK |
| :-: | :-: | :-: |


# Details

Equivalent to beta\-binomial when variable only takes two values

Alphas must be positive\, but don’t need to be integers

Alpha = ½ is non\-informative prior

A \(sum of alphas\) acts like a pseudo\-sample size for the prior

Can also write as

![](img/2021%20BN%20Session%20IIIc_LearningCPTs10.png)

# CPT updating when parents are fully observed

Data are contingency table of child variable given parents

Prior is a table of pseudo\-counts

Get posterior by adding them together

Note:  Both prior and posterior effective sample size \(Node Experience\) can be different for each row\.

![](img/2021%20BN%20Session%20IIIc_LearningCPTs11.png)

# Netica example – fully observed

![](img/2021%20BN%20Session%20IIIc_LearningCPTs12.png)

2011 NCME Tutorial: Bayesian Networks in Educational Assessment  \- Session IV

# RNetica example  (Ex 8.3)

Set up network

Two parents\, one child

hdnet <\- CreateNetwork\("hyperDirchlet"\)

skills <\- NewDiscreteNode\(hdnet\,c\("Skill1"\,"Skill2"\)\,c\("High"\,"Medium"\,"Low"\)\)

obs <\- NewDiscreteNode\(hdnet\,"Observable"\,c\("Right"\,"Wrong"\)\)

NodeParents\(obs\) <\- skills

# Set up prior for Observation

Do this by setting CPT and NodeExperience \(row pseudo\-sample sizes\)

ptab <\- data\.frame\(Skill1=rep\(c\("High"\,"Medium"\,"Low"\)\,3\)\,                Skill2=rep\(c\("High"\,"Medium"\,"Low"\)\,each=3\)\,                Right=c\(\.975\,\.875\,\.5\,\.875\,\.5\,\.125\,\.5\,\.125\,\.025\)\,

Wrong=1\-c\(\.975\,\.875\,\.5\,\.875\,\.5\,\.125\,\.5\,\.125\,\.025\)\)

obs\[\] <\- ptab

NodeExperience\(obs\) <\- 10 \#All rows equally weighted

# Prior CPT

ptab

rescaleTable\(ptab\,10\)

Skill1 Skill2 Right Wrong

1   High   High 0\.975 0\.025

2 Medium   High 0\.875 0\.125

3    Low   High 0\.500 0\.500

4   High Medium 0\.875 0\.125

5 Medium Medium 0\.500 0\.500

6    Low Medium 0\.125 0\.875

7   High    Low 0\.500 0\.500

8 Medium    Low 0\.125 0\.875

9    Low    Low 0\.025 0\.975

Skill1 Skill2 Right Wrong

1   High   High  9\.75  0\.25

2 Medium   High  8\.75  1\.25

3    Low   High  5\.00  5\.00

4   High Medium  8\.75  1\.25

5 Medium Medium  5\.00  5\.00

6    Low Medium  1\.25  8\.75

7   High    Low  5\.00  5\.00

8 Medium    Low  1\.25  8\.75

9    Low    Low  0\.25  9\.75

# Netica Case files

Text file\, column separated by tabs \(same as \.xls files\, but have \.cas extension\)

One column for each observed variable \(need both parents and child in this case\)

Optional IDnum column

Optional NumCases column gives replication count

So can either repeat out cases\, or use summary counts\.

write\.CaseFile\(\) writes out a case file for use with Netica

# Case Table for Ex 8.3

dtab <\- data\.frame\(Skill1=rep\(c\("High"\,"Medium"\,"Low"\)\,3\,each=2\)\,

Skill2=rep\(c\("High"\,"Medium"\,"Low"\)\,each=6\)\,

Observable=rep\(c\("Right"\,"Wrong"\)\,9\)\,

NumCases=c\(293\,3\,

112\,16\,

0\,1\,

14\,1\,

92\,55\,

4\,5\,

5\,1\,

62\,156\,

8\,172\)\)

write\.CaseFile\(dtab\,"Ex8\.3\.cas"\)

# Example Case File

Skill1 Skill2 Observable NumCases

1    High   High      Right      293

2    High   High      Wrong        3

3  Medium   High      Right      112

4  Medium   High      Wrong       16

5     Low   High      Right        0

6     Low   High      Wrong        1

7    High Medium      Right       14

8    High Medium      Wrong        1

9  Medium Medium      Right       92

10 Medium Medium      Wrong       55

11    Low Medium      Right        4

12    Low Medium      Wrong        5

13   High    Low      Right        5

14   High    Low      Wrong        1

15 Medium    Low      Right       62

16 Medium    Low      Wrong      156

17    Low    Low      Right        8

18    Low    Low      Wrong      172

# Learn CPTs

LearnCases does complete data hyper\-Dirichlet updating

LearnCases\("Ex8\.3\.cas"\,obs\)

NodeExperience\(obs\)

Skill2

Skill1   High Medium Low

High    306     25  16

Medium  138    157 228

Low      11     19 190

# Prior and Posterior CPTs

Prior

Posterior

Skill1 Skill2 Right Wrong

1   High   High 0\.975 0\.025

2 Medium   High 0\.875 0\.125

3    Low   High 0\.500 0\.500

4   High Medium 0\.875 0\.125

5 Medium Medium 0\.500 0\.500

6    Low Medium 0\.125 0\.875

7   High    Low 0\.500 0\.500

8 Medium    Low 0\.125 0\.875

9    Low    Low 0\.025 0\.975

Skill1 Skill2 Right Wrong

1   High   High 0\.989 0\.011

2 Medium   High 0\.848 0\.152

3    Low   High 0\.795 0\.205

4   High Medium 0\.760 0\.240

5 Medium Medium 0\.588 0\.412

6    Low Medium 0\.276 0\.724

7   High    Low 0\.859 0\.141

8 Medium    Low 0\.277 0\.723

9    Low    Low 0\.068 0\.932

# Prior and Posterior Alphas

Prior

Posterior

Skill1 Skill2 Right Wrong

1   High   High  9\.75  0\.25

2 Medium   High  8\.75  1\.25

3    Low   High  5\.00  5\.00

4   High Medium  8\.75  1\.25

5 Medium Medium  5\.00  5\.00

6    Low Medium  1\.25  8\.75

7   High    Low  5\.00  5\.00

8 Medium    Low  1\.25  8\.75

9    Low    Low  0\.25  9\.75

Skill1 Skill2  Right  Wrong

1   High   High 302\.75   3\.25

2 Medium   High 117\.00  21\.00

3    Low   High   8\.75   2\.25

4   High Medium  19\.00   6\.00

5 Medium Medium  92\.25  64\.75

6    Low Medium   5\.25  13\.75

7   High    Low  13\.75   2\.25

8 Medium    Low  63\.25 164\.75

9    Low    Low  13\.00 177\.00

# Problems with hyper-Dirichlet approach

* Learn more about some rows than others
* Local parameter independence assumption is unrealistic – often want CPT to be monotonic \(increasing skill means increasing chance of success\)
  * _l_  _2\,2 _  _> _  _l_  _2\,1_  _>_  _l_  _1\,1 _  _ _ and  _l_  _2\,2 _  _> _  _l_  _1\,2_  _>_  _l_  _1\,1 _
* Solution is to use parametric models for CPT:
  * Noisy\-min & Noisy\-max
  * DiBello\-Samejima families
  * Discrete Partial Credit families

# Learning CPTs for a parametric family

* Contingency table is sufficient statistic for law for any CPT\!
* Pick value of law parameters that maximize the posterior probability \(or likelihood\) of the observed contingency table\.
* Fully Bayesian method
  * Put hyper\-laws over law hyperparameters
  * Calculate observed contingency table
  * MAP estimates maximize posterior probability of contingency table
* Semi\-Bayesian method
  * Use prior hyperparameters to calculate prior table\.
  * Establish a pseudo\-sample size for each row and calculate prior alphas
  * Do hyper\-Dirichlet updating to get posterior alphas
  * MAP estimates maximize posterior probability of posterior alphas \(treating them as if they were data\)
  * CPTtools function mapCPT does this

# Newton-Raphson Method

* Originally for finding zeros of a function\, but if we apply it to the first derivative\, then it finds local maxima and minima of the function
* Each step moves closer to the maximum
* May be multiple maxima
  * Multiple starting points
  * Simulated annealing & other modifications

# Animation

[http://en\.wikipedia\.org/wiki/File:NewtonIteration\_Ani\.gif](http://en.wikipedia.org/wiki/File:NewtonIteration_Ani.gif)

![](img/2021%20BN%20Session%20IIIc_LearningCPTs13.gif)

# Gradient Decent

[http://vis\.supstat\.com/2013/03/gradient\-descent\-algorithm\-with\-r/](http://vis.supstat.com/2013/03/gradient-descent-algorithm-with-r/)

# Missing and Latent Variables

* _Missing completely at random \(MCAR\) – _ whether or not  _Y_  _i_  _ _ is missing is independent of both  _Y_  _i_  _ _ and any observed covariate  _X_  _i_
  * Casewise deletion provides an unbiased estimate only in this case\!
* _Missing at Random \(MAR\)_  – whether or not  _Y_  _i_  _ _ is missing is independent of  _Y_  _i_  _ _ given observed covariates  _X_  _i_
  * EM algorithm & MCMC work here
  * Latent variables are a special case
* _Non\-ignorable _  _missingness_  _ – _ Not MAR

# MCAR, MAR or Non-ignorable (Ex 9.2)

A survey of high school seniors asks the school administrator to provide grade point average and college entrance exam scores\. College entrance exam scores are missing for students who have not taken the test\.

Same survey except now survey additionally asks whether or not student has declared an intent to apply for college\.

To reduce the burden on the students filling out the survey\, the background questions are divided into several sections\, and each student is assigned only some of the sections using a spiral pattern\. Responses on the unassigned section are missing\.

Some students when asked their race decline to answer\.

1\. John did not answer Task j because it was not on the test form he was administered\.

2\. Diwakar did not answer Task j because there are linked harder and easier test forms\, intended for fourth and sixth grade students; Task j is an easy item that only appears on the fourth grade form; and Diwakar is in sixth grade\, so he was administered the hard form\.

3\. Rodrigo took an adaptive test\. He did well\, the items he was administered tended to be harder as he went along\, and Task j was not selected to administer because his responses suggested it was too easy to provide much information about his proficiency\.

4\. Task j was near the end of the test\, and Ting did not answer it because she ran out of time\.

5\. Shahrukh looked at Task j and decided not to answer it because she thought she would probably not do well on it\.

6\. Howard was instructed to examine four items and choose two of them to answer\. Task j was one of the four\, and not one that Howard chose\.

# EM Algorithm (Dempster, Laird & Rubin, 1977)

Key idea:

Pick a set of value for parameters

_E\-step \(a\):_  Calculate distribution for missing variables given observed variables & current parameter values\.

_E\-step \(b\):_  Calculate expected value of sufficient statistics

_M\-step:_  Use Gradient Decent to produce MAP/MLE estimates for parameters given sufficient statistics

Loop 2—4 until convergence

# EM algorithm details

* Only need to take a few steps of the gradient algorithm in Step 4 \(Generalized EM\)
* Can exploit conditional independence conditions\, particularly global parameter independence \(Structual EM\, Meng and van Dyke\)
  * Once CPT at a time
* Can be slow
  * But not as slow as MCMC
* Netica provides built\-in support for special case of hyper\-Dirichlet law

# Expected value of missing (latent) node

Can calculate this using ordinary Netica operations \(instantiate all observed variables and read off joint beliefs\)

Instead of adding count to the table\, add fractional count to the table

Similarly use joint beliefs when more than one parent is missing

# Example

* Observable  _X_  in  _\{0\, 1\}; _ Latent  _q_  in  _\{H\,M\,L\}_
* Observations:
  * _X=1; p\(_  _q_  _\) = H:\.33\, M:\.33\, L:\.33_
  * _X=1; p\(_  _q_  _\) = H:\.5\, M:\.33\, L:\.2_
  * _X=0; p\(_  _q_  _\) = H:\.2\, M:\.3\, L:\.5_
* Expected table:

|  | H | M | L |
| :-: | :-: | :-: | :-: |
| 1 | .83 | .67 | .53 |
| 0 | .2 | .3 | .5 |

# EM for hyper-Dirichlet (RNetica LearnCPTs function)

Use current CPTs to calculate expected tables for all of the CPTs we are learning

Use the hyper\-Dirichlet conjugate updating to update the CPTs

Loop 1 and 2 until convergence

_Note:  _  _RNetica_  _ _  _LearnCPT_  _ function currently does not reveal whether or not convergence was reached\._

# Netica example – partially observed

![](img/2021%20BN%20Session%20IIIc_LearningCPTs14.png)

2011 NCME Tutorial: Bayesian Networks in Educational Assessment  \- Session IV

# Parameterized tables

Use current parameters to set initial CPTs

Use Netica’s LearnCPTs to calculate posterior tables

Multiple posterior tables by node experience to get pseudo\-table for each CPT

Use gradient decent to optimize CPT parameters

Loop 1—4 until convergence

I’m currently working on an implementation in R\.

# Breakdown of global parameter independence

Even if parameters are  _a priori_  independent\, when there is missing \(or latent\) data then parameters are not independent  _a posteriori_ \.

EM algorithm only gives point estimate\, does not capture this dependence

There might also be other information which makes parameters dependent\.

![](img/2021%20BN%20Session%20IIIc_LearningCPTs15.png)

# Markov Chain Monte Carlo (MCMC)

In place of E\-step\, randomly sample values for unknown \(latent & missing\) variables

In place of M\-step\, randomly sample values for parameters

Takes longer than EM\, but gives you an impression of the whole distribution rather than just a part\.

