FROM archlinux:base-devel AS base
RUN pacman -Syu --noconfirm && pacman -S openssh git ansible neovim --noconfirm

#FROM base AS arch
#RUN useradd -m -G wheel voldv -p test
#USER voldv
#WORKDIR /home/voldv

FROM base
COPY . .
CMD ["sh", "-c", "ansible-playbook -t postinstall local.yml"]
CMD ["bash"]
