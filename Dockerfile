FROM ubuntu:20.04

ARG APPNAME=bmua

# set X11 server address
ENV DISPLAY=host.docker.internal:0
ENV DEBIAN_FRONTEND=noninteractive

# install development tools
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    acpica-tools \
    gcc-mingw-w64-x86-64 \
    qemu-system-x86 \
    qemu-utils \
    xauth \
    ovmf \
    qemu-system-gui \
    dosfstools \
    git \
    sudo \
    python3-distutils \
 && apt-get clean -y \
 && rm -rf /var/lib/apt/lists

USER root
WORKDIR /root/${APPNAME}

# add ~/osbook/devenv to PATH
# ENV PATH="/home/${USERNAME}/osbook/devenv:${PATH}"


# override startup command, taken from VSCode Devcontainer logs
CMD ["/bin/sh", "-c", "echo Container started ; trap \"exit 0\" 15; while sleep 1 & wait $!; do :; done"]