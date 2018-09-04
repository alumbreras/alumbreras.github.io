---
layout: post
title: Biased and unbiased estimatorssss
tags: machine learning
---

Imagine we have a deterministic function $$f(x)$$ where $$x$$ is a random variable with probability $$p(x)$$.
We are often interested in the expectation of $$f(x)$$. The definition of this expectation is:

$$
\mathbb{E}[f(x)] = \int f(x)p(x) \text{d}x
$$

The expectation is no more than the weighted integral of the function, where the weights are given by the probability of each point $$x$$.
Imagine that we cannot solve this integral, or that we do not know $$p(x)$$, but we have some samples $$x^{(j)} \sim p(x)$$. 

**Unbiased estimator**

We can propose an estimator based of the samples of $$x$$:

$$
\mathbb{E}[f(x)] \approx \frac{1}{J}\sum_j f(x^{(j)})
$$

We say that the estimator is unbiased if its expectation correspond to the parameter it wants to estimate. This can be easily checked:

$$
\mathbb{E}[\frac{1}{J}\sum_j f(x^{(j)})] = 
\frac{1}{J}\sum_j \mathbb{E} [f(x^{(j)})] = 
\frac{1}{J}J \mathbb{E} [f(x)] =
\mathbb{E} [f(x)] 
$$

**Biased estimators**

Imagine now that we want to estimate the log of the expectation $$f(x)$$ and that we approximate this as

$$
\log \mathbb{E}[f(x)] \approx \log \big(\frac{1}{J}\sum_j f(x^{(j)})\big)
$$

And now let's see whether it is biased or unbiased (we will use [Jensen](https://en.wikipedia.org/wiki/Johan_Jensen_(mathematician))'s [inequality](http://mark.reid.name/blog/behold-jensens-inequality.html)):

$$
\mathbb{E}\big[ \log \big(\frac{1}{J}\sum_j f(x^{(j)})\big)\big] 
\leq
\log \mathbb{E}\big[\frac{1}{J}\sum_j f(x^{(j)})\big] 
=
\log \mathbb{E}[f(x)]
$$

Aha! This estimator is biased and, more specifically, it underestimates the true value.	
