# dotfiles

```
docker run --rm \
  -v $PWD:/local \
  -v $HOME/.ssh:/root/.ssh \
  -v $HOME/.gitconfig:/root/.gitconfig \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -it natb1/dotfiles
```
