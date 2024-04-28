#!/bin/sh

set -e

docker build -t lfglopes/php8-and-fabric-builder:latest .
docker push lfglopes/php8-and-fabric-builder:latest