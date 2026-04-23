#!/bin/bash
# ============================================
# Self-Hosted AI Chatbot — Update-Skript
# ============================================

set -e

BACKUP_DIR="./backups/$(date +%Y%m%d_%H%M%S)"
echo "================================"
echo "  AI Chatbot Update"
echo "================================"

# Backup erstellen
echo "[BACKUP] Erstelle Backup in $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

# Container stoppen
echo "[STOP] Stoppe Container..."
docker compose down 2>/dev/null || docker compose -f docker-compose.gpu.yml down 2>/dev/null

# Daten-Backup (Docker-Volumes)
echo "[BACKUP] Sichere Ollama-Daten..."
docker run --rm -v chatbot_ollama_data:/data -v "$(pwd)/$BACKUP_DIR":/backup alpine tar czf /backup/ollama_data.tar.gz -C /data .

echo "[BACKUP] Sichere WebUI-Daten..."
docker run --rm -v chatbot_webui_data:/data -v "$(pwd)/$BACKUP_DIR":/backup alpine tar czf /backup/webui_data.tar.gz -C /data .

# Images aktualisieren
echo "[UPDATE] Ziehe neue Images..."
docker compose pull
# GPU-Variante falls vorhanden
[ -f docker-compose.gpu.yml ] && docker compose -f docker-compose.gpu.yml pull 2>/dev/null || true

# Container starten
echo "[START] Starte Container..."
if [ -f docker-compose.gpu.yml ] && command -v nvidia-smi &> /dev/null; then
    docker compose -f docker-compose.gpu.yml up -d
else
    docker compose up -d
fi

# Aufräumen (alte Images)
echo "[CLEANUP] Entferne ungenutzte Images..."
docker image prune -f

echo ""
echo "================================"
echo "  Update abgeschlossen!"
echo "================================"
echo "  Backup: $BACKUP_DIR"
echo "  Chatbot: http://localhost:3000"
echo ""
