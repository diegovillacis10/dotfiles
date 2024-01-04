# User configuration
source ${HOME}/.zshaliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(git z asdf)

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Evals
[[ "$(command -v starship)" ]] && eval "$(starship init zsh)"

