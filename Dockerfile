#
#
#
#
#
FROM gcr.io/virtualmachines-154415/docker-centos-desktop-xfce:1.0.0

ENV DISPLAY=:1 \
    NO_VNC_HOME="/opt/noVNC" \
    VNC_COL_DEPTH="16" \
    VNC_RESOLUTION="1280x1024 "\
    VNC_PW="changeme"

COPY src/bin /bin
COPY src/etc /etc
COPY src/home /home

RUN yum -y install tigervnc-server && \
    yum -y clean all && \
    chmod 755 /home/user/.vnc/xstartup

EXPOSE 5901