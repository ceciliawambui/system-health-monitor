# Logs configuragtion
LOG_FILE='/var/log/system_metrics.log' 
# Alerts configuration
ALERT_FILE='/var/log/alerts.log'

echo " LOG PARSER REPORT "
echo " $(date '+%Y-%m-%d %H:%M:%S')"

# Extract all the alerts
echo -e "\n ALL ALERTS:"
grep "ALERT" $ALERT_FILE

# Get the total count of all entries
TOTAL=$(wc -l < $LOG_FILE)
echo -e "\n Total log entries: $TOTAL"


# Summarize the alerts usig awk
echo -e "\n Alert Summary:"
awk '/ALERT/{print $1, $2, $5, $7}' $LOG_FILE > summary.txt

echo -e "\n Reports saved to summary.txt"