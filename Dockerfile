FROM ghcr.io/openai/codex-universal:latest

ENV DOCKER_BUILDKIT=1
USER root
RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends docker.io fuse-overlayfs tini \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY dockerd-entrypoint.sh /usr/local/bin/dockerd-entrypoint.sh
RUN chmod +x /usr/local/bin/dockerd-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
CMD ["bash"]
