#!/usr/bin/env bash
set -euo pipefail
# Launch dockerd in the background, then exec the passed CMD.

cleanup() { kill "$DOCKER_PID" 2>/dev/null || true; }
trap cleanup EXIT SIGINT SIGTERM

/usr/bin/dockerd \
  --host=unix:///var/run/docker.sock \
  --storage-driver=overlay2 \
  --iptables=false \
  --data-root=/var/lib/docker &
DOCKER_PID=$!

# Wait until dockerd is responsive (max 30 s)
for _ in {1..30}; do
  docker info > /dev/null 2>&1 && break
  sleep 1
done

exec "$@"
