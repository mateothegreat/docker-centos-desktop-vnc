# docker-centos-desktop-vnc

```
docker rm -f vnc

docker run -id  -e CONF_VNC_PASS=changeme \
                -p 5901:5901 -p 6901:6901 \
                --name vnc \
                appsoa/centos-desktop-vnc:testing
                
docker logs vnc -f
```