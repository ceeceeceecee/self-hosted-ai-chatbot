#!/bin/bash
# ============================================
# Self-Hosted AI Chatbot — Automatisches Setup
# ============================================

set -e

echo "================================"
echo "  AI Chatbot Setup"
echo "================================"

# Prüfe Docker
if ! command -v docker &> /dev/null; then
    echo "[FEHLER] Docker ist nicht installiert."
    echo "Installiere Docker: https://docs.docker.com/get-docker/"
    exit 1
fi

# Prüfe Docker Compose
if ! docker compose version &> /dev/null; then
    echo "[FEHLER] Docker Compose ist nicht verfügbar."
    exit 1
fi

echo "[OK] Docker und Docker Compose gefunden."

# .env erstellen falls nicht vorhanden
if [ ! -f .env ]; then
    cp .env.example .env
    echo "[OK] .env.example nach .env kopiert."
    echo "[!] Bitte .env anpassen (mindestens SECRET_KEY ändern)."
else
    echo "[OK] .env existiert bereits."
fi

# GPU-Support prüfen
GPU_AVAILABLE=false
if command -v nvidia-smi &> /dev/null; then
    echo "[OK] NVIDIA GPU erkannt."
    GPU_AVAILABLE=true
else
    echo "[INFO] Keine NVIDIA GPU gefunden. CPU-Modus wird verwendet."
fi

# Container starten
if [ "$GPU_AVAILABLE" = true ]; then
    echo "[START] Starte Container mit GPU-Unterstützung..."
    docker compose -f docker-compose.gpu.yml up -d
else
    echo "[START] Starte Container (CPU-Modus)..."
    docker compose up -d
fi

echo "[WARTEN] Warte bis Ollama bereit ist..."
until docker exec chatbot-ollama curl -sf http://localhost:11434 > /dev/null 2>&1; do
    sleep 2
done

# Standard-Modell herunterladen
DEFAULT_MODEL=${DEFAULT_MODEL:-llama3.1}
echo "[DOWNLOAD] Lade Modell $DEFAULT_MODEL herunter (kann dauern)..."
docker exec chatbot-ollama ollama pull "$DEFAULT_MODEL"

echo ""
echo "================================"
echo "  Setup abgeschlossen!"
echo "================================"
echo ""
echo "  Chatbot erreichbar unter: http://localhost:3000"
echo "  Modell: $DEFAULT_MODEL"
echo ""
echo "  Nächste Schritte:"
echo "  1. http://localhost:3000 öffnen"
echo "  2. Account erstellen"
echo "  3. Loslegen!"
echo ""
