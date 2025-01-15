# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

##general
alias ll='ls -l'
alias c=clear

## xpbs
alias i='doas xbps-install -S'
alias u='i; doas xbps-install -u xbps; doas xbps-install -u'
alias q='doas xbps-query -Rs'
alias r='doas xbps-remove -R'

##battery
alias bs='cat /sys/class/power_supply/BAT0/status'
alias bc='cat /sys/class/power_supply/BAT0/capacity'

##neovim
alias vi='nvim'

##network
alias ws='doas iw dev wlp3s0 link'
alias wd='doas ip link set wlp3s0 down'
alias wc='doas ip link set wlp3s0 up'

##brightness
# Increase brightness by percentage
alias bri+='function _brightness_increase() { doas brightnessctl s $1%+; }; _brightness_increase'

# Decrease brightness by percentage
alias bri-='function _brightness_decrease() { doas brightnessctl s $1%-; }; _brightness_decrease'

# open any program in bg
#alias runbg='nohup "$@" &> /dev/null &'
alias run='function runbg() { nohup "$@" &> /dev/null & }; runbg'

# set vi mode in st
set -o vi

# programs
alias chrome='run chromium'
