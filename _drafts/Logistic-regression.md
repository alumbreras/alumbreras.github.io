---
title: Logistic regression
layout: post
date: 11-09-2018
output: md_document
tags: machine learning
---

## Introduction

Logistic regression is a very popular method used as the base for binary classification tasks.
In this post, I we will build the logistic regression framework (problem, cost function and optimization) from scratch and we will implement a logistic classifier with R. We will also discuss about its Bayesian extension.

## Logistic regression

Imagine we have a dataset of labeled data where each data point belongs to one out of two possible categories.  First, we need some function *f(x)* such that the output is a probability. We can use the logistic function:

$$
\sigma(x) = \frac{1}{1+ e^{-x}}
$$

The function looks like
```R
library(ggplot2)
x <- seq(-10, 10, by=0.1)
y <- 1/(1+ exp(-x))
ggplot(data.frame(x=x, y=y), aes(x=x, y=y)) + geom_line() + theme_bw()
```

We can use this function as the probability that observation $x_n$ belongs to the positive class, denoted as $y_n$:

$$
y_n = \sigma_w(\mathbf{w}^T\mathbf{x}_n) = \frac{1}{1+ e^{-\mathbf{w}^T\mathbf{x}_n}}
$$

Let us denote as *t_n* the class (0 or 1) of the data points *x_n*. The likelihood is given by the product of Bernoulli likelihoods:

$$
p(\mathbf{t} | \mathbf{x}, w) = \prod_n y_n^{t_n} (1-y_n)^{1-t_n} 
$$

We want to maximize this likelihood (MLE estimation) with respect to the parameter *w*. Working with the loglikehood we have

$$
\log p(\mathbf{t} | \mathbf{x}, w) = \sum_n t_n \log(y_n) + (1-t_n)\log(1-y_n) 
$$

The derivative is

$$
\nabla_w \log p(\mathbf{t} | \mathbf{x}, w) =  
\sum_n t_n \frac{\nabla_w y_n}{y_n} - (1-t_n)\frac{\nabla_w y_n}{1-y_n} 
=
\sum_n \frac{t_n(1-y_n)\nabla_w y_n - (1-t_n)y_n\nabla_w y_n}{y_n(1-y_n)}\\
=
\sum_n \frac{(t_n - y_n)\nabla_w y_n}{y_n(1-y_n)}
$$

Finally noting that 

$$
\nabla_x \sigma (x) = \sigma(x)(1-\sigma(x))\\
\nabla y_n = \nabla_w \sigma (-\mathbf{w}^T\mathbf{x}) =
-\sigma(-\mathbf{\mathbf{w}^Tx})(1-\sigma_w(-\mathbf{w}^T\mathbf{x}))\mathbf{x}
=-y_n(1-y_n)\mathbf{x}
$$

where in the second line we used the chain rule, we have

$$
\nabla_w \log p(\mathbf{t} | \mathbf{x}, w)
=
-\sum_n (t_n - y_n)\mathbf{x}
$$

## Gradient Ascent
The above equation has not a close form solution due to the non-linearity of the sigmoid function. However, we can just apply Gradient Ascent to find the maximum:
$$
w_{t+1} = w_{t} - \eta \sum_n  (y_n - t_n) \mathbf{x}_n
$$

We can now write the corresponding R function:

```{r}
#'@title Logistic Regression with Gradient Descent 
logistic_regression_sgd <- function(labels, X, w_0, eta=0.1, maxiters=1000){
  df.results <- data.frame()
  w <- w_0
  
  for(i in 1:maxiters){
    y  <- 1/(1 + exp(-t(w) %*% X))
    errors <- c(y - labels)
    w <- w - eta * rowSums(X %*% diag(errors))
    
    likelihood <- sum(labels*log(y) + (1-labels)*log(1-y))
    df.results <- rbind(df.results, list(error = sum(errors), 
                                         w_norm = norm(as.matrix(w)),
                                         likelihood = likelihood))
  }
  
  list(w = w,
       results = df.results)
}
```


## Overfitting of MLE estimator

Imagine that we have a perfectly separable dataset:

```R
# true w. Play with the norm of the vector to see that, an infinite norm
# creates to perfectly separable classes
w <- c(-2.5,1) * 100 

x <- c(rnorm(50, 0,1), rnorm(50, 5, 1))
X <- rbind(rep(1, length(x)), t(as.matrix(x))) # add intercept
y  <- 1/(1 + exp(-t(w) %*% X))
t <- ifelse(runif(length(y)) < y ,1 ,0)
df.data <- data.frame(x=x, t=as.factor(t))

xx <- seq(-5, 10, by=0.1)
XX <- rbind(rep(1, length(xx)), t(as.matrix(xx))) # add intercept
yy <- as.numeric(1/(1 + exp(-t(w) %*% XX)))
df.sigma <- data.frame(x=xx, y=yy)
  
g <- ggplot(df.sigma, aes(x=x, y=y)) + 
  geom_line() +
  geom_point(data = df.data, aes(x = x, y = 0.5, color = t)) + 
  theme_bw()
print(g)
```

Let's apply our MLE estimator

