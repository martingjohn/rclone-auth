FROM martinjohn/rclone:latest

RUN set -x \
    && apk update \
    && apk --no-cache add \
        firefox-esr \
        xfce4 \
        xfce4-terminal \
        xvfb \
     && apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing add \
        x11vnc \
     && rm -rf /var/cache/apk/*

WORKDIR /docker
ADD start.sh /docker
RUN chmod 755 /docker/start.sh

EXPOSE 5900
VOLUME /data

ENTRYPOINT ["/bin/ash"]
CMD ["/docker/start.sh"]
