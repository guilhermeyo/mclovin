CURRENT_DIR_TMP=$(pwd)

sudo apt install -y \
  cmake cmake-data libcairo2-dev libxcb1-dev libxcb-util0-dev \
  libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto \
  libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev \
  libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev \
  libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

POLYBAR_VERSION="3.6.3"
git clone --branch $POLYBAR_VERSION --recursive https://github.com/polybar/polybar.git /tmp/polybar
cd /tmp/polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
cd "${CURRENT_DIR_TMP}"
rm -rf /tmp/polybar
