alias cls="clear && printf '\e[3J'"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
alias ll="ls -lahF"

parse_git_branch() {
  local DIRTY STATUS
  STATUS=$(git status --porcelain 2>/dev/null)
  [ $? -eq 128 ] && return
  [ -z "$(echo "$STATUS" | grep -e '^ M')"    ] || DIRTY="*"
  [ -z "$(echo "$STATUS" | grep -e '^[MDA]')" ] || DIRTY="${DIRTY}+"
  [ -z "$(git stash list)" ] || DIRTY="${DIRTY}^"
  echo "($(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* //')$DIRTY)"
}

export PS1='\033[00;32mnode:\033[00;37m $(nodenv version-name) | \033[01;34mphp:\033[00;37m $(phpenv version-name) | \033[01;33mpy:\033[00;37m $(pyenv version-name) | \033[00;31mrb:\033[00;37m $(rbenv version-name) [$(rbenv gemset active)]\n\033[01;34m\u@\h:\033[01;32m\w\033[01;33m$(parse_git_branch)\033[00;37m\n\$ '

# UNLIMITED HISTORY
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
