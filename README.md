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

## Playlist API

#### Получить плейлист в формате «m3u»:
Запрос:
```
http://127.0.0.1:6878/playlist/get?format=m3u
```
Отклик:
```
#EXTM3U
#EXTINF:-1 tvg-name="Nickelodeon HD (Детские)",Nickelodeon HD (Детские)
http://192.168.178.37:6868/ace/getstream?id=4d416469be3aacf42f5f741897755e57a6488619&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
#EXTINF:-1 tvg-name="RIK HD (Детские)",RIK HD (Детские)
http://192.168.178.37:6868/ace/getstream?id=1f7f3085b931f04059aca566ceb1545b528ce972&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
#EXTINF:-1 tvg-name="Ералаш HD (Детские)",Ералаш HD (Детские)
http://192.168.178.37:6868/ace/getstream?id=a5e195e586dc299c8c9815d55e929c54a9a26add&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
#EXTINF:-1 tvg-name="Карапуз ТВ HD (Детские)",Карапуз ТВ HD (Детские)
http://192.168.178.37:6868/ace/getstream?id=3c2ef7327b383901b518a5ce10b9a7d90a011cd2&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
#EXTINF:-1 tvg-name="Мультик HD (Детские)",Мультик HD (Детские)
http://192.168.178.37:6868/ace/getstream?id=15a7cba440df66918bef099645f74942185ca118&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
#EXTINF:-1 tvg-name="Рыжий HD (Детские)",Рыжий HD (Детские)
http://192.168.178.37:6868/ace/getstream?id=62340cc78ec7bc339f91012a4da8f04725cc15e7&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
```

Запрос:
```
http://127.0.0.1:6878/playlist/get?format=m3u&subcategory=films
```
Отклик:
```
#EXTM3U
#EXTINF:-1 tvg-name="Den of Thieves" group-title="films" acestream-mediainfo-container="Matroska" acestream-mediainfo-video-codec="AVC" acestream-mediainfo-audio-codec="AC3",Den of Thieves
http://192.168.178.37:6868/ace/getstream?infohash=4c9a867f5780a257e20f179f9136a6358b26aaf1&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
#EXTINF:-1 tvg-name="Убийство Джоан" group-title="films" acestream-mediainfo-container="Matroska" acestream-mediainfo-video-codec="AVC" acestream-mediainfo-audio-codec="AC3",Убийство Джоан
http://192.168.178.37:6868/ace/getstream?infohash=cca7e2dead80951c7dafc81669bf15d06b245662&hlc=1&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
```
