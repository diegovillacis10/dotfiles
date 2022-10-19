# My dotfiles

These commands assumes that dotfiles are in home directory. (~/dotfiles).
Make sure of this by doing:

```
git clone https://github.com/diegovillacis10/dotfiles.git ~/dotfiles
```

## Brew

For brew, we use the [bundle feature](https://docs.brew.sh/Manpage#bundle-subcommand).

```shell
ln -sv ~/dotfiles/Brewfile ~/Brewfile
brew bundle
```

## VSCode

1. Setup settings
   For MacOS:

```shell
ln -sv ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sv ~/dotfiles/vscode/keybindings.$(uname).json ~/Library/Application\ Support/Code/User/keybindings.json
```

For Linux:

```shell
ln -sv ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sv ~/dotfiles/vscode/keybindings.$(uname).json ~/.config/Code/User/keybindings.json
```

1. Setup extensions

NOTE: Make sure to have `code` [binary installed](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line).

```shell
./dotfiles/vscode/install-vscode-extenstions.sh
```

## Vim

I'm using [Vim Plug](https://github.com/junegunn/vim-plug) as my plugin manager.

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sv ~/dotfiles/vimrc ~/.vimrc
ln -sv ~/dotfiles/coc-settings.json ~/.vim/coc-settings.json
```

To install plugins enter vim and execute `:PlugInstall`

or just run this on your terminal:

```shell
vim +PlugInstall +qall > /dev/null 2>&1
```

## Zsh

```shell
ln -sv ~/dotfiles/zshenv ~/.zshenv
ln -sv ~/dotfiles/zshaliases ~/.zshaliases
ln -sv ~/dotfiles/zshrc ~/.zshrc
```

## Git

NOTE: Make sure to update the gitconfig file since it has my identity 😉

```shell
ln -sv ~/dotfiles/gitconfig ~/.gitconfig
ln -sv ~/dotfiles/gitconfig_global ~/.gitconfig_global
```

## Config Tmux

```shell
mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sv ~/dotfiles/tmux.conf ~/.tmux.conf
```

## Starship

```shell
mkdir -p ~/.config
ln -sv ~/dotfiles/starship.toml ~/.config/starship.toml
```

## Tig

```shell
ln -sv ~/dotfiles/tigrc ~/.tigrc
```

## Urxvt

```shell
ln -sv ~/dotfiles/Xresources ~/.Xresources
```

## Keyboard

```shell
sudo mv /etc/default/keyboard /etc/default/keyboard.backup
sudo ln -sv ~/dotfiles/keyboard /etc/default/keyboard
```

## EditorConfig

```shell
ln -sv ~/dotfiles/editorconfig ~/.editorconfig
```

## Gem

```shell
ln -sv ~/dotfiles/gemrc ~/.gemrc
```

## NPM

```shell
ln -sv ~/dotfiles/npmrc ~/.npmrc
```

## ASDF

```shell
ln -sv ~/dotfiles/asdfrc ~/.asdfrc
```

