---
layout: post
title: A digression on exponential growth
tags: mathematics, exponential-growth, Euler
---

## A digression on exponential growth

As an telecommunication enginner, I owe a lot to Leonhard Euler, the Swiss mathematician who introduced the number *e* (2.71828...). Euler's number is a fundamental constant in mathematics, and it is used in many areas of science. 

Imagine that you have a some initial capital $$c_o$$ and that you are given one year maximize it. You decide to put the money into the bank, who gives you a yearly interest rate of $$r$$. After one year, you will have


$$
c_1 = c_o \cdot (1+r).
$$


#### Growth with $n$ re-investments

Now imagine that, instead of waiting one year, the bank lets you compound the interest (that is, every time you get some interest, it's used as your new capital upon which the next interest is calculated) $$n$$ times that year. After one year, you will have

$$
c_{n} = c_o \cdot (1+\frac{r}{n})^{n}.
$$

The more often the interest is compounded, the more money you will have at the end of the year. And that is why banks prefer to give you your interests once every year, and not every month, or every day.

#### Growth with infinite re-investments

But, what would happen if we could re-invest our money every second, or every milisecond, is there a limit? Indeed, there is. Euler proved that, if your could compound the interest infinite times for any given period, your final capital would be multiplied by a factor $e^r$, where $r$ is the interest rate and $e=2.718281828459045...$. In other words:

$$
c_{\infty} = c_o \cdot e^r.
$$ 

Finally, if we repeat the exercise $t$ times where each time we grow $e^t$ we would get the famous particular case of exponential growth:

$$
c_{\infty}(t) = c_o \cdot (e^{r})^t.
$$

#### A deeper meaning: Euler number is the speed of life

There is something deeper here than just your money growing. The Euler number is to life what light is to the universe: a limit of how fast you can grow (or travel). Imagine rabbits reproducing as fast as they can. The bigger the population, the faster it will grow. Yet the ratio between one day and the day before will be given by Euler's number. 

<div style="text-align: center;">
    <img src="{{site.baseurl}}/assets/img/DALLE-rabbits-exponential.png" alt="Exponential growth illustration" />
</div>
