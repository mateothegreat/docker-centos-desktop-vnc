#
#
#
#
#
FROM gcr.io/virtualmachines-154415/docker-centos-desktop-xfce:1.0.0-4

ENV DISPLAY=:1 \
    VNC_COL_DEPTH="16" \
    VNC_RESOLUTION="1280x1024" 

COPY src/bin /bin
COPY src/etc /etc
COPY src/home /home

RUN yum -y install epel-release && \
    yum -y install --enablerepo=epel tigervnc-server vnstat iftop && \
    yum -y clean all && \
    chmod 755 /home/user/.vnc/xstartup 
   

EXPOSE 5901