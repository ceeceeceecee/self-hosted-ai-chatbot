# Anpassung & Branding

## System-Prompts anpassen

System-Prompts definieren das Verhalten des Chatbots. In Open WebUI konfigurierbar.

### Firmen-Assistent

```
Du bist der digitale Assistent von [Firmenname].
Antworte immer auf Deutsch, professionell und freundlich.
Du kennst unsere Produkte und Dienstleistungen:
- [Produkt 1]: [Kurzbeschreibung]
- [Produkt 2]: [Kurzbeschreibung]

Bei Fragen, die du nicht beantworten kannst, verweise an info@example.com.
```

### Technischer Support

```
Du bist der IT-Support-Assistent von [Firmenname].
Hilfe bei:
- Software-Problemen
- Hardware-Fehlern
- Netzwerk-Themen

Gehe Schritt für Schritt vor. Frage nach, wenn etwas unklar ist.
Erstelle keine Tickets — verweise an support@example.com.
```

## Eigene Modelle nutzen

### Aus Hugging Face

1. Modell im GGUF-Format herunterladen
2. In das Ollama-Verzeichnis kopieren:

```bash
docker cp model.gguf chatbot-ollama:/root/.ollama/
```

3. Modelfile erstellen:

```
FROM ./model.gguf
PARAMETER temperature 0.7
SYSTEM "Du bist ein hilfreicher Assistent."
```

4. Modell in Ollama registrieren:

```bash
docker exec chatbot-ollama ollama create mein-modell -f Modelfile
```

## Branding

### Logo & Farben

In Open WebUI unter **Admin → Einstellungen → UI**:
- Logo hochladen
- Primärfarbe anpassen
- Firmennamen setzen

### Willkommensnachricht

```
Willkommen beim [Firmenname] Chatbot!
Ich helfe dir bei Fragen zu unseren Produkten und Dienstleistungen.
```

## Sicherheit

### Rate Limiting

In der Nginx-Konfiguration:

```nginx
limit_req_zone $binary_remote_addr zone=chatbot:10m rate=10r/m;

location / {
    limit_req zone=chatbot burst=20 nodelay;
    proxy_pass http://webui;
}
```

### Content-Filterung

In der Open WebUI-Konfiguration unter **Admin → Sicherheit**:
- Inhalt-Filter aktivieren
- Blocked Words konfigurieren
- Max. Token-Limit setzen
