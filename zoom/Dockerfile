FROM ubuntu:18.04

RUN apt-get update && apt-get install -y ca-certificates \
    apt-transport-https pulseaudio-utils \
    libglib2.0-0 libxcb-shape0 libxcb-shm0 libxcb-xfixes0 \
    libxcb-randr0 libxcb-image0 libfontconfig1 \
    libgl1-mesa-glx libegl1-mesa libxi6 \
    libxrender1 libxcomposite1 libxslt1.1 \
    libxcb-keysyms1 libxcb-xtest0 ibus \
    libasound2 libnss3 xdg-utils \
    curl gnupg2 \
    libgl1-mesa-dri netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

RUN . /etc/os-release && echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" \
    >  /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list

RUN apt update && apt install brave-browser  -y && rm -rf /var/lib/apt/lists/*   


RUN useradd -u 1001 zoom && usermod -G video zoom

COPY zoom_amd64.deb /tmp

RUN dpkg -i /tmp/zoom_amd64.deb && rm /tmp/zoom_amd64.deb



ENV HOME=/home/zoom

RUN mkdir -p $HOME && chown -R zoom:zoom $HOME
WORKDIR $HOME
USER zoom
COPY run.sh run.sh

ENTRYPOINT ["/bin/sleep","infinity"]
