#
#
#
#
#
FROM appsoa/centos-desktop-xfce:testing

ENV DISPLAY=":1" \
    NO_VNC_HOME="/opt/noVNC" \
    VNC_COL_DEPTH="16" \
    VNC_RESOLUTION="1280x1024 "\
    VNC_PW="changeme" 

RUN yum -y install epel-release tigervnc-server supervisor && \
    yum -y clean all

ADD ["src/home", "src/etc", "src/bin", "src/opt", "/"]

## Install noVNC - HTML5 based VNC viewer
RUN mkdir -p $NO_VNC_HOME/utils/websockify \
    && wget -qO- https://github.com/kanaka/noVNC/archive/v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
    && wget -qO- https://github.com/kanaka/websockify/archive/v0.8.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
    && chmod +x -v /opt/noVNC/utils/*.sh 

RUN touch /var/run/supervisord.pid && \
    chmod -R 775 /var/log/supervisor /var/run/supervisor /var/run/supervisord.pid && \
    chown -R user:wheel /home/user /var/log/supervisor /var/run/supervisor /var/run/supervisord.pid

EXPOSE 5901 6901
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
# RUN ps aux
# USER user
# RUN /usr/bin/supervisord -c /etc/supervisord.conf
# ENTRYPOINT ["/bin/vncserver-ctl.sh"]
# USER root
# CMD ["supervisord"]
# RUN ps aux
