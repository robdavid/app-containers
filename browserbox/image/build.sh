#!/bin/bash
DIR=$(dirname $0)
podman build $DIR -t browserbox/fedora:41