```R
library(gridExtra)
labels <- t
X <- rbind(rep(1, length(x)), t(as.matrix(x))) # add intercept

w_0 <- c(0,1)
eta <- 0.01
w_0 <- c(0,1)

res <- logistic_regression_sgd(labels, X, w_0 = w_0, eta = 0.01, maxiters = 1000)
df.results <- res$results

##############################
# Plot first and last sigmoids
##############################
df.data <- data.frame(x=x, label=as.factor(t))
xx <- seq(-10, 10, by=0.1)
XX <- rbind(rep(1, length(xx)), t(as.matrix(xx))) # add intercept

# Prepare initial plot
yy <- as.numeric(1/(1 + exp(-t(w_0) %*% XX)))
df.fit <- data.frame(x=xx, y=yy)
p_init <- ggplot(df.fit, aes(x=x, y=y)) + 
  geom_line() +
  geom_point(data = df.data, aes(x = x, y = 0.5, color = label)) + 
  ggtitle("first iteration") + 
  theme_bw() +  theme(legend.position = "none")

# Prepare final plot
yy <- as.numeric(1/(1 + exp(-t(res$w) %*% XX)))
df.fit <- data.frame(x=xx, y=yy)
p_end <- ggplot(df.fit, aes(x=x, y=y)) + 
  geom_line() +
  geom_point(data = df.data, aes(x = x, y = 0.5, color = label)) + 
  ggtitle("last iteration") + 
  theme_bw() +  theme(legend.position = "none")

# Plot both
grid.arrange(p_init, p_end, nrow = 2, ncol=1)
```

After 1000 iterations, it can perfectly separate the two classes. 
Points with *y > 0.5* belong to class 1, and the others to class 0. 

However, the norm of the **w** vector keeps growing towards infinity. In this limit, the sigmoid becomes the heavyside function.

```R
# Plot norm of parameters versus error
df.results$iteration <- 1:nrow(df.results)
p1 <- ggplot(df.results, aes(x = iteration,  y = w_norm)) + geom_line() + theme_bw()
p2 <- ggplot(df.results, aes(x = iteration,  y = likelihood)) + geom_line() + theme_bw()
grid.arrange(p1, p2, nrow = 2, ncol=1)
```
*Relation between likelihood and norm of parameters*

The above behavior is a case of overfitting. Since there is no penalization for overlearning the training data and the model is flexible enough, the cost function is minimized when model is totally dogmatic. It gives zero probability to a 0-class point bigger than 2.5 (in our example) because it has never seen it in the training set.

### Adding a prior to avoid overfitting

To avoid the offerfitting of the MLE estimator, we can add a prior over **w** and find a MAP solution or, equivalently, we can add a regularzation term.

$$
\log p(\mathbf{t} | \mathbf{x}, w) = \sum_n t_n \log(y_n) + (1-t_n)\log(1-y_n) + \log p(\mathbf{w}) 
$$
An isotropic zero-mean Gaussian prior with variance $\lambda$ would be
$$
\log p(\mathbf{t} | \mathbf{x}, w) = \sum_n \{t_n \log(y_n) + (1-t_n)\log(1-y_n)\} 
- \frac{\lambda}{2} ||\mathbf{w}||^2_2
$$

Then the gradient becomes:

$$
\nabla_w \log p(\mathbf{t} | \mathbf{x}, \mathbf{w})
=
\sum_n -(t_n - y_n)\mathbf{x}_n - \lambda \mathbf{w} 
$$

And the Gradient Ascent becomes
$$
\mathbf{w}_{t+1} = \mathbf{w}_{t} - \eta [\sum_n  (y_n - t_n) \mathbf{x}_n + \lambda\mathbf{w}_{t}]
$$

```R
logistic_regression_sgd_ridge <- function(labels, X, w_0, eta=0.1, lambda = 1, maxiters=1000){
  df.results <- data.frame()
  w <- w_0
  
  for(i in 1:maxiters){
    y  <- 1/(1 + exp(-t(w) %*% X))
    errors <- c(y - labels)
    w <- w - eta * (rowSums(X %*% diag(errors)) + lambda*w)
    
    likelihood <- sum(labels*log(y) + (1-labels)*log(1-y)) - lambda/2 * t(w)%*%w
    df.results <- rbind(df.results, list(error = sum(errors), 
                                         w_norm = norm(as.matrix(w)),
                                         likelihood = likelihood))
  }
  
  list(w = w,
       results = df.results)
}

labels <- t
X <- rbind(rep(1, length(x)), t(as.matrix(x))) # add intercept

w_0 <- c(0,1)
eta <- 0.01
w_0 <- c(0,1)

res <- logistic_regression_sgd_ridge(labels, X, w_0 = w_0, eta = 0.01, lambda=0.9, maxiters = 1000)
df.results <- res$results

##############################
# Plot first and last sigmoids
##############################
df.data <- data.frame(x=x, label=as.factor(t))
xx <- seq(-10, 10, by=0.1)
XX <- rbind(rep(1, length(xx)), t(as.matrix(xx))) # add intercept

# Prepare initial plot
yy <- as.numeric(1/(1 + exp(-t(w_0) %*% XX)))
df.fit <- data.frame(x=xx, y=yy)
p_init <- ggplot(df.fit, aes(x=x, y=y)) + 
  geom_line() +
  geom_point(data = df.data, aes(x = x, y = 0.5, color = label)) + 
  ggtitle("first iteration") + 
  theme_bw() +  theme(legend.position = "none")


# Prepare final plot
yy <- as.numeric(1/(1 + exp(-t(res$w) %*% XX)))
df.fit <- data.frame(x=xx, y=yy)
p_end <- ggplot(df.fit, aes(x=x, y=y)) + 
  geom_line() +
  geom_point(data = df.data, aes(x = x, y = 0.5, color = label)) + 
  ggtitle("last iteration") + 
  theme_bw() +  theme(legend.position = "none")


df.results$iteration <- 1:nrow(df.results)

p1 <- ggplot(df.results, aes(x = iteration,  y = w_norm)) + geom_line() + theme_bw()
p2 <- ggplot(df.results, aes(x = iteration,  y = likelihood)) + geom_line() + theme_bw()

# Plot all
grid.arrange(p_init, p_end, p1, p2, nrow = 4, ncol=1)
```


