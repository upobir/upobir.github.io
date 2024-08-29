+++
title = 'Exchange Argument in Sequences (Part 1)'
date = 2024-06-15T19:39:53+06:00
type = 'post'
description = 'I had the idea for this article about four months ago. Sadly never really got the time to write it. Not sure if I can make the original version that I had planned. The content is for a common trick used in various greedy competitve programming problems. I have plans for a part 2, in fact the part 2 will have the actual content I had planned originally, so this will be more of an introduction.'
tags = ['competitive programming', 'greedy']

draft = true
+++

Greedy problems are a common category of problems in various competitive programming problem sets. In the simplest terms, these problems ask you to _optimize_ a value in some scenario, and turns out by using some small _greedy_ decisions, we can optimize the target value. This is of course not always the case, but in many cases it is. I find greedy solutions to problems to be fun, but not the solving part, rather the proving part (Yes, you should prove why your solution works, at least when practising). Exchange argument is a general technique of proving greedy algorithms, where we prove that the output provided by the algorithm can be _exchanged_ one step at a time to an optimal output without changing the target value. A bit hard to understand with just words, you'll see examples soon.

What this article is about is application of exchange arguments in the context of sequences. More precisely, I'll be talking about problems where you are given a list of items and you can shuffle the items however you want. You are given a scoring function of the shuffled list, you need to find the shuffle or order of items where the score is optimized (i.e. minimized or maximized, whatever the problem wants). There will be some examples where the problem won't be exactly like this, but you'll see how we handle them.

An warning, this article will get a bit formal, since we are talking about proving facts. So put on your mathematician hats and let's go.

### Formal Definitions First
First, let's define the kind of problems we are handling. Suppose you are given a sequence $S$ of objects and a scoring function $f$ which provides a score on any permutation of the sequence $S$. Your task is to find the permutation $S^\prime$ such that $f(S^\prime)$ is either maximum (or minimum). The actual target is generally irrelevant, formally speaking. So I'll say that the goal is to _optimize_ the score instead of maximizing or minimizing.

Here's an example of the problem, the sequence $S$ is $[40, 10, 30, 20]$ and the scoring function is $f(S) = S_1 \times 1 + S_2 \times 2 + S_3 \times 3 + S_4 \times 4$. You need to find the permutation producing maximum result. With a bit of playing around you'll find the answer is $[10, 20, 30, 40]$.

Now, the set of all the problems following this pattern is huge, let's call these _permutation optimizing problems_. Luckily there's a trick to solve them for some specific cases. The trick is called exchange argument and that is also a vast trick. I will be focusing on a narrowser scope. The following is the exchange argument specific for permutation optimizing problems:

In a maximizing problem, suppose you can find a relational operator $\preceq$ such that if $a \preceq b$ and $S_1, S_2$ both sequence have $a, b$ adjancent with $S_1$ having $a$ first and $S_2$ having $b$ first, then $f(S_1) \geq f(S_2)$. Then the sequence $S^\prime$ found by sorting the original sequence using $\preceq$ will be the one with maximum score. Similarly for minimizing problem $f(S_1) \leq f(S_2)$ will imply $f(S^\prime)$ will attain minimum score.

The fact above seems to make sense, if you think about it. What the requirement of $\preceq$ is basically that swapping according to this operator will make the score better or same. So from any permutation of the original sequence, you can perform swaps according to $\preceq$ to reach $S^\prime$ and while making the swaps, you will never make the score worse. So $S^\prime$ will definitely be the best. Note the statement does not say it will be the only best sequence, but it will be one of the best sequences. In fact when $a \preceq b$ and $b \preceq a$, there's no requirement of one coming before another, so the sort itself can provide multiple optimal answers.

Now, the way to find this $\preceq$ is not really fixed. But there are general approaches. Let's see some examples.

### Example 1: Score Is Sum Over Position Times Elements
Let's try the example from previous section. The scoring function is $f(S) = \sum \limits_{i=1}^{len(S)} i \times S_i$, the goal is to maximize this result. How can we find the mysterious $\preceq$? The idea is to go in reverse. Suppose two elements are $a, b$. We need to figure out if $a \preceq b$ or $b \preceq a$. Let's focus in one case, suppose $S_1$ has $a, b$ at positions $i, i+1$, while $S_2$ has $a, b$ at positions $i+1, i$ (and all other elements are same). Now if we compare $f(S_1)$ and $f(S_2)$, you will notice that most of the sums are same except for position $i$ and $i+1$. In fact if you cancel out the common terms, then those two scores have $ai + b(i+1)$ and $bi + a(i+1)$ left. If it is the case that $a \preceq b$, then $f(S_1) \geq f(S_2) \implies ai + b(i+1) \geq bi + a(i+1) \implies b \geq a$. Soooo, $a \preceq b \implies a \leq b$. 

You might be celebrating that we have found our illusive $\preceq$. But this is a one way implication, this detail will be important in a later example. For now, we can say that we define $a \preceq b$ as $a \leq b$, because after all, $\preceq$ is a operator we need to find. So if you sort a sequence using $\preceq$, better known as $\leq$, we find an optimal sequence. In fact, for the example in previous section, we had to sort $[40, 10, 30, 20]$ by $\leq$ to find $[10, 20, 30, 40]$, the answer.

