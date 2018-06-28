---
layout: post
title: Generating distributions with the Stick Breaking version of the Dirichlet Process
tags: nonparametrics
---
The Dirichlet Process is a prior over distributions. The basic definition relays on 
measure theory and has some obscure definitions for most of people. Intuitevily, imagine
we want to draw a distribution $$G$$ over the line of real numbers using some prior distribution $$P$$.
Imagine we partition the line in a set of partitions, and then we draw a G.
We say that $$P$$ is a Dirichlet Process if, for any possible partition of the line of real numbers,
the vector of probabilities for each partition is distributed according to a Dirichlet distribution:

$$
G(A_1),...,G(A_m) \sim \text{Dirichlet}(\alpha(A_1),...,\alpha(A_k))
$$

There are different ways to generate a distribution G. One of the most popular 
is the Stick Breaking construction. The trick is to realize that 

$$
G = \sum_k \beta_k \delta_{\theta_k}
$$

where $$\beta_k$$ weights sum up to 1, and the deltas are distributed around the line
of the real numbers according to some distribution. The stick breaking construction
goes as follows:

1. Take a stick of length 1 and make infinite random breaks. Each break removes a percentage 
$$v_k$$ of the remaining stick

	$$
	v_k \sim \text{Beta}(1, \alpha)
	$$

	The length of the removed break is

	$$
	\pi_k = v_k \prod_{i=1}^{k-1}(1-v_i)
	$$

	where $$\prod_{l=1}^{k-1}(1-v_l)$$ is the remaining length of the stick at step $k$.
	At the end of the process we have a collection of segments whose length sum is 1.

2. Draw infinite samples from a base distribution $$G_0$$:

	$$
	\phi_k \sim G_0
	$$

	where $$G_0$$ can be any distribution such as a Gaussian, a Poisson or a Multinomial.

3. We build our distribution as

	$$
	G = \sum_{k=1}^\infty \pi_k \delta_{\phi_k}
	$$


Here is the R code to sample from a Dirichlet Process using the Stick Breaking
construction:

```
K <- 1000

# Stick breaking
alpha <- 1000
v  <- rbeta(K, 1, alpha)

pi <- numeric(K)
pi[1] <- v[1] 
pi[2:K] <- sapply(2:K, function(i) v[i] * prod(1 - v[1:(i-1)]))

plot(cumsum(pi))
hist(pi, breaks=100)

# Atoms
G_0 <- function(n) rpois(n, 100)     # Poisson
G_0 <- function(n) rnorm(n, 0, 10) # Gaussian
y <- G_0(K) 

# Sample from the Dirichlet Process G
theta <- sample(y, prob = pi, replace = TRUE)
hist(theta, breaks = 20, xlab = "", main = "Samples from DP")
```

<figure>
	<center>
   <img src="{{ site.baseurl }}/assets/fig15_DPsamples.png" width="50%">
    <figcaption>Fig.1 - Matriz de adyacencia en Badalona.</figcaption>
   </center>
</figure>

