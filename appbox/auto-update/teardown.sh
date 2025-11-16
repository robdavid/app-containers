#!/bin/bash
DIR=$(dirname $0)

systemctl --user disable --now app-container-update.timer

for file in $(cd $DIR && echo *.{service,timer}); do
    rm -fv $HOME/.config/systemd/user/$file
done

systemctl --user daemon-reload
