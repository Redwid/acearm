# acestream for arm7

## usage

### github

```
$ git clone https://github.com/sybdata/acearm7.git
$ cd acearm7/
$ docker build -t sybdata/acearm7 .
$ id <dockeruser>
$ docker run --privileged -d -e PUID=0 -e PGID=0 --name acepi -p 8621:8621 -p 62062:62062 -p 6878:6878 sybdata/acearm7
```
## info

* Shell access whilst the container is running: `docker exec -it acepi /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f acepi`

* https://paste.ee/p/WRjtL
* https://paste.ee/p/3fNxl

![pidock](https://user-images.githubusercontent.com/24189833/38767729-4adaaec0-3fe7-11e8-8952-e6ea6f7e7744.png)

![pidock1](https://user-images.githubusercontent.com/24189833/38768880-7c1c4210-3ffa-11e8-9258-ae0b221ee5e9.png)


