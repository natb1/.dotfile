FROM alpine:3.7
 
RUN apk add --no-cache zsh curl ca-certificates
RUN touch /root/.zshrc
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || echo

# instead of the main kubectl distribution, use the gcloud distribution
#RUN curl -LO curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
#    && chmod +x ./kubectl \
#    && mv ./kubectl /usr/local/bin/kubectl
RUN apk add --no-cache python curl ca-certificates
RUN curl -LO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-185.0.0-linux-x86_64.tar.gz \
    && tar -xzf google-cloud-sdk-185.0.0-linux-x86_64.tar.gz \
    && ./google-cloud-sdk/install.sh -q --rc-path /root/.zshrc \
    && /google-cloud-sdk/bin/gcloud components install kubectl \
    && /google-cloud-sdk/bin/gcloud components update

RUN apk add --no-cache \
    openssh-client \
    torsocks \
    sshfs \
    conntrack-tools \
    socat \
    sudo \
    git \
    ca-certificates \
    bash \
    python3
RUN git clone https://github.com/datawire/telepresence.git \
    && env PREFIX=/usr/local telepresence/install.sh \
    && rm -rf telepresence

RUN apk add --no-cache \
  curl \
  ca-certificates \
  neovim \
  neovim-doc \
  python \
  py2-pip \
  python2-dev \
  xclip \
  gcc \
  musl-dev
RUN pip2 install websocket-client sexpdata neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ENV sbt_version 1.1.0
ENV sbt_home /usr/local/sbt
ENV PATH ${PATH}:${sbt_home}/bin
RUN apk add --no-cache \
    bash \
    openjdk8 \
    wget \
    ncurses
RUN mkdir -p "$sbt_home" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v$sbt_version/sbt-$sbt_version.tgz" | tar xz -C $sbt_home --strip-components=1

RUN apk add --no-cache \
    docker \
    git \
    bash \
    python3 \
    python3-dev \
    curl \
    ca-certificates

ADD ./.config/nvim/init.vim /root/.config/nvim/init.vim
RUN ln -s /root/.config/nvim /root/.vim
RUN ln -s /root/.config/nvim/init.vim /root/.vimr
RUN nvim +PlugInstall +qall
ADD .sbt/1.0/plugins/plugins.sbt /root/.sbt/1.0/plugins/plugins.sbt

CMD nvim
