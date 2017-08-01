FROM martinjohn/rclone:latest

ENV VNCPASSWD="1234"

#        x11vnc \
RUN set -x \
    && apk update \
    && apk search *firefox* \
    && apk --no-cache add \
        firefox \
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
