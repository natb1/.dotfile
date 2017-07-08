# dotfiles

```
docker run --rm \
  -v $PWD:/local \
  -v $HOME/.ssh:/root/.ssh \
  -v $HOME/.gitconfig:/root/.gitconfig \
  -it natb1/dotfiles
```
