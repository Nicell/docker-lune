#!/bin/sh
set -e

# Run command with lune if the first argument contains a "-" or is not a system command.
if [ "$1" != "${1#-}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- lune "$@"
fi

exec "$@"
