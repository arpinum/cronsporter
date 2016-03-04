set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATTERN=${PATTERN:-* * * * *}
echo "Scheduling with pattern $PATTERN"
cp "$DIR/job.sh" /etc/cron.d/job
sed -i "s/{{PATTERN}}/${PATTERN}/g" /etc/cron.d/job

chmod 0644 /etc/cron.d/job
chmod +x "$DIR/work/task.sh"
touch /var/log/cron.log

cron && tail -f /var/log/cron.log
