export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git ssh-agent zsh-autosuggestions zsh-syntax-highlighting F-Sy-H)

alias cls="clear && printf '\e[3J'"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
alias ll="ls -lahF"
