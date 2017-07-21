FROM ubuntu:xenial

RUN apt-get update \
  && apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
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
    git \
    xclip

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD .config/nvim /root/.config/nvim

RUN vim +PlugInstall +qall

ADD . /root

CMD nvim
