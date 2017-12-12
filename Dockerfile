FROM alpine:3.7

RUN apk add --no-cache \
  neovim \
  bash \
  zsh \
  python3 \
  docker \
  curl \
  ca-certificates \
  git \
  xclip

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD .config/nvim /root/.config/nvim

RUN nvim +PlugInstall +qall

RUN curl -LO curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN apk add --no-cache \
    openssh-client \
    torsocks \
    sshfs \
    conntrack-tools \
    && git clone https://github.com/datawire/telepresence.git /opt/telepresence
ENV PATH /opt/telepresence/cli:$PATH

ADD . /root

CMD nvim
