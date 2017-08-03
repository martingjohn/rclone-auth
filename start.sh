#Starts screen
/usr/bin/Xvfb :1 -screen 0 800x600x24 &

#Starts vnc
/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :1 -nopw -wait 5 -shared -permitfiletransfer -tightfilexfer &

export DISPLAY=:1

#Starts window manager - no titlebar or buttons without this
xfwm4 &

#Starts top panel - can't get at minimised windows without this
xfce4-panel &

#Starts firefox on the rclone auth page
firefox http://127.0.0.1:53682/auth &

#Starts terminal and rclone config
xfce4-terminal -e "rclone config --config '/data/rclone.conf'" &
wait
