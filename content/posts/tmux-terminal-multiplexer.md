+++
title = 'What I Learned Recently: Tmux, The Terminal Multiplexer'
date = 2024-02-24T14:48:23+06:00
type = 'post'
description = 'While trying to work with various codebases for my work, I found terminal management difficult. Opening several servers in several terminal tabs and then also keeping a repl open in another, it was all a bit messy. So I finally decided to go for Tmux. Here is what I learned so far.'
tags = ['tools', 'computer science', 'terminal']

draft = true
+++

Tmux is a *Terminal Multiplexer*, which is just a fancy way of describing an organization tool for several terminals. Tmux manages a server which maintains several [pseudoterminals](https://en.wikipedia.org/wiki/Pseudoterminal), you can then connect to this server and work on those terminals. This is extremely useful when you're working over SSH, because even if your SSH disconnects, the tmux server running on the remote machine keeps the terminal sessions running and can be attached to again. Besides SSH, Tmux also makes it easy to arrange terminals for productivity. It will make more sense when you use it.

The source of all Tmux related knowledge is the [Tmux man page](https://manpages.ubuntu.com/manpages/focal/en/man1/tmux.1.html). But it is huge! You can read articles or watch tutorials about Tmux, but I found most to be too shallow level. So I did some skimming of the man pages, and I think I have a better understanding of Tmux now. In this article, I'll first go through a quickstart to showcase common functionalities and concepts of tmux, then I'll go deeper into the command system and configurations.

#### A Quick Overview of Tmux

----
*I try to share things that I have learnt recently, and in the process, I can obviously make mistakes, so if you think you found something wrong feel free to [create a issue in the github repository for this blog](https://github.com/upobir/upobir.github.io/issues/new).*