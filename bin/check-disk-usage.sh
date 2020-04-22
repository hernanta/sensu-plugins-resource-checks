HDD=$(df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1)
WARN=0
if [ $(echo "$HDD > 90" |bc -l) -gt 0 ]; then
    echo "HDD usage is over 90%: ${HDD}%"
    WARN=1
else
    echo "HDD is normal: ${HDD}%"
fi
if [ $(echo "$WARN > 0" |bc -l) -gt 0 ]; then
    exit 1
else
    exit 0
fi
