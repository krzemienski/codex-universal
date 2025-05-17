#!/usr/bin/env bash
set -euo pipefail
log() { printf '[%s] %s\n' "$(date -u +'%Y-%m-%dT%H:%M:%SZ')" "$*"; }

TMPDIR="$(mktemp -d)"
cat > "$TMPDIR/Dockerfile" <<'DOCKER'
FROM alpine:3.19
CMD ["echo","hello from inner build"]
DOCKER

log "Building sample image inside the codex container …"
docker build -t inner-test-image:latest "$TMPDIR"
log "✅  Image built successfully!"
rm -rf "$TMPDIR"
