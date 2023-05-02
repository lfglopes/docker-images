set -e 

docker build --tag 'lfglopes/docker-fabric' .
docker push lfglopes/docker-fabric:latest