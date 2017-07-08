# dotfiles

```
docker run \
  -v $PWD:/local \
  -v $HOME/.ssh:/root/.ssh \
  -v $HOME/.gitconfig:/root/.gitconfig \
  -v /etc/group:/etc/group:ro \
  -v /etc/passwd:/etc/passwd:ro \
  --user=$USER \
  -it natb1/dotfiles
```
