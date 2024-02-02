TMPXAUTHORITY=$(ls /var/run/sddm/*)
sleep 15
DISPLAY=:0 XAUTHORITY=$TMPXAUTHORITY xwd -root > /root/greeter.xwd
convert /root/greeter.xwd /root/greeter.png
rm /root/greeter.xwd
