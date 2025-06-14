# User configuration
[[ -f ${HOME}/.zshaliases ]] && source ${HOME}/.zshaliases

# Local config
[[ -f ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

plugins=(
  git
  asdf
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Path to oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

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

# Set up fzf key bindings and auto completion
[[ "$(command -v fzf)" ]] && eval "$(fzf --zsh)"
[[ -f ${HOME}/.fzf.zsh ]] && source ${HOME}/.fzf.zsh
[[ -f ${HOME}/.fzf-git.sh/fzf-git.sh ]] && source ${HOME}/.fzf-git.sh/fzf-git.sh

[[ "$(command -v zoxide)" ]] && eval "$(zoxide init zsh)"

# Prompt
[[ "$(command -v starship)" ]] && eval "$(starship init zsh)"

