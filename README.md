# Docker Homelab Templates

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/Docker-24%2B-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Compose](https://img.shields.io/badge/Docker%20Compose-v2-2496ED?logo=docker&logoColor=white)](https://docs.docker.com/compose/)

Production-ready Docker Compose templates for self-hosting on Proxmox/bare-metal. Battle-tested on a 2-node cluster with 60+ containers.

Each stack is fully independent and can run standalone. Every directory includes a `docker-compose.yml` and `.env.example` with documented configuration.

---

## Table of Contents

- [Monitoring](#monitoring)
- [Media](#media)
- [Productivity](#productivity)
- [Security](#security)
- [Dev Tools](#dev-tools)
- [Smart Home](#smart-home)
- [Reverse Proxy](#reverse-proxy)
- [Backup](#backup)
- [Quick Start](#quick-start)
- [Prerequisites](#prerequisites)
- [Architecture](#architecture)
- [License](#license)

---

## Monitoring

Grafana + Prometheus + Loki + Promtail -- full observability stack with log aggregation and metrics dashboards.

| Service | Purpose |
|---------|---------|
| Grafana | Dashboards and visualization |
| Prometheus | Metrics collection and alerting |
| Loki | Log aggregation |
| Promtail | Log shipping agent |

## Media

Jellyfin + *arr stack + qBittorrent -- complete media automation pipeline from search to streaming.

| Service | Purpose |
|---------|---------|
| Jellyfin | Media server and streaming |
| Sonarr | TV series management |
| Radarr | Movie management |
| Bazarr | Subtitle management |
| Prowlarr | Indexer management |
| qBittorrent | Torrent client |

## Productivity

Nextcloud + Paperless + n8n + Mealie + FreshRSS + Actual -- self-hosted office and document management.

| Service | Purpose |
|---------|---------|
| Nextcloud | Cloud storage and collaboration |
| Paperless-ngx | Document management with OCR |
| n8n | Workflow automation |
| Mealie | Recipe management |
| FreshRSS | RSS feed reader |
| Actual | Budget and finance tracking |

## Security

Vaultwarden + Pi-hole + fail2ban -- password management, DNS-level ad blocking, and intrusion prevention.

| Service | Purpose |
|---------|---------|
| Vaultwarden | Bitwarden-compatible password manager |
| Pi-hole | DNS sinkhole and ad blocker |
| fail2ban | Intrusion prevention |

## Dev Tools

Gitea + Supabase + Code Server + Hoppscotch -- self-hosted development environment.

| Service | Purpose |
|---------|---------|
| Gitea | Lightweight Git hosting |
| Supabase | PostgreSQL backend (Auth, Storage, Realtime) |
| Code Server | VS Code in the browser |
| Hoppscotch | API testing and development |

## Smart Home

Home Assistant -- home automation with full local control.

| Service | Purpose |
|---------|---------|
| Home Assistant | Home automation platform |

## Reverse Proxy

Nginx Proxy Manager + Cloudflare Tunnel -- SSL termination and secure remote access without exposing ports.

## Backup

Restic + rclone -- encrypted incremental backups to S3-compatible storage or Hetzner Storage Box.

---

## Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/juliusjoska/docker-homelab-templates.git
cd docker-homelab-templates

# 2. Pick a stack
cd monitoring/

# 3. Copy and configure environment variables
cp .env.example .env
nano .env

# 4. Start the stack
docker compose up -d
```

## Prerequisites

- Docker Engine 24+
- Docker Compose v2
- Linux host (Ubuntu/Debian recommended)
- Minimum 2 GB RAM per stack

## Architecture

```
                      Internet
                         |
                [Reverse Proxy]
              Nginx Proxy Manager
               + Cloudflare Tunnel
                         |
          +--------------+--------------+----------+
          |              |              |          |
    [Monitoring]    [Media]      [Productivity]  [Dev]
     Grafana        Jellyfin     Nextcloud       Gitea
     Prometheus     Sonarr       Paperless       Supabase
     Loki           Radarr       n8n             Code Server
     Promtail       Bazarr       Mealie          Hoppscotch
                    Prowlarr     FreshRSS
                    qBittorrent  Actual
```

## Security Notes

- All passwords and tokens belong in `.env` files (never in compose files)
- `.env` files are listed in `.gitignore`
- Always use a reverse proxy with SSL for external access
- Regular backups recommended (see `backup/`)

## License

[MIT](LICENSE)

---

Made by [Julius Joska](https://github.com/juliusjoska) | [ajtak.it](https://ajtak.it)
