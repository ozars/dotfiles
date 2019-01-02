FROM debian:testing
MAINTAINER omerfaruko AT gmail DOT com

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-dev \
build-essential autotools-dev git curl gettext locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim-nox tmux zsh
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip
RUN pip3 install --upgrade setuptools pip wheel
RUN pip3 install "python-language-server[all]"
WORKDIR /root
COPY . dotfiles
RUN ln -fs dotfiles/vim .vim && \
    ln -fs dotfiles/vimrc .vimrc && \
    ln -fs dotfiles/envrc .envrc && \
    ln -fs dotfiles/bashrc .bashrc
RUN vim -E -u NONE -S .vimrc +PlugInstall +qall || true
ENTRYPOINT bash -i -c "vim --version; cd dotfiles && vim *; zsh"
