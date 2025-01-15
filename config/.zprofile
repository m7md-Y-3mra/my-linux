# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export BROWSER="chromium"
export TERMINAL="st"
export TERM="st"

#doas ip link set wlp3s0 up
#doas wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant.conf
test ! -S /tmp/.X11-unix/X0 && test "$(tty)" = /dev/tty1 && startx

doas loadkeys ~/.config/loadkeys/loadkeysrc
