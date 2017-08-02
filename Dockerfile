FROM martinjohn/rclone:latest

EXPOSE 5900
EXPOSE 8080

RUN set -x \
    && apk update \
    && apk --no-cache add \
        firefox-esr \
        nginx \
        xfce4 \
        xfce4-terminal \
        xvfb \
     && apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing add \
        x11vnc \
     && rm -rf /var/cache/apk/*

# Setup password
#WORKDIR /root/.vnc
#RUN x11vnc -storepasswd ${VNCPASSWD} passwd

# Autostart firefox
#WORKDIR /root
#RUN echo "firefox" >> .bashrc

#ENTRYPOINT ["/bin/ash"]
#CMD ["x11vnc", "-usepw", "-create"]
#ENTRYPOINT ["x11vnc", "-usepw", "-create"]

WORKDIR /root
ADD start.sh /root
RUN chmod 755 /root/start.sh
#ENTRYPOINT ["/root/start.sh"]
ENTRYPOINT ["/bin/ash"]

