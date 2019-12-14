[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap se
xset r rate 175 25

hsetroot -solid "#191919"

flameshot &
redshift &

~/.scripts/bar &

exec bspwm
