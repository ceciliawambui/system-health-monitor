# CALMS Framework

## Introduction to CALMS
CALMS is a framework that defines the core pillars of a DevOps culture.
It stands for Culture, Automation, Lean, Measurement, and Sharing.

## Culture
In this project, culture means treating our monitoring script as a team
asset, not a personal tool. By using Git for version control, any team
member can see changes, suggest improvements, and collaborate. Every
commit tells a story of what changed and why.

## Automation
Instead of manually checking CPU and memory usage, our system_monitor.sh
script runs automatically every 5 minutes via cron. This removes human
error, saves time, and ensures consistent monitoring even when no one
is watching the system.

## Lean
We focus only on what matters, CPU usage, memory usage, and alerts
when thresholds are exceeded. There is no unnecessary complexity.
The parse_logs.sh script extracts only critical information from logs,
eliminating noise and keeping reports clean.

## Measurement
Every time the script runs, it logs a timestamped entry to
system_metrics.log. This creates a history of system performance
that can be reviewed, graphed, or analysed. Alerts are separately
logged to alerts.log for quick access to critical events.

## Sharing
Log files act as a shared communication tool. Any team member can
read system_metrics.log or alerts.log to understand the system's
health without needing to run commands themselves. 

## Conclusion
CALMS turns this simple monitoring script into a DevOps practice, automated, measurable, collaborative, and built for sharing.