#!/bin/bash
set -e

SCRIPT=$(readlink -f "$0")
cd "$(dirname "$SCRIPT")"

# start tmuxinator
tmuxinator start -p session_gcs.yml