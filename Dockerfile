#
#
#
#
#
FROM appsoa/docker-centos-desktop-xfce:testing

ENV DISPLAY=:1 \
    NO_VNC_HOME="/opt/noVNC" \
    VNC_COL_DEPTH="16" \
    VNC_RESOLUTION="1280x1024 "\
    VNC_PW="changeme"

COPY src/bin /bin
COPY src/etc /etc
COPY src/home /home
# COPY src/opt /opt

RUN yum -y install tigervnc-server && \
    yum -y clean all && \
    chmod 755 /home/user/.vnc/xstartup

## Install noVNC - HTML5 based VNC viewer
# RUN mkdir -p $NO_VNC_HOME/utils/websockify \
#     && wget -qO- https://github.com/kanaka/noVNC/archive/v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
#     && wget -qO- https://github.com/kanaka/websockify/archive/v0.8.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
#     && chmod +x -v /opt/noVNC/utils/*.sh

EXPOSE 5901
# CMD ["supervisord", "-c", "/etc/supervisord.conf"]
# RUN ps aux
# USER user
# RUN /usr/bin/supervisord -c /etc/supervisord.conf
# RUN tail -f /var/log/supervisord/*
# ENTRYPOINT ["/bin/vncserver-ctl.sh"]
# USER root
# CMD ["supervisord"]
# RUN ps aux
