---
layout: post
title: Metropolis with log-transform
tags: machine learning
---

The *change of variable* is a common trick to sample from some distributions. Imagine that we have a random variable that comes from a disrtibution $p$:

$$
x \sim p_x(\theta)
$$

Sampling from $p$ is sometimes hard. Fortunatelly, sometimes it is easy to transform $x$ into a new variable such that its distribution is easier to sample from. Given such a transformation:

\begin{align}
y &= f(x)\\
(x &= g(y))
\end{align}

The probability distribution of $y$ is:
$$
p_y(y) = p_x(g(y)) ~|g'(y)|
$$
If we sample from $p_y$ and transform back the obtained samples through the function $w=g(y)$, it is as if we had obtained the $x$ samples directly from $p_x$

I will show this trick to sample from a Gamma distribution with a Metropolis sampler.  I will propose two alternative samplers, with and without reparametrization, and we will see how good they are

### Metropolis sampler

The classic metropolis sampler goes as follows. Given the last sample, we propose a random jump using a normal distribution. Then we compute the likelihood of the new proposal (under our target, Gamma, distribution). Then we accept the new sample with a probability
$$
a = 
$$

Note that each time that we jump into the negative numbers, the sample is rejected. We will avoid this waste of samples with a reparametrization.


### Metropolis sampler with reparametrized distribution
The proposal distribution of the Metropolis sampler wastes a lot of time proposing ilegal samples. However, if with a silly reparametrization there will be no ilegal samples since our range will be all the real numbers.

$$
y = ln(x)
$$

The Gamma distribution has a range in non-negative values.


The distribution is apparently tricky because it has a peak at 0.