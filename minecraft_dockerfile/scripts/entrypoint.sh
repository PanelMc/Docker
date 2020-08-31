#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Start the server
start() {
  cd "$SERVER_PATH"

  if ! [ -f "spigot.jar" ]; then
    echo "Spigot jar not found, downloading..."
    curl "$SPIGOT_JAR" -o "spigot.jar" -s
  fi

  exec java -Dfile.encoding=UTF-8 "$JAVA_ARGS" \
    -jar spigot.jar "$SPIGOT_ARGS"
}

if [ "$1" = "start" ]; then
  loadArtifacts

  start
fi

exec "$@"
