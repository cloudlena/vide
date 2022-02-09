FROM docker.io/alpine:latest

RUN adduser --system vide \
  && apk add --no-cache \
  build-base \
  fd \
  git \
  neovim \
  npm \
  ripgrep

USER vide

RUN git clone https://github.com/cloudlena/dotfiles.git ~/dotfiles \
  && mkdir -p ~/.config \
  && ln -s ~/dotfiles/nvim/.config/nvim ~/.config/nvim \
  && nvim --headless -c 'Lazy! install' -c 'TSInstallSync all' -c 'quitall'

WORKDIR /home/vide/src

ENTRYPOINT ["nvim"]
