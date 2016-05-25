#!/bin/sh

img_name=ppc64le/r-base

docker build --no-cache=true --rm=true -t ${img_name}:3.2 .
docker build -t ${img_name}:latest .
