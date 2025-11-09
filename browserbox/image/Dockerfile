ARG IMG=quay.io/fedora/fedora:42
FROM $IMG as build
RUN dnf -y install golang git
RUN mkdir /workspace && cd /workspace && \
    git clone https://github.com/robdavid/dropgrp.git && \
    cd dropgrp && go test && go build -o dropgrp && \
    echo $PWD && ls -al
FROM $IMG
# Turns out dropgrp won't help us. If builds take too long, remove the build
# image above also. 
# COPY --from=build /workspace/dropgrp/dropgrp /usr/local/bin/
RUN chmod 4755 /usr/local/bin/dropgrp
RUN dnf -y install firefox keepassxc qadwaitadecorations-qt5 xdg-desktop-portal-gnome
RUN dnf -y install dnf-plugins-core
RUN dnf -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
RUN dnf -y install brave-browser
RUN dnf -y install kasts kf6-qqc2-desktop-style plasma-breeze-qt6 vlc

# RPM fusion non-free stuff
RUN dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf -y install ffmpeg-libs --allowerasing

# Add custom certificate. Comment out if not required.
COPY myca.crt myca.crt
RUN trust anchor --store myca.crt