## Iterative Reweighted Least Squares

The Newton-Raphson method, proposed simultaneously by Isaac Newton and Joseph Raphson around 1670, finds the zero of a function following its tangent function (see image below). If we want to find the zero of a function *f(x)*, we can iterate through:
$$
x_{t+1} = x_t - \frac{f(x_t)}{f'(x_t)} 
$$

![](../assets/NewtonIteration_Ani.gif)

In our case, we can to find the zero of the gradient function. Thus, the Newton-Raphson method updates are

$$
\mathbf{w}^{t+1} = \mathbf{w}^t + \mathbf{H}^{-1}\nabla_w \log p(\mathbf{t} | \mathbf{x}, \mathbf{w})
$$

where **H** is the Hessian matrix:

$$
\nabla_w \log p(\mathbf{t} | \mathbf{x}, \mathbf{w})
=
\sum_n -(t_n - y_n)\mathbf{x}_n - \lambda \mathbf{w} 
\\
\mathbf{H} = \nabla \nabla \log p(\mathbf{t} | \mathbf{x}, \mathbf{w}) 
= 
\sum_n -y_n(1-y_n)\mathbf{x}_n\mathbf{x}_n^T - \lambda \mathbf{I} 
$$

It will be useful to work with all the data matrix **X** instead of single instances. Let is define a *N x N* diagonal matrix:

$$
R_{nn} = y_n(1-y_n)
$$

Then we can express our gradients as

$$
\nabla_w \log p(\mathbf{t} | \mathbf{x}, \mathbf{w})
=
-(\mathbf{X}^T(\mathbf{y} - \mathbf{t}) + \lambda \mathbf{w})
\\
\mathbf{H}
=
-(\mathbf{X}^T\mathbf{R}\mathbf{X} + \lambda \mathbf{I})
$$

We can now compute the Newton-Raphson method updates:

$$
\mathbf{w}_{t+1} = \mathbf{w}_t - (\mathbf{X}^T\mathbf{R}\mathbf{X} - \lambda \mathbf{I})^{-1}(\mathbf{X}^T(\mathbf{y} - \mathbf{t})- \lambda \mathbf{w}_t )
$$

That would be enough to code an algorithm. But we can work a little bit more to show the similarity with the Ordinary Least Squares equations (OLS) used in linear regression.
Let us forget about the regularization, setting $\lambda = 0$

$$
\mathbf{w}^{t+1} = 
(\mathbf{X}^T\mathbf{R}\mathbf{X})^{-1}
\mathbf{X}^T\mathbf{R}~~(\mathbf{X}\mathbf{w}_t - \mathbf{R}^{-1}(\mathbf{y}-\mathbf{t}))\\
$$

The OLS equations to solve a linear regression problem are

$$
\mathbf{w} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y}
$$

and from here we can see the similarity with out updates. It is a OLS with a weighting matrix **R**. For this reason, this method is called Iterative Reweighted Least Squares.



## Final Remarks
We have introduced the Logistic Regression model and we have talked about how MLE estimators can overfit if we do not apply some regularization term. We have played with two optimizators, a Gradient Descent and a IRLS. The IRLS tends to work better than the GD because the function is almost quadratic. 

In the context of big data, however, the inversion of the Hessian can be too slow to compute. Gradient Descent (or Ascent), on the contrary, can be extended easily extended to Stochastic Gradient Descent, where only one sample is processed at each iteration.

There are other popular optimizators, such as L-BFGS, that can be used with large scale data. [This paper](https://tminka.github.io/papers/logreg/minka-logreg.pdf) is a survey on the possible optimizers for Logistic Regression.

### References

Here are a couple of references that I check to write this post:

* [A comparison of numerical optimizers for logistic regression](https://tminka.github.io/papers/logreg/minka-logreg.pdf)

* [Logistic Regression + SGD](https://courses.cs.washington.edu/courses/cse547/16sp/slides/logistic-SGD.pdf)
