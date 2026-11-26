#!/bin/sh
# PopTracker reads XDG_CONFIG_DIR (not XDG_CONFIG_HOME) and otherwise writes to ~/.config,
# which the sandbox can't reach. Point it at the app's own config folder instead.
export XDG_CONFIG_DIR="$XDG_CONFIG_HOME"
exec /app/bin/poptracker "$@"
