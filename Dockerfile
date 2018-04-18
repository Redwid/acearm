FROM lsiobase/alpine.armhf
RUN apk add --no-cache nano git python2 py-gevent py-psutil \
    && cd /tmp/ \
    && curl -L https://sybdata.de/files/public-docs/AceStream_3.1.29_py2.7.14_webUI_ARMv8l.tar.gz -o acestream_rpi.tar.gz \
    && tar xzfv acestream_rpi.tar.gz \
    && rm -rf acestream_rpi.tar.gz
RUN mv /tmp/acestream.engine/ /
RUN find /acestream.engine/androidfs/system -type d -exec chmod 755 {} \; \
    && find /acestream.engine/androidfs/system -type f -exec chmod 644 {} \; \
    && chmod 755 /acestream.engine/androidfs/system/bin/* /acestream.engine/androidfs/acestream.engine/python/bin/python \
    && rm -rf /tmp/* \
    && cd / && git clone https://github.com/pepsik-kiev/HTTPAceProxy.git
EXPOSE 6878 62062 8621 8000
COPY root/ /
