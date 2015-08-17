xset +dpms
xset dpms 300
xrdb -merge ~/.Xresources
synclient FingerLow=45
synclient FingerHigh=50
$HOME/skrypty/screen_monitor.sh &
exec i3
