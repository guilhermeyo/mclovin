sudo apt install -y \
  libx11-dev libxinerama-dev libxft-dev \
  libpango1.0-dev libglib2.0-dev libcairo2-dev \
  libgdk-pixbuf2.0-dev libstartup-notification0-dev \
  libxcb-xkb-dev libxcb-xinerama0-dev \
  libxcb-randr0-dev libxcb-icccm4-dev \
  libxcb-util0-dev libxcb-ewmh-dev \
  libxcb-keysyms1-dev libxcb-xrm0 libxcb-xrm-dev flex

ROFI_VERSION="1.7.5"
git clone --branch $ROFI_VERSION --recursive https://github.com/davatorium/rofi.git /tmp/rofi
cd /tmp/rofi
meson setup build
ninja -C build
sudo ninja -C build install
cd -
rm -rf /tmp/rofi
