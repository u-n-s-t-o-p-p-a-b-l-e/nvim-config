
#!/bin/sh
cvt 1920 1200 60
Modeline "1920x1200"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr --newmode "1920x1200" 193.25 1920 2056 2256 2592 1200 1203 1209 1245 -hsync +vsync
xrandr --addmode VGA-1 1920x1200

cvt 1440 900 60
Modeline "1440x900" 106.50 1440 1528 1672 1904 900 903 909 934 -hsync +vsync
xrandr --newmode "1440x900" 106.50 1440 1528 1672 1904 900 903 909 934 -hsync +vsync
xrandr --addmode VGA-1 1440x900
#xrandr --output VGA-1 --mode 1440x900_60.00


xrandr --auto --output LVDS-1 --mode 1366x768 --primary --left-of VGA-1
xrandr --auto --output VGA-1 --mode 1440x900 --right-of LVDS-1
xrandr --auto --output HDMI-1 --mode 1440x900 --right-of VGA-1
