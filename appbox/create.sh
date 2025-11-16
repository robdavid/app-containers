#!/bin/bash
DIR=$(dirname $0)
BOXNAME=Appbox

distrobox create --name $BOXNAME --image appbox/arch:latest
distrobox-enter $BOXNAME -- /usr/local/bin/install-brave.sh 

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
distrobox-enter $BOXNAME -- distrobox-export --app firefox
distrobox-enter $BOXNAME -- distrobox-export --app brave
distrobox-enter $BOXNAME -- distrobox-export --app keepassxc
distrobox-enter $BOXNAME -- distrobox-export --app kasts
