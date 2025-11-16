#!/bin/bash
DIR=$(dirname $0)

cp $DIR/*.{service,timer} $HOME/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now appbox-update.timer
