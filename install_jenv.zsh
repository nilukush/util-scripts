#!/usr/bin/zsh

git clone https://github.com/jenv/jenv.git ~/.jenv
# Shell: zsh
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc