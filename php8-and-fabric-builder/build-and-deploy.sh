#!/bin/sh

set -e

# Get PHP version as an argument. If no argument present, use 8.2 as default
PHP_VERSION=${1:-8.2}

docker build --build-arg PHP_VERSION=$PHP_VERSION -t lfglopes/php8-and-fabric-builder:$PHP_VERSION .
docker push lfglopes/php8-and-fabric-builder:$PHP_VERSION


if [ "$PHP_VERSION" = "8.2" ]; then
    docker tag lfglopes/php8-and-fabric-builder:latest lfglopes/php8-and-fabric-builder:8.2
    docker push lfglopes/php8-and-fabric-builder:latest
fi