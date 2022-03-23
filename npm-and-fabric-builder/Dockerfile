FROM node:lts

WORKDIR /tmp

RUN apt-get update && apt-get install -y \
    # SSH & Fabric time
    && apt-get install -y python python-dev python-pip libffi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && npm install npm@latest -g \
    && pip install "fabric<2" requests \
    # Prepare SSH handling
    && mkdir /root/.ssh \
    && chmod 0600 /root/.ssh \
    # Bitbucket.org
    && echo "bitbucket.org,104.192.143.2 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==" >> /root/.ssh/known_hosts

VOLUME ["/app"]
WORKDIR /app