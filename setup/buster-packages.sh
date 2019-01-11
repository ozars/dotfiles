#!/bin/sh

apt-get update
apt-get install --install-recommends -y \
  apt-transport-https ca-certificates curl gnupg2 software-properties-common

echo "Enabling docker repo: https://docs.docker.com/install/linux/docker-ce/debian/"
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

echo "Enabling node repo: https://github.com/nodesource/distributions#manual-installation"
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

cat > /etc/apt/sources.list <<EOL
deb http://deb.debian.org/debian/ buster main contrib non-free
# deb-src http://deb.debian.org/debian/ buster main contrib non-free

deb http://security.debian.org/debian-security buster/updates main contrib non-free
# deb-src http://security.debian.org/debian-security buster/updates main contrib non-free

deb http://deb.debian.org/debian/ sid main
# deb-src http://deb.debian.org/debian/ sid main

deb [arch=amd64] https://download.docker.com/linux/debian buster stable
# deb-src [arch=amd64] https://download.docker.com/linux/debian buster stable

deb https://deb.nodesource.com/node_8.x buster main
# deb-src https://deb.nodesource.com/node_8.x buster main
EOL

cat > /etc/apt/preferences <<EOL
Package: *
Pin: release o=Debian,a=testing,l=Debian,c=contrib
Pin-Priority: 100

Package: *
Pin: release o=Debian,a=testing,l=Debian,c=non-free
Pin-Priority: 100

Package: *
Pin: release o=Debian,a=unstable,l=Debian
Pin-Priority: -1

Package: universal-ctags
Pin: release o=Debian,a=unstable,l=Debian
Pin-Priority: 1
EOL

apt-get update

apt-get install --install-recommends -y \
  vim-gtk3 zsh tmux \
  linux-headers-amd64 \
  build-essential autotools-dev autoconf pkg-config texinfo libtool gettext \
  git cmake doxygen \
  python python-pip \
  python3 python3-pip \
  clang clang-tools clang-tidy \
  universal-ctags \
  rustc rust-src \
  golang \
  default-jdk default-jre \
  ssh dnsutils fzf htop iotop remmina tshark

apt-get install -y docker-ce nodejs
