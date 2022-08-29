# dotfiles

## Dependencies
### tmux
https://linuxize.com/post/getting-started-with-tmux/#installing-tmux

#### Ubuntu
May need to manually load keybindings (like `ctrl-r`) in `.bashrc_local`: https://unix.stackexchange.com/questions/665689/fzf-ctlr-r-not-triggering-history-search-on-command-line

### node / npm / yarn
#### Ubuntu
```
sudo apt install nodejs npm
sudo npm install --global yarn
```

### ripgrep
**rg:** https://github.com/BurntSushi/ripgrep#installation

### fd
**fd:** https://github.com/sharkdp/fd

### nvim
Run `checkhealth` to see what providers are needed.

### prettier
* [prettier/prettier: Prettier is an opinionated code formatter.](https://github.com/prettier/prettier)
* [prettier/plugin-ruby: Prettier Ruby Plugin](https://github.com/prettier/plugin-ruby): Need to install NPM module as well as Ruby gem.

### nerd-fonts
Use `Droid Sans Mono Slashed Nerd Font.ttf` to get glyphs in some LSP symbol menus (see `lspkind`).

### LSP
* [Solargraph: A Ruby Language Server](https://solargraph.org/)
* [typescript-language-server/typescript-language-server: TypeScript & JavaScript Language Server](https://github.com/typescript-language-server/typescript-language-server)

```
gem install solargraph
yarn global add typescript-language-server typescript
```

### delta
* [Installation - delta](https://dandavison.github.io/delta/installation.html)
* [Supported languages and themes - delta](https://dandavison.github.io/delta/supported-languages-and-themes.html): Delta uses bat under the hood, and has access to all of bat's available themes.

```
brew install git-delta
```

If delta is giving a "memory allocation of <big number> bytes failed" error, see this: https://github.com/dandavison/delta/issues/878#issuecomment-1004068761


### bat
After changing any themes or other settings, you probably need to re-build the bat cache:

```
bat cache --clear
bat cache --build
```

### slate
* https://github.com/mattr-/slate

(TODO: this project is no longer maintened and it's recommended to move to Hammerspoon)

```
brew install --cask mattr-slate
```

## nvim
To sync packages after changing plugins, run `:PackerSync`

If things are weird or broken, try removing this directory and re-installing everything: `rm -rf ~/.local/share/nvim`
