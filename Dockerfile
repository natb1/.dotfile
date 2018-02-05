FROM alpine:3.7

RUN apk add --no-cache \
  neovim \
  neovim-doc \
  bash \
  zsh \
  python \
  py2-pip \
  python2-dev \
  python3 \
  python3-dev \
  openjdk8 \
  docker \
  curl \
  ca-certificates \
  git \
  xclip \
  gcc \
  musl-dev
 
ENV sbt_version 1.1.0
ENV sbt_home /usr/local/sbt
ENV PATH ${PATH}:${sbt_home}/bin
RUN apk add --no-cache --update bash wget && \
    mkdir -p "$sbt_home" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v$sbt_version/sbt-$sbt_version.tgz" | tar xz -C $sbt_home --strip-components=1 && \
    apk del wget && \
    sbt update

RUN touch /root/.zshrc
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || echo

RUN curl -LO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-185.0.0-linux-x86_64.tar.gz \
    && tar -xzf google-cloud-sdk-185.0.0-linux-x86_64.tar.gz \
    && ./google-cloud-sdk/install.sh -q --rc-path /root/.zshrc \
    && /google-cloud-sdk/bin/gcloud components install kubectl \
    && /google-cloud-sdk/bin/gcloud components update

# instead of the main kubectl distribution, use the gcloud distribution
#RUN curl -LO curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
#    && chmod +x ./kubectl \
#    && mv ./kubectl /usr/local/bin/kubectl

RUN apk add --no-cache \
    openssh-client \
    torsocks \
    sshfs \
    conntrack-tools \
    socat \
    sudo \
    && git clone https://github.com/datawire/telepresence.git \
    && env PREFIX=/usr/local telepresence/install.sh \
    && rm -rf telepresence

RUN pip2 install websocket-client sexpdata neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD ./.config/nvim/init.vim /root/.config/nvim/init.vim
RUN ln -s /root/.config/nvim /root/.vim
RUN ln -s /root/.config/nvim/init.vim /root/.vimr
RUN nvim +PlugInstall +qall

CMD nvim
