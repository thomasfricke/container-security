FROM docker.io/alpine:3.10
RUN apk add --update --purge -uU \
        curl icu-libs unzip zlib-dev musl \
        alsa-utils \
        mesa-gl mesa-dri-swrast \
        pulseaudio udev \
	      ffmpeg-libs \
        libstdc++ libgcc dbus-x11 \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache --purge -u \
        alsa-plugins-pulse \
        chromium \
    && rm -rf /var/cache/apk/* /tmp/*

COPY run.sh /

ENV HOME=/home/chromium
ADD run.sh /run.sh

RUN mkdir -p $HOME && chown -R 1001:1001 $HOME
WORKDIR $HOME

USER 1001:1001

CMD /run.sh


ENTRYPOINT ["/run.sh"] 
