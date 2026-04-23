# Self-Hosted AI Chatbot

[![Ollama](https://img.shields.io/badge/Ollama-LLM%20Runtime-000000?logo=ollama)](https://ollama.ai)
[![Open WebUI](https://img.shields.io/badge/Open%20WebUI-Chat%20Interface-6B46C1)](https://github.com/open-webui/open-webui)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)](https://www.docker.com)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![DSGVO](https://img.shields.io/badge/DSGVO-konform-brightgreen)]()

> DSGVO-konformer KI-Chatbot mit Docker + Ollama — keine Cloud-Abhängigkeit, volle Kontrolle über deine Daten.

GDPR-compliant AI chatbot with Docker + Ollama — no cloud dependency, full data control.

---

## Screenshots

### Docker Setup

![Docker Overview](screenshots/docker-overview.png)
*Alle Services als Docker Compose Stack — Nginx, Open WebUI, Ollama, Redis.*

### Architektur

![Architecture](screenshots/chatbot-architecture.png)
*Reverse Proxy → Open WebUI → Ollama — clean & scalable.*

### Setup Script

![Setup Script](screenshots/setup-script.png)
*Einmaliges Setup mit dem automatisierten Script — GPU-Erkennung inklusive.*

---

## Warum selbstgehostet?

| Vorteil | Beschreibung |
|---------|-------------|
| DSGVO-konform | Keine Daten verlassen deinen Server |
| Keine monatlichen Kosten | Einmalige Hardware, kein SaaS-Abo |
| Volle Kontrolle | Modell, Prompts, Daten — alles in deiner Hand |
| Offline verfügbar | Auch ohne Internetverbindung nutzbar |
| Datenschutz | Kein Teilen mit Drittanbietern |

---

## Quick Start (3 Befehle)

```bash
git clone https://github.com/ceeceeceecee/self-hosted-ai-chatbot.git
cd self-hosted-ai-chatbot
cp .env.example .env && docker compose up -d
```

Dann: `http://localhost:3000` öffnen und loslegen.

### GPU-Variante (NVIDIA)

```bash
docker compose -f docker-compose.gpu.yml up -d
```

---

## Unterstützte Modelle

| Modell | RAM | Use Case |
|--------|-----|----------|
| Llama 3.1 8B | 8 GB | Allround, allgemeine Fragen |
| Mistral 7B | 8 GB | Schnell, effizient |
| Gemma 2 9B | 8 GB | Stark bei Logik |
| Llama 3.1 70B | 48 GB | Komplexe Aufgaben, lange Texte |
| Mixtral 8x7B | 48 GB | MoE-Architektur, vielseitig |
| Phi-3 Mini | 4 GB | Leichtgewichtig, schwache Hardware |

Siehe [docs/models.md](docs/models.md) für Details.

---

## Architektur

```
+------------------+     +------------------+     +------------------+
|   Nginx (80/443) | --> |   Open WebUI     | --> |     Ollama       |
|   Reverse Proxy  |     |   Chat-Oberfläche |     |   LLM Runtime    |
+------------------+     +------------------+     +------------------+
                                  |
                           +-------------+
                           |    Redis    |
                           |   (Cache)   |
                           +-------------+
```

---

## Tech Stack

- **Ollama** — LLM Runtime (lokal)
- **Open WebUI** — Chat-Interface (ChatGPT-Alternative)
- **Nginx** — Reverse Proxy & SSL
- **Redis** — Session-Caching
- **Docker Compose** — Deployment

---

## Roadmap

- [ ] RAG mit lokalen Dokumenten
- [ ] LDAP / SSO Integration
- [ ] Multi-User mit Rollen
- [ ] Auto-Scaling mit GPU-Scheduling

---

## Contributing

1. Fork → Feature-Branch → Commit → Push → Pull Request

---

## Lizenz

[MIT](LICENSE) — frei nutzbar.

## Author

[ceeceeceecee](https://github.com/ceeceeceecee)

## Weitere Projekte

- [n8n Business Automation](https://github.com/ceeceeceecee/n8n-business-automation) — Workflow-Templates
- [AI Document Analyzer](https://github.com/ceeceeceecee/ai-document-analyzer) — Dokumentenanalyse
