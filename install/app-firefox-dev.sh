cd /tmp
wget "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" -O Firefox-dev.tar.bz2
sudo tar xjf Firefox-dev.tar.bz2 -C /opt/
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox-dev
rm Firefox-dev.tar.bz2
source $MCLOVIN_PATH/applications/Firefox-Dev.sh
cd -
