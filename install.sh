#!/bin/bash

if [[ -d "$HOME/.gusto" ]]; then
  localenv="gusto"
else
  localenv="unknown"
fi

if [[ ${localenv} == "gusto" ]]; then
  echo "gusto laptop detected"

  # we are not using the force flag, so fail if any local configs differ from
  # what's in the repo
  if [[ $1 != "-f" ]]; then
    abort="false"

    if ! cmp -s "nvim/locals/gusto.lua" "$HOME/.config/nvim/lua/local.lua"; then
      abort="true"
      echo "🚨 local nvim config differs from repo - aborting"
      diff "nvim/locals/gusto.lua" "$HOME/.config/nvim/lua/local.lua"
    fi

    if ! cmp -s "dots/bashrc_local.gusto" "$HOME/.bashrc_local"; then
      abort="true"
      printf "\n🚨 local bash config differs from repo - aborting"
      delta "dots/bashrc_local.gusto" "$HOME/.bashrc_local"
    fi

    if ! cmp -s "dots/gitconfig.gusto" "$HOME/.gitconfig"; then
      abort="true"
      printf "\n🚨 local git config differs from repo - aborting"
      delta "dots/gitconfig.gusto" "$HOME/.gitconfig";
    fi

    if ! cmp -s "dots/gitignore.gusto" "$HOME/.gitignore"; then
      abort="true"
      printf "\n🚨 local git ignore differs from repo - aborting"
      delta "dots/gitignore.gusto" "$HOME/.gitignore";
    fi

    [[ ${abort} == "true" ]] && exit 1
  fi
fi

#################################################################################

echo "installing nvim config"

rm -rf ~/.vim
[[ ${localenv} != "gusto" ]] && rm -rf ~/.nvim

if [[ -d "$HOME/.config/nvim/plugin" ]]; then
  echo "...compiled plugins detected"
  mv ~/.config/nvim/plugin ~/.config/nvim_plugin
fi

if [[ -f "$HOME/.config/nvim/lua/local.lua" ]]; then
  echo "...nvim local.lua detected"
  mv ~/.config/nvim/lua/local.lua ~/.config/nvim_local.lua
fi

rm -rf ~/.config/nvim
mkdir -p ~/.config
cp -r nvim ~/.config/
rm -rf ~/.config/nvim/locals

if [[ -d "$HOME/.config/nvim_plugin" ]]; then
  echo "...restoring plugins"
  mv ~/.config/nvim_plugin ~/.config/nvim/plugin
fi

if [[ -f "$HOME/.config/nvim_local.lua" ]]; then
  echo "...restoring nvim local.lua"
  mv ~/.config/nvim_local.lua ~/.config/nvim/lua/local.lua
fi

if [[ ${localenv} == "gusto" ]]; then
  cp nvim/locals/gusto.lua ~/.config/nvim/lua/local.lua
fi

#################################################################################

echo "installing tmux config"

cp dots/tmux.conf ~/.tmux.conf

#################################################################################

echo "installing prettier config"

if [[ ${localenv} == "gusto" ]]; then
  cp dots/prettierrc ~/projects/.prettierrc
else
  cp dots/prettierrc ~/.prettierrc
fi

#################################################################################

echo "installing bash config"

if [[ ${localenv} == "gusto" ]]; then
  # update gusto-managed .bash_profile to source local .bashrc
  grep -q bashrc ~/.bash_profile || echo "[[ -r ${HOME}/.bashrc ]] && source ${HOME}/.bashrc" >> ~/.bash_profile

  cp dots/bashrc_local.gusto ~/.bashrc_local
else
  cp dots/bash_profile ~/.bash_profile
fi

cp dots/bashrc ~/.bashrc
cp dots/git-completion.bash ~/.git-completion.bash

#################################################################################

if [[ -d "$HOME/Library/Application Support/lazygit" ]]; then
  echo "installing lazygit config"
  cp dots/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml
fi

#################################################################################

echo "installing dotscripts"

rm -rf ~/.config/dotscripts
mkdir -p ~/.config/dotscripts
cp -r scripts/ ~/.config/dotscripts

#################################################################################

echo "installing git config"

if [[ ${localenv} == "gusto" ]]; then
  cp dots/gitconfig.gusto ~/.gitconfig
  cp dots/gitignore.gusto ~/.gitignore
else
  cp dots/gitconfig ~/.gitconfig
  cp dots/gitignore ~/.gitignore
fi

#################################################################################

echo "installing bat config"

rm -rf ~/.config/bat
cp -r bat ~/.config/

#################################################################################

echo "installing slate config"

cp dots/slate.js ~/.slate.js

#################################################################################

if [[ -d "$HOME/Library/Application Support/Karabiner" ]]; then
  echo "installing karabiner config (old format)"
  cp karabiner/private.xml "$HOME/Library/Application Support/Karabiner/private.xml"
elif [ -d "$HOME/.config/Karabiner" ]; then
  echo "installing karabiner config"
  cp karabiner/karabiner.json $HOME/.config/karabiner/

  echo "installing hammerspoon config"
  rm -rf $HOME/.hammerspoon
  mkdir -p $HOME/.hammerspoon
  cp -r hammerspoon/ $HOME/.hammerspoon/
else
  echo "skipping karabiner config"
fi

#################################################################################

echo "installing irb config"

cp dots/irbrc ~/.irbrc

#################################################################################

echo "done!"
