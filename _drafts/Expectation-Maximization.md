---
title: "Expectation-Maximization"
layout: post
tags: machine learning
---

Introduction
------------

The Expectation-Maximisation algorithm has been around for... 

Maximum Likelihood with latent variables
----------------------------------------

Consider a set of $N$ independent observations, denoted by $\mathcal{D} = \\{x_n\\}_{n=1}^N$. 
We assume it has been drawn from a distribition $p(x | \theta)$. The Maximum Likelihood Estimator of the parameter $\theta$, denoted as $\hat{\theta}$, is defined as

\begin{align}
\hat{\theta} \triangleq 
\underset{\theta}{\operatorname{argmax}}
\sum_{n=1}^N \log p(x_n | \theta)
\end{align} 

Unfortunatelly, a simple parametric distribution is often a very poor fit of the data. If the observations are distributed in groups, for instance, a simple distribution can not be fitted to all of them. To overcome this, we think of a slightly more sophisticated generative process. First, each data point picks a class. Then, the observation is drawn from a simple distribution. This generative process is written as

\begin{align}
z_n &\sim p(z)\\\\\\
x_n &\sim p(x | z_n)
\end{align}

In order to find the maximum likelihood estimator, we need to marginalise out the latent variable, since we do not know its value.

\begin{align}
\hat{\theta} = 
\underset{\theta}{\operatorname{argmax}}
\sum_{n=1}^N \log \int p(x_n, z_n | \theta) \text{d}z_n
\end{align} 

The problem is that, in the non-trivial cases, we don't know how how to solve this integral. Here is the trick. Let's tweek the integrand a bit so that the integral represents an expectation. Then, we will use Jensen's inequality, that states that the log of an expectation is equal or greather than the expectation of the log, i.e., $\log \mathbb{E}[f(x)] \geq  \mathbb{E}[\log f(x)]$:

\begin{align}
\sum_{n=1}^N \log \int p(x_n, z_n | \theta) \text{d}z_n
&=
\sum_{n=1}^N \log \int \frac{p(x_n, z_n | \theta)}{q(z_n)} q(z_n)\text{d}z_n
\\\\\\
&=
\sum_{n=1}^N \log \mathbb{E}_{q(z_n)}\left[ \frac{p(x_n, z_n | \theta)}{q(z_n)}\right]
\\\\\\
&\geq
\sum\_{n=1}^N
\mathbb{E}\_{q(z_n)}
\left[ 
    \log \frac{p(x_n, z_n | \theta)}{q(z_n)}
\right] = \sum\_{n=1}^{N} \mathcal{L}\_{\theta}(x_n)
\end{align}

What happened here? We replaced the original likelihood, that we want to maximize, by a lower bound. Finding a lower bound is no big deal. If we divide a function by a constant factor we have a lower bound. This lower bound, however, has something special. Let's analyse it. 

\begin{align}
\mathcal{L}_\theta (x_n) &= 
\mathbb{E}\_{q(z_n)}
[\log p(x_n, z_n | \theta)]
-
\mathbb{E}\_{q(z_n)}[\log q(z_n)]
\\\\\\
&=
\mathbb{E}\_{q(z_n)} [\log p(x_n, z_n | \theta)]
\- 
\mathbb{E}\_{q(z_n)}[\log p(z_n | x_n, \theta)]
\-
\mathbb{E}\_{q(z_n)}[\log q(z_n)]
\+
\mathbb{E}\_{q(z_n)}[\log p(z_n | x_n, \theta)]
\\\\\\
&=
\mathbb{E}\_{q(z_n)}
\left[\log \frac{p(x_n, z_n | \theta)}{p(z_n | x_n, \theta)}\right]
\-
\mathbb{E}\_{q(z_n)}
\left[
\log \frac{q(z_n)}{p(z_n | x_n, \theta)}
\right]
\\\\\\
&=
p(x_n | \theta)
-
\text{KL}(q(z_n) | p(z_n | x_n, \theta))
\end{align}
We just found a secrete message hidden in the lower bound: the lower bound is the sum of the evidence minus the Kullback-Leibler divergence between the posterior distribution and $q(z)$. Therefore, if we use the posterior for $q(z)$, maximizing the lower bound is equivalent to maximizing the evidence!

Let us then set $q(z)=p(z_n \| x_n, \theta)$:

\begin{align}
\mathcal{L}_\theta(x_n) = 
\mathbb{E}\_{p(z_n | x_n, \theta)}
[\log p(x_n, z_n | \theta)]
-
\mathbb{E}\_{p(z_n | x_n, \theta)}
[\log p(z_n | x_n, \theta)]
\end{align}
and now observe a subtile problem. If the posterior did not depend on the parameters $\theta$, we could compute it once and then optimise the first term, knowing that we are optimizing the evidence. But the posterior does depend on the parameters, and every time we optimise the parameters in the first term, the posterior is not up-to-date for those parameters!

Expectation-Maximization
------------------------
The Expectation-Maximisation algorithm is the solution to this dependency problem between the posterior and the joint log-likelihood. It was demostrated in the paper that we can alternative maximize the joint log-likelihood, update the posterior, maximise the joint log-likelihood, update the posterior, and so on, untill the evidence does not increase any more.

Other sources
--------------

* http://bjlkeng.github.io/posts/the-expectation-maximization-algorithm/