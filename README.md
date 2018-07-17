# dotfiles

Nate's personal dockerized development environment.

## OSX
To get an X11 server:
```
brew install socat
brew cask install xquartz
```

## run
Initialize configuration/cache "volumes" (only neeed to do this once):
```
mkdir -p ~/.ssh ~/.gitconfig ~/.kube ~/.docker ~/.config/gcloud ~/.ivy2 ~/.cache ~/.coursier
```
CD to working directory, then:
```
$PATH_TO_DOTFILES/run
```

## build
```
docker build -t natb1/dotfiles .
```