By the way, this toy problem is inspried from [rearrangement inequality](https://en.wikipedia.org/wiki/Rearrangement_inequality).

### Example 2: Score Is Sum Of Deadline Penalty
The next example is a part of CSES problem [Tasks and Deadlines](https://cses.fi/problemset/task/1630). This time, we are working with sequence of _tasks_. Each task is described by two values $t_i$ and $d_i$. $t_i$ is the time duration taken to finish the task (irrespective of when you start it), $d_i$ is the deadline of that particular task. When we choose a permutation of the tasks, you do the tasks starting from time $0$, one by one, suppose we finish the $i$th task (original index) at $T_i$, then the penalty of that task is $T_i - d_i$. The score of the permutation is sum of all the penatlties. Our goal is to minimize this score. 

Ok, let's try the way of last example. Suppose we have two tasks $(t, d)$ and $(t^\prime, d^\prime)$. In sequence $S_1$, they are at position $i, i+1$ and in sequence $S_2$, they are at position $i+1, i$ (and all other elements are same). Then $(t, d) \preceq (t^\prime, d^\prime)$ would mean $f(S_1) \leq f(S_2)$. And that means $T_1 - d + T_1^\prime - d^\prime \leq T_2^\prime - d^\prime + T_2 - d$. Here, $T_1, T_1^\prime$ are the end times of the tasks in $S_1$ and similarly $T_2, T_2^\prime$ are the end times of the tasks in $S_2$. Now since $S_1, S_2$ are same before position $i$, we can actually say $T_1 = C + t, T_1^\prime = C + t + t^\prime$ and $T_2^\prime = C + t^\prime, T_2 = C + t^\prime + t$. Here $C$ is the sum of all the time durations of tasks before $i$th position. So $f(S_1) \leq f(S_2)$ means 

$$C + t - d + C + t + t^\prime - d^\prime \leq C + t^\prime - d^\prime + C + t^\prime + t - d$$

Don't be afraid of the big equation. Most things cancel out and you get $t \leq t^\prime$. Sooo, $(t, d) \preceq (t^\prime, d^\prime)$ implies $(t \leq t^\prime)$. Again, this is a one way implication, but our goal is to define the $\preceq$. So we can define it as simply normal order between $t$. So sort by $t$, and you'll get the optimal sequence.

So far easy examples, let's make it more difficult.

### Example 3: Score Is Number of Inversions Between 0s And 1s
As far as I know, I haven't seen this problem anywhere. I had made a competitive program problem based on this at [Inversions and Goodbye](https://toph.co/p/inversions-and-goodbye). Anyways, this time, you are given a sequence of binary strings. You can permute them and the score of this permutation is the number of inversions in the string generated by concatenating all these small strings. You have to minimize this score. A reminder that in a list, a pair $(i, j)$ is an inversion if the value at $i$ is greater than value at $j$ while $i < j$.

The problem might seem a bit complicated so, let's see an example. Suppose the original sequence is $[01, 100, 11]$. In this original state the score will be the number of inversions in $0110011$, which is 4. The inversions are at pairs $(1, 3), (1, 4), (2, 3), (2, 4)$ ($0$-indexed).

Anyways, the process is same as before. Suppose we have two strings $a, b$. Sequence $S_1, S_2$ are same except for at positions $i, i+1$. $S_1$ has $a, b$ there, while $S_2$ has $b, a$ there. now $a \preceq b$ would mean $f(S_1) \leq f(S_2)$. It's a bit difficult to reason about the score here due to the conditional nature of inversions. But it can be done. Notice that in $f()$, some inversions come from the element strings themselves. For example in the $100$ string of above example, 2 inversions will contribute to the final score no matter what. So we can forget about all the inversions coming from element strings themselves. Next, in $f(S_1)$ and $f(S_2)$, both cases consider every other element except $a, b$. Observe that their relative position with respect to positions $i, i+1$ do not change. So those inversion contributions will also not change. The _only_ inversions that matter in comparing $f(S_1), f(S_2)$ are the inversions between $a, b$ themselves.

Suppose $a_0, b_0$ are the number of $0$'s and $a_1, b_1$ are the number of $1$'s in $a, b$. Then in $f(S_1)$, the inversions contributed will be $a_1 \times b_0$. In $f(S_2)$, the inversions contributed will be $a_0 \times b_1$. Sooo, $a \preceq b$ means $a_1b_0 \leq a_0b_1$. Ok, this is new, so far all our implications had a very straight forward representations, they were some known relation. This time can we say that $a_1b_0 \leq a_0b_1$ is a _well defined_ ordering operator? This is important. If we try to define $a \preceq b$ as $a_1b_0 \leq a_0b_1$, this needs to be a proper ordering operator. Luckily $a_1b_0 \leq a_0b_1 \implies \frac{a_1}{a_0} \leq \frac{b_1}{b_0}$, so you can define $a \preceq b$ as $\frac{a_1}{a_0} \leq \frac{b_1}{b_0}$, and you can be confident that this will be a proper order.

If you have keen observation, you will have noticed a blatant mistake I made. you can't say $a_1b_0 \leq a_0b_1 \implies \frac{a_1}{a_0} \leq \frac{b_1}{b_0}$ because it might be that $a_0 = 0$ or $b_0 = 0$ (though you can say the reverse). But you can define $\frac {x}{0} = \infty$, and you will see that it works out after all, i.e. both inequalities behave equivalently. 

Notice this time, we first came to the relation $a_1b_0 \leq a_0b_1$, then we did some massaging to get another relation $\frac{a_1}{a_0} \leq \frac{b_1}{b_0}$. Which one do we define $a \preceq b$ as? In this case we can actually use both. From the second relation we're sure that the definition will work as a proper order. And since it is equivalent to the first relation, we can use that as a definition too. This will not always happen, as you will see later.

### Example 4: There Is No Score? (But There Are Weights And Capacities)

---
_I try to share things that I have learnt recently, and in the process, I can obviously make mistakes, so if you think you found something wrong feel free to [create a issue in the github repository for this blog](https://github.com/upobir/upobir.github.io/issues/new)._
