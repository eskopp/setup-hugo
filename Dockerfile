FROM alpine:latest

# Abhängigkeiten installieren
RUN apk add --no-cache bash curl tar

# Arbeitsverzeichnis festlegen
WORKDIR /app

# Bash-Skript kopieren
COPY setup_hugo.sh .

# Skript ausführbar machen
RUN chmod +x setup_hugo.sh

# Entry Point
ENTRYPOINT ["./setup_hugo.sh"]
