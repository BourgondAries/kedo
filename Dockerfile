FROM fedora:25

RUN dnf update -y && dnf upgrade -y
RUN dnf install --best -y \
        autoconf \
        automake \
        bzip2 \
        cpio \
        dnf-plugins-core \
        gcc-c++ \
        gcc \
        gdb \
        git \
        gnupg2 \
        graphviz \
        gzip \
        iotop \
        htop \
        ImageMagick \
        libedit-devel \
        make \
        man \
        nasm \
        openssh \
        pass \
        passwd \
        perf \
        pinfo \
        pkgconfig \
        python3 \
        qemu \
        tar \
        tmux \
        valgrind \
        vim \
        which \
        xz \
        zlib

RUN dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

RUN dnf makecache fast
RUN dnf install -y docker-ce

RUN curl https://sh.rustup.rs -sSf > installer.sh && sh installer.sh -y && rm installer.sh
RUN curl https://mirror.racket-lang.org/installers/6.9/racket-6.9-x86_64-linux.sh -sSf > installer.sh && sh installer.sh <<< $(echo -e "yes\n1\n") && rm installer.sh

WORKDIR /home/user
VOLUME ["/home/user/stuf"]
COPY enter /enter
CMD ["/enter"]
