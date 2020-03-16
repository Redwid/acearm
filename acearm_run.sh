#!/usr/bin/env bash
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