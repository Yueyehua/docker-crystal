FROM debian:latest
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"

ENV DEBIAN_FRONTEND=noninteractive

# Update repository and install deps
RUN \
  apt-get -qq update && \
  apt-get -qq dist-upgrade -y && \
  apt-get -qq -y install \
    apt-transport-https \
    automake \
    build-essential \
    dirmngr \
    git-core \
    libcrypto++-dev \
    libffi-dev \
    libgmp-dev \
    libreadline6-dev \
    libssl1.0-dev \
    libxml2-dev \
    libyaml-dev \
    libz-dev

# Setup crystal repository
RUN \
  apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54 && \
  echo "deb https://dist.crystal-lang.org/apt crystal main" \
    > /etc/apt/sources.list.d/crystal.list && \
  apt-get update

# Install crystal and dependencies
RUN \
  apt-get -qq -y install crystal && \
  apt-get -qq clean autoclean && \
  rm -rf /var/lib/apt/*

# Build and install icr
RUN \
  git clone https://github.com/crystal-community/icr.git /tmp/icr && \
  cd /tmp/icr && \
  make && \
  make install && \
  rm -rf /tmp/icr

CMD [ "icr" ]
