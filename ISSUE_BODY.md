### 🐳 Feature Request – Allow Docker-in-Docker workflows inside Codex

Many production code-bases embed Dockerfiles and expect `docker build` to work
locally. The hosted Codex runtime currently lacks a nested Docker capability.
This proposal ships a DIND-enabled image variant to unblock such workflows.
