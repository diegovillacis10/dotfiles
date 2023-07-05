# https://www.linuxjournal.com/content/removing-duplicate-path-entries
# export PATH=$(echo -n "$PATH" | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

export EDITOR=vim
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export PAGER='less -isM'
export MANPAGER='most'
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
export BAT_THEME="Monokai Extended Bright"

# https://github.com/halcyon/asdf-java#java_home
[[ -f ~/.asdf/plugins/java/set-java-home.zsh ]] && source ~/.asdf/plugins/java/set-java-home.zsh

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

. "$HOME/.cargo/env"
