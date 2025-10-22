FROM php:8.2-cli
LABEL Author="Luis Lopes <git@luislopes.org>" \
  Description="Container with PHP 8.2, fabric and NPM"

# install all packages in a go
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash \
  && apt-get update \
  && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  iproute2 \
  libzip-dev \
  libxslt1-dev \
  libicu-dev \
  build-essential \
  nodejs \
  python3-pip \
  git \
  pipx \
  wget \
  unzip \
  # mysqldump command
  mariadb-client \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
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

# Libreoffice converter
RUN apt-get update \
  && apt-get -y -q install python3-pip && \
  apt-get -y -q --no-install-recommends install \
  default-jre \
  libreoffice \
  libreoffice-writer \
  libreoffice-common \
  ure \
  libreoffice-java-common \
  && apt-get -y -q remove libreoffice-gnome \
  && apt -y autoremove \
  && rm -rf /var/lib/apt/lists/*

RUN pipx install unoserver

# install composer
COPY install-composer.sh /root/install-composer.sh
RUN sh /root/install-composer.sh

VOLUME ["/app"]
WORKDIR /app
