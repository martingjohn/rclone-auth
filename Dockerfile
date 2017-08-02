FROM martinjohn/rclone:latest

EXPOSE 5900

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

WORKDIR /root
ADD start.sh /root
RUN chmod 755 /root/start.sh
ENTRYPOINT ["/bin/ash"]
CMD ["/root/start.sh"]
