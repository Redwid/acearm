# Acestream + HTTPAceProxy for ARMv7/8 Docker Image


## info
Updated forked from sybdata/acearm version of Acestream + HHTTPAceProxy docker image for Armv7/8
Based on android acestream apk


### usage

Build docker image:

```
$ docker build --build-arg LINK_TO_ACESTREAM='Your_link_to_acestream_3.1.46_Py2.7.16' -t redwid/acearm .
```

Run docker image:
```
$ docker run --privileged -d --restart always -e PUID=0 -e PGID=0 --name aceproxy -p 8621:8621 -p 62062:62062 -p 6878:6878 -p 8000:8000 redwid/acearm
```


## info

* Shell access whilst the container is running: `docker exec -it acepi /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f acepi`

```
tail -f -n 10 /tmp/acehttp.log
```
```
tail -f -n 50 /acestrem.engine/acestream.log
```

* To get stats:
```
http://[your_docker_ip]:8000/stat
```


## Playlist API

```
http://[your_docker_ip]:8000/torrent-telik
```
