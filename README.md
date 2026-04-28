# Self Hosted Ai Chatbot

<p align="center">
</p>

![Ollama](https://img.shields.io/badge/Ollama-LLM Runtime-000000?logo=ollama) ![Open WebUI](https://img.shields.io/badge/Open WebUI-Chat UI-6B46C1) ![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker) ![License](https://img.shields.io/badge/License-MIT-blue) ![DSGVO](https://img.shields.io/badge/DSGVO-Konform-brightgreen)

> Selbstgehosteter KI-Chatbot mit Open WebUI und Ollama (DSGVO-konform)

## Overview

Komplett-Lösung für einen selbstgehosteten KI-Chatbot. Kombiniert Ollama (LLM-Runtime) mit Open WebUI (Chat-Interface) und Nginx (Reverse Proxy). DSGVO-konform, kein Cloud-Bezug.

## Features

- 100% self-hosted, kein Cloud-Bezug
- Open WebUI als Chat-Interface
- Ollama als LLM-Runtime
- Nginx Reverse Proxy mit SSL
- GPU-Unterstützung (optional)
- Einfache Setup-Scripte

## Tech Stack

| Tech | Zweck |
|------|-------|
| Ollama | LLM-Runtime |
| Open WebUI | Chat-Interface |
| Nginx | Reverse Proxy |
| Docker Compose | Orchestrierung |

## Quick Start

```bash
docker compose up -d
# Oeffne http://localhost:3000
```

## Screenshots

**System-Architektur**

<img src="screenshots/architecture.png" alt="System-Architektur" width="800">

**Docker Container Übersicht**

<img src="screenshots/docker-overview.png" alt="Docker Container Übersicht" width="800">

**Projekt-Übersicht**

<img src="screenshots/repo-overview.png" alt="Projekt-Übersicht" width="800">

**Setup-Script Ausführung**

<img src="screenshots/setup-script.png" alt="Setup-Script Ausführung" width="800">

**Chatbot Architektur-Detail**

<img src="screenshots/chatbot-architecture.png" alt="Chatbot Architektur-Detail" width="800">

---

## Contributing

Beiträge sind willkommen! Bitte erstelle einen Issue oder Pull Request.

## License

MIT License — siehe [LICENSE](LICENSE).

<p align="center">
</p>