# Acestream + HTTPAceProxy for x86 Docker Image


## info
Updated forked from sybdata/acearm version of Acestream + HTTPAceProxy docker image for x86
Based on android acestream apk


### usage

Build docker image:

```
$ docker build --build-arg LINK_TO_ACESTREAM='Your_link_to_acestream_3.1.48_webUI_x86.tar.gz' -t redwid/ace-x86 .
```

Run docker image:
```
docker run -d \
        --restart=unless-stopped \
        -e PUID=0 -e PGID=0 \
        --name aceproxy \
        -p 8621:8621 \
        -p 62062:62062 \
        -p 6878:6878 \
        -p 8000:8000 \
        -v /var/log/acearm:/log \
        redwid/acearm:3.1.48
```


## info

* Shell access whilst the container is running: `docker exec -it $hash /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f $hash`
* Container has volume (/var/log/acearm) for logs, all logs will be stored there:

```
tail -f -n 50 /var/log/acearm/acehttp.log
```
```
tail -f -n 50 /var/log/acearm/acestream.log
```

* To get stats:
```
http://[your_docker_ip]:8000/stat
```
* To adjust acestream config:
```
http://[your_docker_ip]:6878/webui/app/ReplaceMe/server#proxy-server-main
```

## Playlist API

```
http://[your_docker_ip]:8000/ttv
```
