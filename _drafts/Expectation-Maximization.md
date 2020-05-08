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

The problem is that we don't know how how to solve this integral.

Expectation-Maximization
------------------------


Other sources
--------------

* http://bjlkeng.github.io/posts/the-expectation-maximization-algorithm/