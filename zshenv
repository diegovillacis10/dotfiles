# https://www.linuxjournal.com/content/removing-duplicate-path-entries
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

export EDITOR=vim
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export PAGER='less -isM'
export MANPAGER='most'
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
export BAT_THEME="Monokai Extended Bright"
