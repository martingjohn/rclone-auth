FROM martinjohn/rclone:latest

ENV VNCPASSWD="1234"

RUN set -x \
    && apk update \
    && apk search *vnc* \
    && apk --no-cache add \
        firefox-esr \
        xfce4 \
        xvfb \
     && rm -rf /var/cache/apk/*

# Setup password
WORKDIR /root/.vnc
#RUN x11vnc -storepasswd ${VNCPASSWD} passwd

# Autostart firefox
WORKDIR /root
RUN echo "firefox" >> .bashrc

ENTRYPOINT ["/bin/ash"]
