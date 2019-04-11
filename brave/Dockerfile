FROM ubuntu:18.04

RUN apt-get update && apt-get install -y ca-certificates apt-transport-https pulseaudio-utils
ADD https://brave-browser-apt-release.s3.brave.com/brave-core.asc  /tmp 

RUN apt-key add /tmp/brave-core.asc && echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com bionic main" >> /etc/apt/sources.list.d/brave.list && \
        apt-get update && apt-get install -y brave-browser 

ENV HOME=/home/brave
ADD run.sh /run.sh

RUN mkdir -p $HOME && chown -R 1001:1001 $HOME
WORKDIR $HOME

USER 1001:1001

CMD /run.sh
