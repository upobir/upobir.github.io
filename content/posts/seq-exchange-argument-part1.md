+++
title = 'Exchange Argument in Sequences (Part 1)'
date = 2024-06-15T19:39:53+06:00
type = 'post'
description = 'I had the idea for this article about two months ago. Sadly never really got the time to write it. But now with the time, I intend to make it as good as possible. The content is for a common trick used in various greedy competitve programming problems. I have plans for a part 2, in fact the part 2 will have the actual content I had planned originally, so this will be more of an introduction.'
tags = ['competitive programming', 'greedy']

draft = true
+++

Greedy problems are a common category of problems in various competitive programming problem sets. In the simplest terms, these problems ask you to _optimize_ a value in some scenario, and turns out by using some small _greedy_ decisions, we can optimize the target value. This is of course not always the case, but in many cases it is. I find greedy solutions to problems to be fun, but not the solving part, rather the proving part (Yes, you should prove why your solution works, at least when practising). Exchange argument is a general technique of proving greedy algorithms, where we prove that the output provided by the algorithm can be _exchanged_ one step at a time to an optimal output without changing the target value. A bit hard to understand with just words, you'll see examples soon.

What this article is about is application of exchange arguments in the context of sequences. More precisely, I'll be talking about problems where you are given a list of items and you can shuffle the items however you want. You are given a scoring function of the shuffled list, you need to find the shuffle or order of items where the score is optimized (i.e. minimized or maximized, whatever the problem wants). There will be some examples where the problem won't be exactly like this, but you'll see how we handle them.

An warning, this article will get a bit formal, since we are talking about proving facts. So put on your mathematician hats and let's go.

---
_I try to share things that I have learnt recently, and in the process, I can obviously make mistakes, so if you think you found something wrong feel free to [create a issue in the github repository for this blog](https://github.com/upobir/upobir.github.io/issues/new)._
