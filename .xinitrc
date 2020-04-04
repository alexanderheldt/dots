[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap se
xset r rate 175 25
setxkbmap -option caps:escape

hsetroot -solid "#191919"

dunst &

exec bspwm
