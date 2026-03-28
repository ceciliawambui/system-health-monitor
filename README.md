# System Health Monitor 

A Bash script that keeps an eye on your Linux system every 5 minutes, checking CPU and memory usage, logging the results, and raising an alert if anything goes above 80%.

Built as a DevOps project covering Bash scripting, cron automation, log parsing, Git, and basic security.

---

## What's Inside

```
system-health-monitor/
├── system_monitor.sh    # Main script — checks CPU & memory, logs everything
├── parse_logs.sh        # Pulls out alerts and summarises the logs
├── monitor.conf         # Config file for settings like SMTP server
├── calms_summary.md     # DevOps framework write-up
├── system_metrics.log   # Auto-generated — every health check gets logged here
└── alerts.log           # Auto-generated — only the alerts land here
```

---

## Setup

```bash
# Give scripts permission to run
chmod 755 system_monitor.sh parse_logs.sh

# Create the log files (needs sudo once)
sudo touch /var/log/system_metrics.log /var/log/alerts.log
sudo chmod 666 /var/log/system_metrics.log /var/log/alerts.log

# Test it
./system_monitor.sh
```

---

## Automate It

To run the monitor every 5 minutes without thinking about it:

```bash
crontab -e
```

Add this line:

```
*/5 * * * * /home/wambui/Desktop/system-health-monitor/system_monitor.sh
```

---

## Parse The Logs

Once the script has been running for a while:

```bash
./parse_logs.sh
```

This prints all alerts, counts total log entries, and saves a clean summary to `summary.txt`.

---

## Security

```bash
chmod 700 system_monitor.sh   # Only owner can run it
chmod 600 monitor.conf         # Only owner can read the config

# Update config settings without opening the file
sed -i 's/SMTP_SERVER=localhost/SMTP_SERVER=smtp.example.com/' monitor.conf
```

---

## Troubleshooting

**alerts.log is empty** — your system is healthy! To test alerts, temporarily set `THRESHOLD=1` in `system_monitor.sh`, run it, then set it back to 80.

**Permission denied on /var/log/** — run `sudo chmod 666 /var/log/system_metrics.log /var/log/alerts.log`

---

### Author
**Cecilia Wambui - https://github.com/ceciliawambui**