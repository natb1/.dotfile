FROM ubuntu:xenial

RUN apt-get update \
  && apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
  && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

RUN add-apt-repository ppa:neovim-ppa/stable

RUN apt-get update \
  && apt-get install -yq \
    docker-ce \
    zsh \
    neovim \
    git

ADD . /root
WORKDIR /local

CMD nvim
