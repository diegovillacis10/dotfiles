# My dotfiles

## Brew
For brew, we use the [bundle feature](https://docs.brew.sh/Manpage#bundle-subcommand).
```shell
$ ln -sv <dotfiles_dir>/Brewfile ~/Brewfile
$ brew bundle
```
## VSCode
1. Setup settings
For MacOS:
```shell
$ ln -sv <dotfiles_dir>/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

$ ln -sv <dotfiles_dir>/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```
For Linux:
```shell
$ ln -sv <dotfiles_dir>/vscode/settings.json ~/.config/Code/User/settings.json

$ ln -sv <dotfiles_dir>/vscode/keybindings.json ~/.config/Code/User/keybindings.json
```
2. Setup extensions

NOTE: Make sure to have `code` [binary installed](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line).
```shell
$ ./<dotfiles_dir>/vscode/install-vscode-extenstions.sh
```
## Vim
I'm using [Vim Plug](https://github.com/junegunn/vim-plug) as my plugin manager.
```shell
$ ln -sv <dotfiles_dir>/vimrc ~/.vimrc
$ ln -sv <dotfiles_dir>/coc-settings.json ~/.vim/coc-settings.json
```
To install plugins enter vim and execute `:PlugInstall`

or just run this on your terminal:
```shell
vim +PlugInstall +qall > /dev/null 2>&1
```
## Zsh
There is a file in `secrets/zsh` where you can add you secrets.

```shell
$ mkdir -p ~/.secrets ~/.zsh
$ ln -sv <dotfiles_dir>/secrets/* ~/.secrets/
$ ln -sv <dotfiles_dir>/zsh/* ~/.zsh/
```
### Little advice
I have updated the index on the secrets so git doesn't track and I don't commit them accidentally.

```shell
$ git update-index --assume-unchanged secrets/*
```
## Git
NOTE: Make sure to update the gitconfig file since it has my identity 😉
```shell
$ ln -sv <dotfiles_dir>/gitconfig ~/.gitconfig
$ ln -sv <dotfiles_dir>/gitconfig_global ~/.gitconfig_global
```
## Tmux
```shell
$ ln -sv <dotfiles_dir>/tmux.conf ~/.tmux.conf
```
