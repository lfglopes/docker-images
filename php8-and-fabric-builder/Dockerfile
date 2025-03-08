ARG PHP_VERSION=8.1
FROM php:${PHP_VERSION}-cli
LABEL Author="Luis Lopes <git@luislopes.org>" \
      Description="Container with PHP 8.1, fabric and NPM"

# install all packages in a go
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash \
  && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    unzip \
    iproute2 \
    libzip-dev \
    libxslt1-dev \
    build-essential \
    gettext \
    nodejs \
    git \
    openssh-client \
    python3-pip \
    wget \
    unzip \
    # mysqldump command
    mariadb-client \    
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
  && docker-php-ext-install \
  bcmath \
  gd \
  zip \
  pdo_mysql \
  mysqli \
  fileinfo \
  xsl \
  intl \
  soap \
  opcache

# install composer
COPY install-composer.sh /root/install-composer.sh
RUN sh /root/install-composer.sh

# fabric & final ssh setup
RUN pip install fabric --break-system-packages \
    # Prepare SSH handling
    && mkdir /root/.ssh \
    && chmod 0600 /root/.ssh \
    # Bitbucket.org
    && echo "bitbucket.org,104.192.143.2 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==" >> /root/.ssh/known_hosts

VOLUME ["/app"]
WORKDIR /app
