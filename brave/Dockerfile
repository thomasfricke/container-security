FROM ubuntu:18.04

RUN apt-get update && apt-get install -y ca-certificates apt-transport-https pulseaudio-utils curl gnupg2 \
  libgl1-mesa-glx libgl1-mesa-dri netcat-openbsd && rm -rf /var/lib/apt/lists/*

RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

RUN . /etc/os-release && echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" \
    >  /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list

RUN apt update && apt install brave-browser  -y && rm -rf /var/lib/apt/lists/*   

ENV HOME=/home/brave
ADD run.sh /run.sh

RUN mkdir -p $HOME && chown -R 1001:1001 $HOME
WORKDIR $HOME

USER 1001:1001

CMD /run.sh
