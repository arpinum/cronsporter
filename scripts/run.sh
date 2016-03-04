set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATTERN=${PATTERN:-* * * * *}
SCRIPT_PATH=${SCRIPT_PATH:-"$DIR/work/task.sh"}
echo "Scheduling $SCRIPT_PATH with pattern $PATTERN"
cp "$DIR/job.sh" /etc/cron.d/job
sed -i "s/{{PATTERN}}/${PATTERN}/g" /etc/cron.d/job
sed -i "s|{{SCRIPT_PATH}}|${SCRIPT_PATH}|g" /etc/cron.d/job

chmod 0644 /etc/cron.d/job
chmod +x "$SCRIPT_PATH"
touch /var/log/cron.log

cron && tail -f /var/log/cron.log
