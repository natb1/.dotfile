# dotfiles

```
docker run --rm \
  --net=host \
  -v $PWD:$PWD \
  -v $HOME/.ssh:/root/.ssh \
  -v $HOME/.gitconfig:/root/.gitconfig \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w $PWD \
  -it natb1/dotfiles
```
