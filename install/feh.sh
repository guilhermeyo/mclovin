sudo apt install -y libx11-dev libimlib2-dev libxinerama-dev libxt-dev

FEH_VERSION="3.10.2"
git clone https://github.com/derf/feh.git /tmp/feh
cd /tmp/feh
git checkout "${FEH_VERSION}"
make
sudo make install app=1
cd -
rm /tmp/feh
