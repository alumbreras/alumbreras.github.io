---
layout: post
title: The reparametrization trick
tags: machine learning
---
	
The reparametrization trick was proposed in 2014 in the context of [Variational Auto Encoders](https://arxiv.org/abs/1312.6114). It has
since revolutionized the field because it opens the door to the use of Deep Neural Networks to optimize variational functions.

Image we want to optimize a function w.r.t $$\phi$$, and for that we need its gradient

$$
\nabla_\phi \mathbb{E}_{q(x; \phi)}[f(x; \theta)]
=
\nabla_\phi \int q(x; \phi)f(x; \theta) dx
$$

If we do not how to compute the integral, we cannot compute the gradient.

### Score functions

The gradient of a log-likelihood is called score function

$$
\nabla_\theta \log f(x;\theta) = \frac{\nabla_\theta f(x;\theta)}{f(x;\theta)} 
$$

and from here we have that 

$$
\nabla_\theta f(x;\theta)  = f(x;\theta) \nabla_\theta \log f(x;\theta)  
$$

and therefore we have use this in the original  expression 
after pushing the gradient inside the integral

$$
\nabla_\phi \mathbb{E}_{q(x; \phi)}[f(x; \theta)]
=
\nabla_\phi \int q(x; \phi)f(x; \theta) dx
=
\int \nabla_\phi  q(x; \phi)f(x; \theta) dx
=
\int \nabla_\phi  q(x; \phi)f(x; \theta) dx
$$


## Variational Lower Bound
Imagine we have want to compute this gradient that appears in Variational Inference when we want to minimize the KL distance between a posterior 
and its approximation.

$$
\text{KL}(q(z) || p(z | x)) = \int q(z) \log \frac{q(z)}{p(z|x)} 
=
\int q(z) \log q(z) - \int q(z) \log p(z|x)
$$

But this is useless. The problem is that there is 
$$
\log p(z|x)
$$ 
in the equation, which is the ugly term we want to approximate!
Fortunately, we can use Bayes equation to replace the ugly term (the true posterior) but other nicer terms. 
By Bayes, we know that $$p(z|x) = p(x, z)/p(x)$$. Using this we can express the KL divergence as

$$
\text{KL}(q(z) || p(z | x)) =
=
\int q(z) \log q(z) - \int q(z) \log p(x, z) + \log p(x) 
$$

which is the famous Lower Bound and the evidence. The task then is to maximize the Lower Bound.
If we do not make any mean-field assumptions, we need to find the parameters of $$q$$ that
maximize the lower bound, so the first step is to take the gradient of the lower bound.

$$
\nabla_\theta \int q(z) \log q(z) - \nabla_\theta \int q(z) \log p(x, z)
$$
