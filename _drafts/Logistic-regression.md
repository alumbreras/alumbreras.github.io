---
title: "Logistic Regression"
layout: post
tags: machine learning
---

Introduction
------------

Logistic regression is a very popular method used as the base for binary
classification tasks. In this post, I we will build the logistic
regression framework (problem, cost function and optimization) from
scratch and we will implement a logistic classifier with R. We will also
discuss about its Bayesian extension.

### Logistic regression

Imagime we have a dataset of labeled data where each datapoint belongs
to one out of two possible categories. We want some function *f(x)* such
that the output is a probability. We can use the logistic function:

$$
f(x) = \\frac{1}{1+ e^{-x}}
$$

The function looks like

    library(ggplot2)

    x <- seq(-10, 10, by=0.1)
    p_y <- 1/(1+ exp(-x))
    ggplot(data.frame(x=x, p_y=p_y), aes(x=x, y=p_y)) + geom_line() + theme_bw()

![](2018-09-13-Logistic-regression_files/figure-markdown_strict/unnamed-chunk-1-1.png)

We can use the logistic function as a likelihood function. Thus, our
goal is to find the parameters that maximize the likelihood (MLE):
*a**r**g**m**a**w*<sub>*w*</sub>  log*p*(**y**|**x**; *w*)= − ∑<sub>*n*</sub>*y*<sub>*n*</sub>log(1 + exp{−*w**x*<sub>*n*</sub>}) + (1 − *y*<sub>*n*</sub>)log(exp{−*w**x*<sub>*n*</sub>})
 or also

*a**r**g**m**a**w*<sub>*w*</sub>  log*p*(**y**|**x**; *w*)= − ∑<sub>*n*</sub>log(1 + exp{−*y*<sub>*n*</sub>*w**x*<sub>*n*</sub>})

The derivative with respect to *w* is:
$$
\\frac{\\delta}{\\delta w}\\log p(\\mathbf{y} | \\mathbf{x} ; w) 
= -\\sum\_n \\frac{-y\_nx\_n\\exp\\{-y\_n wx\_n\\}}{\\log(1+ \\exp\\{-y\_n wx\_n\\})}
$$

From here, we can just apply Gradient Descent to find a local maximum.
