cat <<EOF >~/.local/share/applications/Firefox-Dev.desktop
[Desktop Entry]
Version=1.0
Type=Application
Exec=/usr/local/bin/firefox-dev
Terminal=false
X-MultipleArgs=false
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/chrome;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
StartupNotify=true
Name=Firefox Developer Eedition
Comment=Firefox Browser Developer Edition
EOF
