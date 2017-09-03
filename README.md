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

## run
```
./run
```

## build
```
docker build -t natb1/dotfiles .
```
