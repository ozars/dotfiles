FROM debian:testing
MAINTAINER omerfaruko AT gmail DOT com

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
COPY setup/buster-packages.sh dotfiles/setup/buster-packages.sh
RUN DEBIAN_FRONTEND=noninteractive dotfiles/setup/buster-packages.sh
COPY . dotfiles
RUN DEBIAN_FRONTEND=noninteractive SKIP_GNOME=1 dotfiles/install.sh -nf
EXPOSE 22
