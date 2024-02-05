+++
title = 'An Interesting Proof of AM-GM Inequality'
date = 2021-12-09T01:12:58+06:00
type = 'post'
description = 'One day while playing around with inequalities, I came to a very interesting discovery. It was an interesting approach to the Inequality of Arithmetic and Geometric Mean. As far as I know this is a new proof. So here it is'
tags = ['mathematics']
+++

The [AM-GM inequality](https://en.wikipedia.org/wiki/Inequality_of_arithmetic_and_geometric_means) is one of the first things I learnt when I started paritcipating in math olympiads. It's a very elegant inequaltiy expressible in very simple terms, that the arithemetic mean of some positive numbers is greater or equal to their geometric mean. Mathematically

$$\frac{x_1+x_2+\cdots+x_n}{n} \geq (x_1 x_2 \cdots x_n)^{1/n}$$

With equality happening only when all $x_i$ are equal. Now, I find this inequality quite beautiful. But I never found its proofs beautiful. Don't get me wrong, the proofs can be quite insightful, in fact the cauchy induction one (see the wiki page) is ingenious. But personally, I just didn't find the beauty. And a few years back, while playing around with inequalities, I came across quite an interesting proof. So here goes my attempt of expressing that proof. Note that, I found the proof quite interesting and it's perfectly fine if you find it dull. But hopefully, you won't.

#### An Inductive Approach
Let's try [induction](https://en.wikipedia.org/wiki/Mathematical_induction) on the value of $n$, the number of variables. Let's consider the base case to be $n=2$ (the proof doesn't work with base $1$). So we need to prove

$$\frac{x_1+x_2}{2} \geq \sqrt{x_1 x_2}$$

A little manipulation should gives us that this statement is basically

$$\sqrt{x_1}^2 - 2\sqrt{x_1}\sqrt{x_2} + \sqrt{x_2}^2 =  (\sqrt{x_1} - \sqrt{x_2})^2 \geq 0$$

And since the $x_i$ are positive and square of real numbers are always positive, the base case is proved.

Now, we look at inductive step i.e. if we know the truth of AM-GM inequality for $n=m$ we have to prove it for $n=m+1$. But to do that, let's first focus on extending from $n=2$ to $n=3$. So (for now) our goal is to prove

$$\frac{x_1 + x_2 + x_3}{3} \geq (x_1 x_2 x_3)^{1/3}$$

How do we make this jump? How do we go from $2$ variables to $3$ variables? well let's take all collection of two variables

$$
\begin{align}
\frac{x_1+x_2}{2} &\geq (x_1 x_2)^{1/2} \\\\
\frac{x_2+x_3}{2} &\geq (x_2 x_3)^{1/2} \\\\
\frac{x_1+x_3}{2} &\geq (x_1 x_3)^{1/2} \\\\
\end{align}
$$

Add these up you have afte a bit of manipulation,

$$
\begin{align*}
\frac{2x_1 + 2x_2 +2x_3}{2}  &\geq (x_1x_2)^{1/2} + (x_2x_3)^{1/2} + (x_1x_3)^{1/2} \\\\
x_1+x_2+x_3 &\geq (x_1 x_2 x_3)^{1/2} \left(x_1^{-1/2} + x_2^{-1/2} + x_3^{-1/2}\right) \\\\
\end{align*}
$$

Now this is close(!), what we want is $x_1+x_2+x_3 \geq 3(x_1x_2x_3)^{1/3}$. But we got this $x_1+x_2+x_3 \geq (x_1 x_2 x_3)^{1/2} \left(x_1^{-1/2} + x_2^{-1/2} + x_3^{-1/2}\right)$ instead. What can we do? note the sum $x_1^{-1/2} + x_2^{-1/2} + x_3^{-1/2}$. What we just did with $x_1+x_2+x_3$, we can do it with the $x_1^{-1/2} + x_2^{-1/2} + x_3^{-1/2}$ too! i.e. we can do the following

$$
\begin{align*}
&x_1^{-1/2} + x_2^{-1/2} + x_3^{-1/2} \geq \\\\
&\qquad (x_1^{-1/2}x_2^{-1/2}x_3^{-1/2})^{1/2} \left( \left(x_1^{-1/2}\right)^{-1/2} + \left(x_2^{-1/2}\right)^{-1/2} + \left(x_3^{-1/2}\right)^{-1/2} \right) \\\\
&x_1^{-1/2} + x_2^{-1/2} + x_3^{-1/2} \geq (x_1x_2x_3)^{-1/4} \left( x_1^{1/4} + x_2^{1/4} + x_3^{1/4} \right) \\\\
\end{align*}
$$

And guess what another sum of the same format in right hand side. So we can do this process infinite times i.e.

$$
\begin{align*}
& x_1+x_2+x_3 \\\\
\geq & (x_1x_2x_3)^{1/2} \left(x_1^{-1/2} + x_2^{-1/2} + x_3^{-1/2}\right) \\\\
\geq & (x_1x_2x_3)^{1/2 - 1/4}\left(x_1^{1/4} + x_2^{1/4} + x_3^{1/4}\right) \\\\
\geq & (x_1x_2x_3)^{1/2 - 1/4 + 1/8}\left(x_1^{-1/8} + x_2^{-1/8} + x_3^{-1/8}\right) \\\\
\geq & \cdots \\\\
\geq & \lim_{k \to \infty} (x_1x_2x_3)^{-(-1/2+1/4-\cdots+1/(-2)^k)} \left(x_1^{1/(-2)^k} + x_2^{1/(-2)^k} + x_3^{1/(-2)^k}\right) \\\\
\end{align*}
$$

if you know a little bit of pre-calculus then you should know that $\frac{1}{-2} + \frac{1}{4} + \frac{1}{-8} + \cdots = \frac{-1/2}{1-(-1/2)} = \frac{1}{3}$ and $x_i^{1/(-2)^k} \to 1$ as $k \to 0$. So the limit is really $3(x_1x_2x_3)^{1/3}$. So we are done!

Now here's the magic, this process that we just did works to extend the statement from any $n=m$ to $n=m+1$. The details require a bit formalism. But the process if completely same. And this is the proof. Now if you don't trust me, the following section has the formal details.

#### Details of The Inductive Step

Suppose we know that AM-GM inequality is true for $n=m$ variables. Now for $n=m+1$ variables $x_1, \cdots, x_{m+1}$ we pick each subset of $m$ variables and apply the hypothesis on it to get following inequality (where $x_k$ is not in the set)

$$
\frac{\sum \limits_{i=1 , i \neq k }^{m+1} x_i}{m} \geq \left(\prod_{i=1, i \neq k }^{m+1} x_i\right)^{1/m}
$$

If we define $S = \sum \limits_{i=1}^{m+1} x_i$ and $P = \prod \limits_{i=1}^{m+1} x_i$ then the above inequality is just

$$
\frac {S - x_k}{m} \geq \left(\frac{P}{x_k}\right)^{1/m}
$$

Adding up this inequality for $k = 1, \cdots, m+1$ we get

$$
\frac{(m+1)S-S}{m} = S \geq P^{1/m}\left(\sum_{i=1}^{m+1} x_i^{-1/m}\right)
$$

And applying the same procedure on $\sum \limits_{i=1}^{m+1} x_i^{-1/m}$ gives us as above,

$$
\begin{align*}
&S \\\\ 
\geq & P^{1/m}\left(\sum_{i=1}^{m+1} x_i^{-1/m}\right) \\\\ 
\geq & P^{1/m - 1/m^2}\left(\sum_{i=1}^{m+1} x_i^{1/m^2}\right) \\\\
\geq & \cdots \\\\
\geq & \lim_{k \to \infty} P^{-(-1/m+1/m^2-\cdots+1/(-m)^k)} \left(\sum_{i=1}^{m+1} x_i^{1/(-m)^k}\right) \\\\
\end{align*}
$$

And as expected $\frac{1}{-m} + \frac{1}{m^2} + \frac{1}{-m^3} + \cdots = \frac{-1/m}{1-(-1/m)} = \frac{1}{m+1}$ and $x_i^{1/(-m)^k} \to 1$ as $k \to \infty$. So,

$$
S \geq (m+1) P^{1/(m+1)}
$$

And we are done, finally.

#### A Challange and Some Hand Waving

Note that during the proof, I avoided a particular part of the statement. The inequality becomes equality when all variables are equal. The proof does show this, but I am leaving this as an exercise for the reader (hehe).

Another thing to note is that, the proof goes into pre-calculus i.e. analysis a bit. And we had to work with a limit of sequences. You can't really hand wave these like I did. For example, elements of a sequence can be smaller than $2$, but its limit can fail to be smaller than $2$ (can you come up with such a sequence?). Anyways, I have checked the details and the hand wavings work in this proof. But try to do it yourself too.

#### Conclusion

Hopefully, you found the proof interesting. An important aspect of the proof is that it highlights that AM-GM inequality does indeed need ideas of analysis, even though it feels to be quite simple. 

----
*I try to share things that I have learnt recently, and in the process, I can obviously make mistakes, so if you think you found something wrong feel free to [create a issue in the github repository for this blog](https://github.com/upobir/upobir.github.io/issues/new).*
