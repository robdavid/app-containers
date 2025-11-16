FROM docker.io/library/archlinux:latest
ARG USER
ARG USER_COMMENT
ARG UID
ARG GID
RUN pacman -Sy --noconfirm qt6-multimedia-gstreamer pipewire-jack gnome-keyring
RUN pacman -Sy --noconfirm starship kasts libcanberra

# Browser stuff
RUN pacman -Sy --noconfirm ttf-input-nerd
# Alternatives for ttf-font:
# 1) gnu-free-fonts  2) noto-fonts  3) ttf-bitstream-vera  4) ttf-croscore  
# 5) ttf-dejavu  6) ttf-droid  7) ttf-ibm-plex  8) ttf-input
# 9) ttf-input-nerd  10) ttf-liberation  11) ttf-roboto
RUN pacman -Sy --noconfirm xdg-desktop-portal-gnome firefox keepassxc
RUN pacman -Sy --noconfirm --needed base-devel git

# Script to install Brave as normal user
COPY install-brave.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install-brave.sh

# Add custom certificate. Comment out if not required.
COPY myca.crt myca.crt
RUN trust anchor --store myca.crt
