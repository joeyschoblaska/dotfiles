#!/bin/bash

echo "installing nvim config"
rm -rf ~/.vim
rm -rf ~/.nvim

if [ -d "$HOME/.config/nvim/plugin" ]; then
  echo "...compiled plugins detected"
  mv ~/.config/nvim/plugin ~/.config/nvim_plugin
fi

if [ -f "$HOME/.config/nvim/lua/local.lua" ]; then
  echo "...nvim local.lua detected"
  mv ~/.config/nvim/lua/local.lua ~/.config/nvim_local.lua
fi

rm -rf ~/.config/nvim
mkdir -p ~/.config
cp -r nvim ~/.config/

if [ -d "$HOME/.config/nvim_plugin" ]; then
  echo "...restoring plugins"
  mv ~/.config/nvim_plugin ~/.config/nvim/plugin
fi

if [ -f "$HOME/.config/nvim_local.lua" ]; then
  echo "...restong nvim local.lua"
  mv ~/.config/nvim_local.lua ~/.config/nvim/lua/local.lua
fi


echo "installing tmux config"
cp dots/tmux.conf ~/.tmux.conf


echo "installing prettier config"
cp dots/prettierrc ~/.prettierrc


echo "installing bash config"
cp dots/bash_profile ~/.bash_profile
cp dots/bashrc ~/.bashrc
cp dots/git-completion.bash ~/.git-completion.bash

if [ -d "$HOME/Library/Application Support/lazygit" ]; then
  echo "installing lazygit config"
  cp dots/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml
fi


echo "installing scripts"
rm -rf ~/.config/dotscripts
mkdir -p ~/.config/dotscripts
cp -r scripts/ ~/.config/dotscripts


echo "installing git config"
cp dots/gitconfig ~/.gitconfig
cp dots/gitignore ~/.gitignore


echo "installing bat config"
rm -rf ~/.config/bat
cp -r bat ~/.config/


echo "done!"
