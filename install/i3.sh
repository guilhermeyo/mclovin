sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev \
  libev-dev libxcb-xkb-dev libxcb-cursor-dev libxcb-xinerama0-dev \
  libxcb-xrm-dev libxcb-randr0-dev libxcb-xrm-dev libstartup-notification0-dev \
  libxcb-shape0-dev

I3_VERSION="4.23"
git clone https://github.com/i3/i3.git /tmp/i3
git checkout "${I3_VERSION}"
cd i3/tmp
make
sudo make install
