FROM quay.io/fedora/fedora:41
RUN dnf -y install firefox keepassxc adwaita-qt5 qadwaitadecorations-qt5
RUN dnf -y install dnf-plugins-core
RUN dnf -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
RUN dnf -y install brave-browser
RUN dnf -y install kasts kf6-qqc2-desktop-style plasma-breeze-qt6 vlc
COPY runkp.sh /usr/local/bin/runkp.sh
COPY runff.sh /usr/local/bin/runff.sh
RUN chmod +x /usr/local/bin/*.sh

# RPM fusion non-free stuff
RUN dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf -y install ffmpeg-libs --allowerasing

# Add custom certificate. Comment out if not required.
COPY myca.crt myca.crt
RUN trust anchor --store myca.crt
