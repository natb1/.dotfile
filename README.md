# dotfiles

## OSX
To get an X11 server:
```
brew install socat
brew cask install xquartz
```
In an xterm:
```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```
Finally:
```
docker run --rm \
  --net=host \
  -v $PWD:$PWD \
  -v $HOME/.ssh:/root/.ssh \
  -v $HOME/.gitconfig:/root/.gitconfig \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DISPLAY=$(ifconfig en0 | grep "inet " | cut -d " " -f 2):0 \
  -e WORKDIR=$PWD \
  -w $PWD \
  -it natb1/dotfiles
```

## build
```
docker build -t natb1/dotfiles .
```
