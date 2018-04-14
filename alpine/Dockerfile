
FROM arm32v6/alpine:3.7
RUN apk add --no-cache curl nano \
    && cd /tmp/ \
    && curl -L https://sybdata.de/files/public-docs/AceStream_3.1.29_py2.7.14_webUI_ARMv8l.tar.gz -o acestream_rpi.tar.gz \
    && tar xzfv acestream_rpi.tar.gz \
    && rm -rf acestream_rpi.tar.gz
RUN mv /tmp/acestream.engine /tmp/acestream
RUN mkdir -p /system/ \
    && mkdir -p /storage \
    && mv /tmp/acestream/androidfs/system/* /system/ \
    && find /system -type d -exec chmod 755 {} \; \
    && find /system -type f -exec chmod 644 {} \; \
    && mv /tmp/acestream/androidfs/acestream.engine/ / \
    && chmod 755 /system/bin/* /acestream.engine/python/bin/python \
    && rm -rf /tmp/* \
    && echo "67.215.246.10 router.bittorrent.com" >> /etc/hosts \
    && echo "212.129.33.59 dht.transmissionbt.com" >> /etc/hosts \
    && echo "87.98.162.88 dht.transmissionbt.com" >> /etc/hosts
EXPOSE 6878 62062 8621
CMD ["/system/bin/acestream.sh"]
