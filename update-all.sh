#!/bin/bash

# Make Ctrl+C work
trap "echo -e '\nAborted.'; exit 1" INT

# Exit early if no permission
docker ps > /dev/null || exit

for dir in */; do
    if [ -d "$dir" ]; then
        echo "=== Updating $dir ==="
        (
            cd "$dir" || exit
            docker compose pull
            docker compose up -d
        )
    fi
done
