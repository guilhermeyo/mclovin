sudo apt install -y meson ninja-build cmake libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-shape0-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcomposite-dev libx11-xcb-dev libxrandr-dev libx11-dev libev-dev uthash-dev libconfig-dev libdrm-dev git
git clone https://github.com/yshui/picom.git /tmp/picom
cd /tmp/picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd -
sudo rm -r /tmp/picom
