#!/bin/bash

# Standardwerte setzen
VERSION="latest"
EXTEND=true

# Argumente auslesen
while [ $# -gt 0 ]; do
  case "$1" in
    --version=*)
      VERSION="${1#*=}"
      ;;
    --extend=*)
      EXTEND="${1#*=}"
      ;;
    *)
      echo "Unbekannter Parameter: $1"
      exit 1
  esac
  shift
done

# Neueste Version ermitteln, falls "latest" gewählt wurde
if [ "$VERSION" = "latest" ]; then
  echo "Abrufen der neuesten Hugo-Version..."
  VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
  if [ -z "$VERSION" ]; then
    echo "Fehler beim Abrufen der neuesten Version."
    exit 1
  fi
  echo "Neueste Version: $VERSION"
fi

# Download-URL basierend auf der Version und dem Extend-Flag erstellen
if [ "$EXTEND" = "true" ]; then
  DOWNLOAD_URL="https://github.com/gohugoio/hugo/releases/download/v$VERSION/hugo_extended_${VERSION}_linux-amd64.tar.gz"
else
  DOWNLOAD_URL="https://github.com/gohugoio/hugo/releases/download/v$VERSION/hugo_${VERSION}_linux-amd64.tar.gz"
fi

echo "Hugo wird von $DOWNLOAD_URL heruntergeladen..."

# Herunterladen und entpacken
curl -L "$DOWNLOAD_URL" -o hugo.tar.gz
if [ $? -ne 0 ]; then
  echo "Fehler beim Herunterladen von Hugo."
  exit 1
fi

tar -xzf hugo.tar.gz -C /usr/local/bin hugo
if [ $? -ne 0 ]; then
  echo "Fehler beim Entpacken von Hugo."
  exit 1
fi

# Berechtigungen setzen und aufräumen
chmod +x /usr/local/bin/hugo
rm -f hugo.tar.gz

echo "Hugo $VERSION wurde erfolgreich installiert."
