cat <<EOF >~/.local/share/applications/WhatsApp.desktop
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=brave-browser --app="https://web.whatsapp.com" --name=WhatsApp
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/mclovin/applications/icons/WhatsApp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
