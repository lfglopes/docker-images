#!/bin/sh

set -e

docker build -t lfglopes/php-and-fabric-builder:latest .
docker push lfglopes/php-and-fabric-builder:latest