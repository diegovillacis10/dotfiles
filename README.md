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
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
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

If using ideavim:

```shell
ln -sv ~/dotfiles/ideavimrc ~/.ideavimrc
```

NOTE: if colors are not displaying correctly, take a look at this [article](https://weibeld.net/terminals-and-shells/italics.html).

## Neovim

```shell
mkdir -p ~/.config/nvim
ln -sv ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sv ~/dotfiles/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
ln -sv ~/dotfiles/nvim/lua ~/.config/nvim/lua
ln -sv ~/dotfiles/nvim/lsp ~/.config/nvim/lsp
```

## Zsh

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -sv ~/dotfiles/zshenv ~/.zshenv
ln -sv ~/dotfiles/zshaliases ~/.zshaliases
ln -sv ~/dotfiles/zshrc ~/.zshrc
```

## fzf

```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/junegunn/fzf-git.sh.git ~/.fzf-git.sh
```

## Waybar

```shell
ln -sv ~/dotfiles/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sv ~/dotfiles/waybar/style.css ~/.config/waybar/style.css
```

## Git

NOTE: Make sure to update the gitconfig file since it has my identity 😉

```shell
ln -sv ~/dotfiles/gitconfig ~/.gitconfig
ln -sv ~/dotfiles/gitconfig_global ~/.gitconfig_global
```

## Config Tmux

```shell
mkdir -p ~/.tmux/plugins/ ~/.local/bin/
ln -sv ~/dotfiles/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sv ~/dotfiles/tmux.conf ~/.tmux.conf
```

Press `prefix + I` to fetch the plugins.

## Starship

```shell
mkdir -p ~/.config
ln -sv ~/dotfiles/starship.toml ~/.config/starship.toml
```

## Tig

```shell
ln -sv ~/dotfiles/tigrc ~/.tigrc
```

## wlogout

```shell
ln -sv ~/dotfiles/wlogout/layout ~/.config/wlogout/layout
ln -sv ~/dotfiles/wlogout/style.css ~/.config/wlogout/style.css
ln -sv ~/dotfiles/wlogout/icons/ ~/.config/wlogout/
```

## Ghostty

```shell
mkdir -p ~/.config/ghostty/
mv ~/Library/Application Support/com.mitchellh.ghostty/config ~/Library/Application Support/com.mitchellh.ghostty/config.bk
ln -sv ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

## Alacritty

```shell
ln -sv ~/dotfiles/alacritty.toml ~/.alacritty.toml
```

## Kitty

```shell
mkdir -p ~/.config/kitty/
ln -sv ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
```

## Wezterm

```shell
mkdir -p ~/.config/wezterm/
ln -sv ~/dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua
```

## Urxvt

```shell
ln -sv ~/dotfiles/Xresources ~/.Xresources
```

## yazi

```shell
git clone https://github.com/BennyOe/tokyo-night.yazi.git ~/.config/yazi/flavors/tokyo-night.yazi
ln -sv ~/dotfiles/yazi/theme.toml ~/.config/yazi/theme.toml
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

## diff-so-fancy

```shell
git clone https://github.com/so-fancy/diff-so-fancy.git ~/.diff-so-fancy
chmod +x ~/.diff-so-fancy/diff-so-fancy
ln -sv ~/.diff-so-fancy/diff-so-fancy ~/.local/bin/diff-so-fancy
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

## i3 & i3blocks

```shell
mkdir -p ~/.config/i3 ~/.config/i3status
ln -sv ~/dotfiles/i3_config ~/.config/i3/config
ln -sv ~/dotfiles/i3status.conf ~/.config/i3status/config
ln -sv ~/dotfiles/scripts/lock ~/.config/scripts/lock
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks
ln -sv ~/dotfiles/i3blocks/config ~/.config/i3blocks/config
```

## yabai & skhd

```shell
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

mkdir -p ~/.config/yabai ~/.config/skhd
ln -sv ~/dotfiles/yabairc ~/.config/yabai/yabairc
ln -sv ~/dotfiles/skhdrc ~/.config/skhd/skhdrc

yabai --start-service
skhd --start-service
```

## aerospace

```shell
brew install --cask nikitabobko/tap/aerospace
mkdir -p ~/.config/aerospace
ln -sv ~/dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
```

## spotify-tui

```shell
mkdir -p ~/.config/spotify-tui
ln -sv ~/dotfiles/spotify-tui/config.yml ~/.config/spotify-tui/config.yml
```

## Bat

```shell
curl -fLo "$(bat --config-dir)/themes/tokyonight_night.tmTheme" --create-dirs \
    https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
curl -fLo "$(bat --config-dir)/themes/Catppuccin-mocha.tmTheme" --create-dirs \
    https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
bat cache --build
```
