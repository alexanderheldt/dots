[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap se
xset r rate 350 25

hsetroot -solid "#191919"

xset s off # Turn off screensaver
xset -dpms # Turn off energy saving mode

dunst &

exec bspwm
