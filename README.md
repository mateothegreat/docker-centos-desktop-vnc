# docker-centos-desktop-vnc

```
docker rm -f vnc

docker run -id  -e CONF_VNC_PASS=changeme \
                -p 5901:5901 -p 6901:6901 \
                --name vnc \
                appsoa/docker-centos-desktop-vnc:testing

docker logs vnc -f

```

## Testing

```bash

docker run -it  -e CONF_VNC_PASS=changeme \
                -p 5901:5901 -p 6901:6901 \
                appsoa/docker-centos-desktop-vnc:testing \
                /bin/bash


```

```
[matthew@sandbox-1 ~]$ ./docker-centos-tools/build.sh docker-centos-desktop-vnc/ virtualmachines-154415 docker-centos-desktop-vnc 1.0.0 gcr.io
```

