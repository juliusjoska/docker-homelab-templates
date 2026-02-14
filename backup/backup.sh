#!/bin/sh
# Restic backup skript
# Spousten automaticky kazdych BACKUP_INTERVAL sekund

set -e

echo "[$(date)] Zacinam zalohu..."

# Inicializace repozitare (ignoruje chybu pokud uz existuje)
restic init 2>/dev/null || true

# Zaloha
restic backup /data \
  --exclude="*.tmp" \
  --exclude="*.log" \
  --exclude="node_modules" \
  --exclude=".git" \
  --verbose

# Cisteni starych zaloh (ponechat 7 dennich, 4 tydenni, 6 mesicnich)
restic forget \
  --keep-daily 7 \
  --keep-weekly 4 \
  --keep-monthly 6 \
  --prune

echo "[$(date)] Zaloha dokoncena."
