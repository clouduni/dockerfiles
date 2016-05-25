#!/bin/sh

img_name=ppc64le/nodejs

docker build --no-cache=true --rm=true -t ${img_name}:6.2 .
docker build -t ${img_name}:latest .
