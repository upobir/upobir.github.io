+++
title = 'What I Learned Recently: Hugo Static Site Generator'
date = 2024-02-03T23:56:44+06:00
type = 'post'
description = 'While messing around with idea of continuing my blog, I came to learn about Hugo, a static site generator written in Go. I digged a bit, and decided to use it as topic for my new blog post.'
tags = ['tools', 'computer science']

draft = true
+++

I have recently decided to *restart* this blog of mine. The idea is that I'll try to semi-regularly post *"What I learned Recently"* posts. While these posts can be from any topic, they will probably be around software development, competitive programming and mathematics. For the first post, I decided to write about Hugo, the tool that I have used to generate this blog itself! Now as the title says, this is something that I learned recently, so this article probably won't be that deep, but I hope you'll like what I have to share.

#### An Introduction to Hugo
As the [official site](https://gohugo.io/) states, Hugo is a fast static site generator built with Go. Static site generators are tools used to build websites centering around content easily. The idea is that you'll put your content in something like markdown, free from complexities of HTML or CSS and the generator will build the static website for you. Let's use Hugo to build a very simple site to see how this happens. The following section is more or less taken from the [quick start page of official documentation](https://gohugo.io/getting-started/quick-start/). 

To use Hugo, you will of course need to install it, you can find the instructions in the official documentation. But an advise, if you're using Debian, don't go for the apt install, at the time of writing, it is not up-to-date. Rather try the snap install. Once installed, you can create a new *"site"* by running following instruction

```bash
hugo new site <folder-name>
```

This creates a folder containing scaffolding for a bare bones Hugo site. But Hugo doesn't provide a html layout for you to begin with. Rather you install pre-built Hugo themes created by other people. Following the docs, we'll add the [Ananke](https://github.com/theNewDynamic/gohugo-theme-ananke) theme. A good convention is to manage the theme using git submodule. So initilize the folder as a git repository and add theme as submodule into the `themes/ananke` folder.

```bash
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
```

You will also need to change some configs in the `hugo.toml` file in the root of your site folder. In particular, update the toml file to change the `title` value to your liking and add `theme = 'ananke'` to let Hugo know to use the theme. 

To create a post in this site, run the following hugo command which will create a markdown file.

```bash
hugo new content posts/<url-to-post>.md
```

You will then find that `content` folder has this markdown, change it up a bit with following content

```markdown
+++
title = '<whatever-you-want>'
date =  '2024-02-03T23:56:44+06:00'
+++

A new post!
```

Notice the toml part between the `+++`, this is called the front matter, it's used to inject stuff, add metadata or manipulate the generated html. We in particular removed the `draft = true` to make the post visible in our site. 

To see this new post, you can now just run `hugo serve` which will start a local serer in `1313` port where you can see your new site. But this is only a local development server, to actually build the site (i.e. the html and other stuff), run `hugo build`. That's it! 

#### But What is Hugo Really Doing?

