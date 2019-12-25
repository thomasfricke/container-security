FROM ubuntu:18.04

RUN apt-get update && apt-get install -y apt-transport-https pulseaudio-utils dbus
ADD https://dl-ssl.google.com/linux/linux_signing_key.pub /tmp 

RUN apt-key add /tmp/linux_signing_key.pub && \
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list && \
        apt-get update && apt-get install -y google-chrome-stable 

ENV HOME=/home/brave
ADD run.sh /run.sh

RUN mkdir -p $HOME && chown -R 1001:1001 $HOME
WORKDIR $HOME

USER 1001:1001

CMD /run.sh
