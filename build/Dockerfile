FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

ARG username
ARG password
ARG timezone

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN adduser --disabled-login --gecos '' $username
RUN echo $username:$password | chpasswd
RUN adduser $username sudo
RUN adduser $username plugdev

RUN sed -ri 's/^#?#X11UseLocalhost\s+.*/X11UseLocalhost no/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN echo $timezone > /etc/timezone

RUN apt-get install -y software-properties-common

RUN dpkg --add-architecture i386
RUN add-apt-repository universe
RUN apt-get update --fix-missing

RUN apt-get install -y rpm2cpio libncurses5 libncurses5:i386 libstdc++6:i386 \
            libncursesw5

RUN apt-get install -y ninja-build libpixman-1-dev libfdt-dev libslirp-dev

RUN apt-get install -y texinfo libglib2.0-dev liblz4-tool autoconf \
            libtool libsdl-dev build-essential golang git \
            curl zip unzip e2tools automake bison flex uml-utilities libcap-dev \
            libattr1-dev ant uml-utilities bc libssl-dev expect \
            cpio net-tools dnsmasq iptables jq rsync iproute2 \
            libsdl2-dev sshpass libswitch-perl doxygen graphviz \
            python2 \
            bsdmainutils python3 python3-dev python3-networkx \
            python3-yaml cmake python3-pip openjdk-11-jdk-headless

RUN apt-get install -y git-core gnupg zlib1g-dev gcc-multilib g++-multilib \
            libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev \
            lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc fontconfig

RUN apt-get update --fix-missing
RUN apt-get install -y ccache vim tmux sudo bash-completion \
            gnome-terminal dbus-x11 netcat-openbsd meld tree \
            silversearcher-ag chrpath diffstat gawk locales \
            p7zip-full cscope socat clang-format

RUN apt-get install -y adwaita-icon-theme-full

RUN apt-get install -y inetutils-ping inetutils-traceroute dnsutils \
            inetutils-tools autossh

RUN apt-get install -y zstd qtchooser

RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git

RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2
RUN update-alternatives --set python /usr/bin/python2

RUN pip3 install pipenv
RUN pip3 install pyfdt

RUN locale-gen en_US.UTF-8

RUN sed -ri 's/^%sudo\s+ALL=\(ALL:ALL\)\s+ALL/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY gn /usr/bin

CMD    ["/usr/sbin/sshd", "-D"]

