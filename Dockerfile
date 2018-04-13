FROM arm32v6/alpine:3.7
COPY acestream_3.1.28.tar.gz /tmp
RUN cd /tmp/ \ 
    && tar xzfv acestream_3.1.28.tar.gz \
    && rm -rf acestream_3.1.28.tar.gz
RUN mv /tmp/acestream.engine /tmp/acestream
RUN mkdir -p /system/etc \
    && mkdir -p /storage \
    && mv /tmp/acestream/androidfs/system/* /system/ \
    && find /system -type d -exec chmod 755 {} \; \
    && find /system -type f -exec chmod 644 {} \; \
    && mv /tmp/acestream/androidfs/acestream.engine/ / \
    && chmod 755 /system/bin/* /acestream.engine/python/bin/python \
    && rm -rf /tmp/* \
    && echo "67.215.246.10 router.bittorrent.com" >> /etc/hosts \
    && echo "87.98.162.88 dht.transmissionbt.com" >> /etc/hosts
EXPOSE 6878 62062
CMD ["/system/bin/acestream.sh"]
