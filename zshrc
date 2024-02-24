# User configuration
source ${HOME}/.zshaliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

plugins=(git z asdf zsh-syntax-highlighting zsh-autosuggestions)

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Better history searching
# https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search

# Autosuggest keybindings
# bindkey '^ ' autosuggest-accept
# bindkey '^t' autosuggest-toggle

# Prompt
[[ "$(command -v starship)" ]] && eval "$(starship init zsh)"

