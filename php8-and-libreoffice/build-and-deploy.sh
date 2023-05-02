#!/bin/sh

set -e

docker build -t lfglopes/php-and-libreoffice:latest .
docker push lfglopes/php-and-libreoffice:latest