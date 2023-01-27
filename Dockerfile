# sshd on archlinux
#
# VERSION               0.0.1

FROM archlinux:latest

# Update the repositories

RUN	pacman -Syu --noconfirm && pacman -S --noconfirm github-cli tmux git code zsh wget
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz && tar xzvf nvim-linux64.tar.gz

RUN ./nvim-linux64/bin/nvim --version
RUN pwd

WORKDIR /workspace

# Expose tcp port
EXPOSE 6666

# Run nvim server
CMD [ "/nvim-linux64/bin/nvim", "--headless", "--listen",  "0.0.0.0:6666" ]
