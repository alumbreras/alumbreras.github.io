---
layout: ai-note
title: Variational Inference
category: "Stats and Machine Learning"
date: 2024-10-31
tags: bayesian, inference, variational-methods
---

Variational Inference is a technique for approximating posterior distributions in Bayesian inference when exact inference is intractable due to complex integrals (e.g. when conjugate priors are not available). It transforms the inference problem into an optimization problem by introducing a family of simpler distributions and finding the one that is closest to the true posterior.

## From KL distance to ELBO

$$
\begin{align}
KL(q||p) =&
\int q(\mathbf{Z}) \ln \frac{q(\mathbf{Z})}{p(\mathbf{Z} | \mathbf{X})}\\
=&\int q(\mathbf{Z}) \ln q(\mathbf{Z}) - \int q(\mathbf{Z}) \ln p(\mathbf{X, Z}) + \int q(\mathbf{Z}) \ln p(\mathbf{X})
\\
=&\underbrace{\int q(\mathbf{Z}) \ln q(\mathbf{Z})}_\text{entropy} - \int q(\mathbf{Z}) \ln p(\mathbf{X, Z}) + \underbrace{\ln p(\mathbf{X})}_\text{evidence}
\end{align}
$$

We need to find the distribution $q(\mathbf{Z})$ that minimizes the KL distance:

$$
\begin{align}
\arg\min_q \int q(\mathbf{Z}) \ln q(\mathbf{Z}) - \int q(\mathbf{Z}) \ln p(\mathbf{X, Z})
\end{align}
$$

which will be more practical to express as

$$
\begin{align}
\arg\max_q  \int q(\mathbf{Z}) \ln p(\mathbf{X, Z}) - \int q(\mathbf{Z}) \ln q(\mathbf{Z})
\end{align}
$$

Since KL distance is equal or greater than zero, we know that:

$$
\begin{align}
\ln p (\mathbf{X}) \geq  \underbrace{\int q(\mathbf{Z}) \ln p(\mathbf{X, Z}) - \int q(\mathbf{Z}) \ln q(\mathbf{Z})}_\text{ELBO}
\end{align}
$$

and this is why the term at the right side of the equation is known as the Evidence Lower Bound (ELBO) and is sometimes denoted as $\mathcal{L}(q)$. Minimizing the KL distance is therefore equivalent to maximizing the ELBO. As a side effect, note that if we find the $q(\mathbf{Z})$ that maximizes the ELBO we will be able to compute the evidence $p(\mathbf{X})$ under our model.

## Maximizing the ELBO

The only assumption we will make about $q(\mathbf{Z})$ is that it can be factorized with respect to some subsets of variables (in such a way that we will only have to deal with conjugates later):

$$
\begin{align}
q(\mathbf{Z}) = \prod_{i=1}^{M}q_i(\mathbf{Z}_i)
\end{align}
$$

This factorized form of Variational Inference comes from physics and is called Mean Field Theory. With such factorization, we can write the ELBO as

$$
\begin{align}
\mathcal{L}(q) =&	\int \prod_{i=1}^{M}q_i(\mathbf{Z}_i) \ln p(\mathbf{X, Z})d\mathbf{Z} - \int \prod_{i=1}^{M}q_i (\mathbf{Z}_i) \sum_{k=1}^{M}\ln q_k(\mathbf{Z}_k) d\mathbf{Z}\\
=&\int q_j(\mathbf{Z}_j) \left(\underbrace{\int\prod_{i\neq j}^{M}q_i(\mathbf{Z}_i) \ln p(\mathbf{X, Z})d\mathbf{Z}_i}_\text{$E_{i\neq j}[\ln p(\mathbf{X,Z})]$}\right)d\mathbf{Z}_j
-
\sum_{i=1}^{M} \int q_i (\mathbf{Z}_i) \ln q_i(\mathbf{Z}_i) d\mathbf{Z}_i
\end{align}
$$

When maximizing with respect to $q_j(\mathbf{Z}_j)$, the summands that do not depend on $q_j(\mathbf{Z}_j)$ are treated as constants:

$$
\begin{align}
\int q_j(\mathbf{Z_j}) E_{i\neq j}[\ln p(\mathbf{X,Z})] d\mathbf{Z}_j
-
\int q_j (\mathbf{Z}_j) \ln q_j(\mathbf{Z}_j) d\mathbf{Z}_j
+ \text{const}
\end{align}
$$

To maximize this equation note that this is equivalent to

$$
\begin{align}
\int q_j(\mathbf{Z}_j) \ln \frac{e^{E_{j\neq i}[\ln p(\mathbf{X,Z})]}}{q_j(\mathbf{Z}_j)} + \text{const}
\end{align}
$$

which as the negative of a KL distance. Thus, the maximum ELBO is reached at

$$
\begin{align}
\ln q_j(\mathbf{Z}_j) = E_{j\neq i}[\ln p(\mathbf{X,Z})]
\end{align}
$$
