FROM ubuntu:18.04

RUN apt-get -y update && \
    apt-get -y install qbittorrent-nox && \
    apt-get clean

ENV HOME=/incoming/qbittorrent
RUN mkdir -p $HOME && chown 1001:1001 -R $HOME
WORKDIR $HOME
USER 1001:1001

ENTRYPOINT qbittorrent-nox


