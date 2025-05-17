Adds self-contained Docker-in-Docker support by installing `docker.io` and a
`tini`-supervised entrypoint that launches `dockerd` inside the container. The
PR includes docs and a CI workflow that builds an inner image to prove it
works (fixes #<issue-number>).  

*No mocks, full functional code, Docker-first execution, timestamped logs.*
