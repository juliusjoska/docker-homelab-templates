# Docker Homelab Templates

Sbirka Docker Compose sablon pro self-hosted homelab. Kazda slozka obsahuje `docker-compose.yml` a `.env.example` s popisem konfigurace.

**A collection of Docker Compose templates for self-hosted homelab setups. Each folder contains a `docker-compose.yml` and `.env.example` with configuration details.**

---

## Struktura / Structure

```
monitoring/          Grafana + Prometheus + Loki + Promtail
media/               Jellyfin + Sonarr + Radarr + Prowlarr + qBittorrent
productivity/        Nextcloud + Paperless-ngx + Vaultwarden + Uptime Kuma
reverse-proxy/       Nginx Proxy Manager + Cloudflare Tunnel
backup/              Restic + rclone na S3/Storage Box
```

## Pouziti / Usage

```bash
# 1. Vyberte stack
cd monitoring/

# 2. Zkopirujte a upravte .env
cp .env.example .env
nano .env

# 3. Spustte
docker compose up -d
```

## Pozadavky / Requirements

- Docker Engine 24+
- Docker Compose v2
- Linux host (doporuceno Ubuntu/Debian)
- Min. 2 GB RAM na stack

## Architektura / Architecture

```
                    Internet
                       |
              [Reverse Proxy]
              (Nginx Proxy Manager)
                       |
        +--------------+--------------+
        |              |              |
  [Monitoring]    [Media]      [Productivity]
  Grafana         Jellyfin     Nextcloud
  Prometheus      Sonarr       Paperless
  Loki            Radarr       Vaultwarden
  Promtail        Prowlarr     Uptime Kuma
                  qBittorrent
```

Kazdy stack je nezavisly a muze bezet samostatne.

## Bezpecnost / Security

- Vsechna hesla a tokeny v `.env` (nikdy v composu)
- `.env` soubory jsou v `.gitignore`
- Doporuceno: reverse proxy s SSL pro vnejsi pristup
- Doporuceno: pravidelne zalohy (viz `backup/`)

## Licence

MIT

---

Vytvoreno s [ajtak.it](https://ajtak.it) | [juliusjoska.cz](https://juliusjoska.cz)
