#!/usr/bin/env sh

echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
echo 'was executed.'
set -x

if [ -f .pidfile ]; then
  PID=$(cat .pidfile)
  if kill -0 "$PID" 2>/dev/null; then
    kill "$PID"
  else
    echo "Process $PID does not exist."
  fi
else
  echo ".pidfile not found."
fi
