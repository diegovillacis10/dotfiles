# User configuration
source ${HOME}/.zshaliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ "${OSTYPE}" == "linux"* ]]  && plugins=(git z asdf)
[[ "${OSTYPE}" == "darwin"* ]] && plugins=(git z asdf direnv thefuck)

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Evals
[[ "$(command -v thefuck)" ]] && eval $(thefuck --alias)
[[ "$(command -v direnv)" ]] && eval "$(direnv hook $SHELL)"
[[ "$(command -v starship)" ]] && eval "$(starship init zsh)"

