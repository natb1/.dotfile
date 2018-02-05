# dotfiles

Nate's personal dockerized development environment.

## OSX
To get an X11 server:
```
brew install socat
brew cask install xquartz
```

## run
CD to working directory, then:
```
$PATH_TO_DOTFILES/run
```

## build
```
docker build -t natb1/dotfiles .
```
