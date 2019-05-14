FREE_DATA=`free -m | grep Mem`
TOTAL=`echo $FREE_DATA | cut -f2 -d' '`
FREE=`echo $FREE_DATA | cut -f4 -d' '`
USED=`expr $TOTAL - $FREE`
RAM=`echo "scale = 2; $USED/$TOTAL*100" | bc`
WARN=0
if [ $(echo "$RAM > 90" |bc -l) -gt 0 ]; then
    echo "RAM usage is over 90%: ${RAM}%"
    WARN=1
else
    echo "RAM is normal: ${RAM}%"
fi
if [ $(echo "$WARN > 0" |bc -l) -gt 0 ]; then
    exit 1
else
    exit 0
fi
