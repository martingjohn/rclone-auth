FROM martinjohn/rclone:latest

ENV VNCPASSWD="1234"

RUN set -x \
    && apk update \
    && apk --no-cache add \
        firefox-esr \
        xfce4 \
        xvfb \
     && apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing add \
        x11vnc \
     && rm -rf /var/cache/apk/*

# Setup password
WORKDIR /root/.vnc
#RUN x11vnc -storepasswd ${VNCPASSWD} passwd

# Autostart firefox
WORKDIR /root
RUN echo "firefox" >> .bashrc

ENTRYPOINT ["/bin/ash"]

#cp /etc/X11/xinit/xinitrc ~/.xinitrc ?
