# acestream + HTTPAceProxy for ARMv7/8

![pidoc66a](https://user-images.githubusercontent.com/24189833/38827684-fd660e36-41b3-11e8-892a-e49f24e935c3.png)

## usage

### github

```
$ git clone https://github.com/sybdata/acearm.git
$ cd acearm/
$ docker build -t sybdata/acearm .
$ id <dockeruser>
$ docker run --privileged -d --restart always -e PUID=0 -e PGID=0 --name aceproxy -p 8621:8621 -p 62062:62062 -p 6878:6878 -p 8000:8000 sybdata/acearm
```
## info

* Shell access whilst the container is running: `docker exec -it acepi /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f acepi`

* https://paste.ee/p/WRjtL
* https://paste.ee/p/3fNxl

## add HTTPAceProxy

* https://paste.ee/p/ZofDu

![pidoc66](https://user-images.githubusercontent.com/24189833/38827151-4b004406-41b2-11e8-902e-cc6d27972ecc.png)


![pidock](https://user-images.githubusercontent.com/24189833/38767729-4adaaec0-3fe7-11e8-8952-e6ea6f7e7744.png)

![piace](https://user-images.githubusercontent.com/24189833/38771057-7540bca6-401c-11e8-82b4-1087c1464fc2.png)


