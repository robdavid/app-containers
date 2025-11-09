#!/bin/bash
DIR=$(dirname $0)

link() {
    if ! [ -e "$1" ]; then
        ln -s "$1" "$2"
    fi
}

# mkdir --parents $HOME/distros/browserbox
# link $HOME/Downloads $HOME/distros/browserbox/Downloads
distrobox create --name browserbox --image localhost/browserbox/fedora:42

# Export distrobox applications. Note the following places StartWMClass lines in
# the .desktop files in the wrong location - at or near the end of the file,
# rather than within the [Desktop Entry]. It also gets the values wrong for some
# of these entries. These can be fixed with the menu editor
# (org.bluesabre.MenuLibre), advanced tab. The values which work are:

# brave:     brave-browser
# firefox:   firefox (or possibly org.mozilla.firefox) 
# kasts:     org.kde.kasts
# keepassxc: org.keepassxc.KeePassXC

# Additionally, there are two brave .desktop files created in 
# ~/.local/share/applications. Delete the one named
# browserbox-com.brave.Browser.desktop
distrobox-enter browserbox -- distrobox-export --app firefox
distrobox-enter browserbox -- distrobox-export --app brave-browser
distrobox-enter browserbox -- distrobox-export --app keepassxc
distrobox-enter browserbox -- distrobox-export --app kasts
