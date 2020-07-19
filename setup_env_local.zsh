#/bin/zsh

chmod +x ./install_*

./install_homebrew.zsh
./install_zsh.sh
./install_omz.sh
./install_tmux.zsh
./install_fzf.zsh
./install_ripgrep.zsh
./install_neovim.zsh
./install_node.zsh
./install_haxor_news.zsh
./install_jenv.zsh

echo '[ -f /Users/nileshkumar/gh/util-scripts/zshrc.aliases ] && source /Users/nileshkumar/gh/util-scripts/zshrc.aliases' >> ~/.zshrc

curl wttr.in/Gurgaon
