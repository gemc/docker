#!/bin/tcsh -f
#
# This script should be sourced in order to modify the 
# environment of the calling shell. Normally, this will
# be done via the xstart alias which is defined in
# /etc/profile.d/xstart.csh  which itself is sourced 
# automatically at login (because it's put in /etc/profile)

set geom="1600x1200"

# Start VNC server
vncserver -SecurityTypes None -geometry $geom |& grep "desktop is" | awk '{split($6,a,":"); print a[2]}' > /tmp/vncnum
set vncnum=`cat /tmp/vncnum`

# set DISPLAY
setenv DISPLAY :$vncnum

# set DISPLAY in .tcshrc so subsequent logins will use
# this. It's not clear this is the best solution, but
# may work for now.
echo "setenv DISPLAY :$vncnum" >> $HOME/.tcshrc

# Start xfce4 window manager
# Why do we need to sleep?
sleep 2
xfce4-session < /dev/null >& /dev/null &

# Start noVNC server to present VNC as HTML5 webserver
# Note that unlike vncserver, this will not find an available
# port. We must keep trying until we find one.
set vnchostport=localhost:`expr 5900 "+" $vncnum`
foreach port (`seq 6080 6280` )
	set line=`netstat -lnt | awk '$6 == "LISTEN" && $4 ~ /:'$port'$/'  | wc | awk '{print $1}'`
	if ( "$line" == "0" ) then 
		break
	endif
	echo "Port $port unavailable for noVNC server"
	sleep 0.25
end

echo " "
echo " Launching noVNC on port $port ..."
/opt/noVNC/utils/launch.sh --listen $port --vnc $vnchostport < /dev/null >& /dev/null &

echo " "
echo " Point your browser on to:"
echo " "
echo " http://localhost:$port"
echo " "
echo " Alternatively, point your VNC client to $vnchostport"
echo " "
