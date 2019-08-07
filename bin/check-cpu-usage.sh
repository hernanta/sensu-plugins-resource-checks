CPU=$(top -bn 2 -d 0.1 | grep -i "Cpu(s)" | tail -n 1 | gawk '{print $2+$4+$6}')
WARN=0
CRIT=0
if [ $(echo "$CPU > 90" |bc -l) -gt 0 ]; then
    echo "CPU usage is over 90%: ${CPU}%"
    CRIT=2
elif [ $(echo "$CPU > 80" |bc -l) -gt 0 ]; then
    echo "CPU usage is over 80%: ${CPU}%"
    WARN=1
else
    echo "CPU is normal: ${CPU}%"
fi

if [ $(echo "$CRIT > 0" |bc -l) -gt 0 ]; then
    exit 2
elif [ $(echo "$WARN > 0" |bc -l) -gt 0 ]; then
    exit 1
else
    exit 0
fi
