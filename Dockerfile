FROM ubuntu:xenial

RUN apt-get update && apt-get install -yq software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable

RUN apt-get update \
  && apt-get install -yq \
    zsh \
    neovim \
    git

ADD . /root
WORKDIR /local

CMD nvim
