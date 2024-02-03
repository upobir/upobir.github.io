# upobir.github.io

This site is made using [Hugo](https://gohugo.io/), using the [gokarna](https://github.com/526avijitgupta/gokarna) theme.

# Prerequisite

- Install Go and Hugo in your system
- Clone this repo
- Make sure to install submodules with `git submodule update --init --recursive`

# Development

To run the development server, run `hugo serve`. 

- The server will start in localhost port `1313` to customize, use `-p <port>`. 
- To build draft pages too, use `-D`

To create new post, run `hugo new posts/<url>.md`. Note the `draft = true` will be in the default created page, remember to erase it when merging to main branch.
