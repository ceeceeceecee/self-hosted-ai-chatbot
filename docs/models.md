# Modell-Übersicht

## Empfohlene Modelle nach Hardware

### Leichtgewichtig (4-8 GB RAM)

| Modell | Parameter | RAM | Größe | Stärke |
|--------|-----------|-----|-------|--------|
| Phi-3 Mini | 3.8B | 4 GB | 2.3 GB | Logik, Code |
| Gemma 2 2B | 2B | 4 GB | 1.6 GB | Schnell, kompakt |
| Qwen 2.5 1.5B | 1.5B | 2 GB | 1 GB | Minimal-Ressourcen |

### Mittelklasse (8-16 GB RAM)

| Modell | Parameter | RAM | Größe | Stärke |
|--------|-----------|-----|-------|--------|
| Llama 3.1 8B | 8B | 8 GB | 4.7 GB | Allround |
| Mistral 7B | 7B | 8 GB | 4.1 GB | Effizient, schnell |
| Gemma 2 9B | 9B | 8 GB | 5.5 GB | Logik, Mathematik |

### Premium (32-64 GB RAM / GPU)

| Modell | Parameter | RAM | Größe | Stärke |
|--------|-----------|-----|-------|--------|
| Llama 3.1 70B | 70B | 48 GB | 40 GB | Komplexe Aufgaben |
| Mixtral 8x7B | 47B | 48 GB | 26 GB | Vielseitig, MoE |
| Qwen 2.5 32B | 32B | 24 GB | 19 GB | DE/EN stark |

## Embedding-Modelle (für RAG)

| Modell | RAM | Größe | Empfehlung |
|--------|-----|-------|------------|
| nomic-embed-text | 1 GB | 274 MB | Standard, gut für DE/EN |
| mxbai-embed-large | 2 GB | 670 MB | Höhere Qualität |
| all-MiniLM-L6-v2 | 1 GB | 80 MB | Leichtgewichtig |

## Use Cases

### Kunden-Support
- Empfohlen: Llama 3.1 8B oder Mistral 7B
- Embedding: nomic-embed-text
- System-Prompt: Freundlich, professionell, Lösungsorientiert

### Wissensdatenbank (RAG)
- Empfohlen: Gemma 2 9B oder Qwen 2.5 7B
- Embedding: mxbai-embed-large
- System-Prompt: Präzise, faktenbasiert

### Code-Hilfe
- Empfohlen: Llama 3.1 8B oder Phi-3
- System-Prompt: Technisch, mit Code-Beispielen

## Modell herunterladen

```bash
# Im laufenden Container
docker exec chatbot-ollama ollama pull llama3.1
docker exec chatbot-ollama ollama pull mistral
docker exec chatbot-ollama ollama pull nomic-embed-text
```

## Modell wechseln

In Open WebUI unter **Einstellungen** → **Modelle** das gewünschte Modell auswählen, oder in `.env`:
```env
DEFAULT_MODEL=mistral
```
