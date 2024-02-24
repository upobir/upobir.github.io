+++
title = 'What I Learned Recently: Tmux, The Terminal Multiplexer'
date = 2024-02-24T14:48:23+06:00
type = 'post'
description = 'While trying to work with various codebases for my work, I found terminal management difficult. Opening several servers in several terminal tabs and then also keeping a repl open in another, it was all a bit messy. So I finally decided to go for Tmux. Here is what I learned so far.'
tags = ['tools', 'computer science', 'terminal']

draft = true
+++

Tmux is a *Terminal Multiplexer*, which is just a fancy way of describing an organization tool for several terminals. Tmux manages a server which maintains several [pseudoterminals](https://en.wikipedia.org/wiki/Pseudoterminal), you can then connect to this server and work on those terminals. This is extremely useful when you're working over SSH, because even if your SSH disconnects, the tmux server running on the remote machine keeps the terminal sessions running and can be attached to again. Besides this, Tmux also makes it easy to arrange terminals for productivity. It will make more sense when you use it.

The source of all Tmux related knowledge is the [Tmux man page](https://manpages.ubuntu.com/manpages/focal/en/man1/tmux.1.html). But it is huge! You can read articles or watch tutorials about Tmux, but I found most to be too shallow level. So I did some skimming of the man pages, and I think I have a better understanding of Tmux now. In this article, I'll first go through a quickstart to showcase common functionalities and concepts of tmux, then I'll go deeper into the command system and configurations.

#### A Quick Overview of Tmux

To start with Tmux, you need to install it first. Check out [Tmux wiki's installing page](https://github.com/tmux/tmux/wiki/Installing) for instructions. For ubuntu, it might be installed by default, you can run `tmux --help` in your terminal to be sure. Once installed, let's run it and see what it does. Note the following instructions are meant to quickly showcase Tmux's capabilities, they might not make sense now, but I will explain later. It's also advised to follow along, I do provide screenshots, but doing the real thing is best.

Tmux manages all the terminals by a server. To check that no Tmux server is running now, run `tmux ls`, you will see a output stating that no server is running. So to create a server, run `tmux`. At first it might seem like nothing happened, but you will note that your prompt has lost color (if it had color before and this is a fresh new tmux installation) and there is a status bar in the bottom of terminal which has `[0] 0:bash*` written at left. This means you're in Tmux now. With that `tmux` command, Tmux started the **server**, created a **session**, created a **client** instance and the client connected to that session. The sessions are collection of terminals that your client can attach to or detach from, these are managed by the server. The client is basically you interacting with session. The session we created just now is given default name of `0` which is why the status bar has `[0]` written. Right now you can use the tmux session just like a terminal, for example you can run `echo I am using tmux now` and it will do what it'd do in normal terminal.

TODO image here

Tmux sessions can have multiple **windows** which are like tabs. Right now you are in the window with `0` index, named `bash`. To create another window, first press `ctrl+b`, then press `c`. You will see that you are in a fresh terminal again, not showing the echo command you just did. You will also see that the status bar has changed a bit, it has `[0] 0:bash- 1:bash*` written now. This means you have two windows in this session, and you're on the one with index 1, which has `*` beside it, the one with `-` beside it is the previous window you were on. These `bash` names are not helpful. We will use another shortcut to rename the window, press `ctrl+b`, then press `,`, to get the prompt to rename window (in status bar). By the way, note that these shortcut always require pressing `ctrl+b` first (from hereafter, written as `C-b`), this is the default **prefix** key, needed for all tmux shortcuts. Anyway, rename the window to be something like `win1`. To go back to first window, press the prefix (`C-b`), then press `0`. We're back at the old window with the echo command, rename this window to `win0` (prefix, then `,`).

TODO image here

Let's also rename the session, the `0` name is boring. Press the prefix, then `$`. You will get the session renaming prompt, enter the name `first`. Let's now *detach*, from our session, by pressing prefix, then `d`. We are back to our normal terminal. What we just did is terminate the client, but the session is still functional, maintained by the server. If you run `tmux ls`, you will see output of `first: 2 windows` and the time it was created. So the session is still there, let's try `tmux` again. Oh no, this is not our old session we see `[1] 0:bash*` in status bar, so it's a new sesssion (named `1`) with a new window. Windows always belong to one session, this window is different from the two windows of our old session. In fact you can run `tmux ls` while in this session, to see the list of two sessions: `first` and `1`. Multiple sessions are useful, but we have no use for this now, let's kill this session, killing has no shortcut by default, so we will have to use the *command prompt*. Press the prefix then press `:`, you will see a prompt in the status bar, write `kill-session` and press enter. And we are back to terminal. You can run `tmux ls` to see that we again have one session left. How do we get back to it? Run `tmux attach` or `tmux attach -t first` (the flag is not needed as by default the recentmost active session is attached to). And we are back to the old session!.

TODO image here

Now let's come to one of the fanciest features of Tmux, **panes**. A pane is the actual pseudo terminal you interact with. Panes take some part of the window they belong to. So far the windows we made all had one pane taking the entire space, let's build several panes in the window we are at. Press the prefix, then `%` and voila! The window has two panes placed horizontally, you are on the right one (notice the cursor or how lower part of divider is green). Press prefix then `"`, now the right pane is divided into two panes vertically. In particular you can use these two shortcuts to keep dividing and creating new panes. To move around panes, press prefix then direction keys. To resize the panes, press prefix then press `ctrl + <direction>` (I actually just press direction while keeping the prefix pressed).

TODO image here

What if we are done with a pane? We can kill a pane in two ways, either run `exit` in that pane, which is okay, but might be not possible, if for example you do not want to terminate current running program. For that press prefix, then press `x`, you will get prompt to kill current pane. And suppose you just want to kill the current window, then press the prefix, followed by `&`. I have already showed how to kill the session, but suppose you just want to kill the server (thus killing *all sessions*), then go to the command prompt (prefix, then `:`) and enter `kill-server`. The server would've terminated anyway when there are no sessions left, this is to kill all sessions.

Ok that was lots of instructions. Hopefully you got the gist of tmux, in fact you can already start using it with these instructions. But it's a bit bland right now, we'll see customizations in the last part of the article. Before that let's try to dig deeper into the tmux interface.

#### Tmux commands: shell prompt, command prompt, key bindings and tmux scripts

----
*I try to share things that I have learnt recently, and in the process, I can obviously make mistakes, so if you think you found something wrong feel free to [create a issue in the github repository for this blog](https://github.com/upobir/upobir.github.io/issues/new).*