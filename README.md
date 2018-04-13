# acestream for arm7

## usage

### github

```
$ git clone https://github.com/sybdata/acearm7.git
$ cd acearm7/
$ docker build -t sybdata/acearm7 .
id <dockeruser>
$ docker run --privileged --rm -d -e PUID=0 -e PGID=0 --name acepi -p 8621:8621 -p 62062:62062 -p 6878:6878 -p sybdata/acearm7
```
## info

* Shell access whilst the container is running: `docker exec -it acepi /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f acepi`
