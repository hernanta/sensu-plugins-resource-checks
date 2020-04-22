CPU=`top -bn 3 -d 0.1 | grep '^%Cpu' | tail -n 1 | gawk '{print $2+$4+$6}'`
WARN=0
if [ $(echo "$CPU > 90" |bc -l) -gt 0 ]; then
    echo "CPU usage is over 90%: ${CPU}%"
    WARN=1
else
    echo "CPU is normal: ${CPU}%"
fi
if [ $(echo "$WARN > 0" |bc -l) -gt 0 ]; then
    exit 1
else
    exit 0
fi