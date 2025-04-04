#!/bin/bash

clear

setenforce 0 >> /dev/null 2>&1

export DEBIAN_FRONTEND=noninteractive

apt install -y language-pack-gnome-pt
apt install -y language-pack-gnome-pt-base
apt install -y language-pack-pt
apt install -y language-pack-pt-base

dpkg-reconfigure tzdata 

apt-get install -y \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libbz2-dev \
    libsqlite3-dev \
    libffi-dev \
    liblzma-dev \
    uuid-dev \
    libxml2-dev \
    libxmlsec1-dev \
    build-essential \
    curl \
    wget \
    git \
    vim \
    nano \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    net-tools \
    zip \
    cgroup-tools \
    tar \
    ubuntu-standard \
    dnsutils