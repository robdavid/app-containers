#!/bin/bash
DIR=$(dirname $0)

link() {
    if ! [ -e "$1" ]; then
        ln -s "$1" "$2"
    fi
}

mkdir --parents $HOME/distros/browserbox
link $HOME/Downloads $HOME/distros/browserbox/Downloads
distrobox create --name browserbox --image localhost/browserbox/fedora:41 -H $HOME/distros/browserbox
cp $DIR/applications/*.desktop $HOME/.local/share/applications/

