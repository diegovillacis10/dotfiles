# https://www.linuxjournal.com/content/removing-duplicate-path-entries
# export PATH=$(echo -n "$PATH" | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

export EDITOR=nvim
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export PAGER='less -isM'
export BAT_THEME=Catppuccin-mocha

# Options for fzf command
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -sel clip)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
export FZF_CTRL_T_OPTS="
  --preview 'batcat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Colored man pages
# https://www.tecmint.com/view-colored-man-pages-in-linux/
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# https://github.com/halcyon/asdf-java#java_home
[[ -f ~/.asdf/plugins/java/set-java-home.zsh ]] && source ~/.asdf/plugins/java/set-java-home.zsh

# Add local bin to path
export PATH=$HOME/.local/bin:$PATH

# Add cargo to path
export PATH=$HOME/.cargo/bin:$PATH

local _old_path="$PATH"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

if [[ $PATH != $_old_path ]]; then
  # `colors` isn't initialized yet, so define a few manually
  typeset -AHg fg fg_bold
  if [ -t 2 ]; then
    fg[red]=$'\e[31m'
    fg_bold[white]=$'\e[1;37m'
    reset_color=$'\e[m'
  else
    fg[red]=""
    fg_bold[white]=""
    reset_color=""
  fi

  cat <<MSG >&2
${fg[red]}Warning:${reset_color} your \`~/.zshenv.local' configuration seems to edit PATH entries.
Please move that configuration to \`.zshrc.local' like so:
  ${fg_bold[white]}cat ~/.zshenv.local >> ~/.zshrc.local && rm ~/.zshenv.local${reset_color}
(called from ${(%):-%N:%i})
MSG
fi

unset _old_path

