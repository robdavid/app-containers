#!/bin/bash
DIR=$(dirname $0)
podman build $DIR -t appbox/arch:latest "$@"
