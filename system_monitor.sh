#!/bin/bash

# Logs configuragtion
LOG_FILE='/var/log/system_metrics.log' 
# Alerts configuration
ALERT_FILE='/var/log/alerts.log'
# Alert if above 80%
THRESHOLD=80

# Create log files if they don't exist
[ ! -f "$LOG_FILE" ] && sudo touch "$LOG_FILE" && sudo chmod 666 "$LOG_FILE"
[ ! -f "$ALERT_FILE" ] && sudo touch "$ALERT_FILE" && sudo chmod 666 "$ALERT_FILE"


# Get CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

# Get Memory Usage
MEMORY_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEMORY_USED=$(free -m | awk '/Mem:/ {print $3}')
MEMORY_USAGE=$((MEMORY_USED * 100 / MEMORY_TOTAL))

# Get the timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Print the log metrics on the terminal
echo "$TIMESTAMP CPU:$CPU_USAGE% MEMORY:$MEMORY_USAGE%" >> $LOG_FILE

# Check for threshold and alert
if [ $CPU_USAGE -gt $THRESHOLD ] || [ $MEMORY_USAGE -gt $THRESHOLD ]; then
    echo "$TIMESTAMP ALERT: High CPU Usage: $CPU_USAGE%, MEMORY:$MEMORY_USAGE%"
else
    echo "System is okay, CPU: $CPU_USAGE%, MEMORY:$MEMORY_USAGE%"
fi

# Print out any unauthorized access attempts
if [ "$EUID" -ne 0 ]; then
    echo "$TIMESTAMP WARNING: Script run by a non-root user: $(whoami)" >> $ALERT_FILE
fi


