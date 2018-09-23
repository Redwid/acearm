FROM lsiobase/alpine.armhf:3.8
RUN apk add --no-cache curl nano git python2 py-gevent py-psutil \
    && cd /tmp/ \
    && curl -L https://sybdata.de/files/public-docs/acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz -o acestream_rpi.tar.gz \
    && tar xzfv acestream_rpi.tar.gz \
    && rm -rf acestream_rpi.tar.gz
RUN mv /tmp/acestrem.engine/ /
RUN find /acestrem.engine/androidfs/system -type d -exec chmod 755 {} \; \
    && find /acestrem.engine/androidfs/system -type f -exec chmod 644 {} \; \
    && chmod 755 /acestrem.engine/androidfs/system/bin/* /androidfs/acestream.engine/python/bin/python \
    && rm -rf /tmp/* \
    && cd / && git clone https://github.com/pepsik-kiev/HTTPAceProxy.git \
    && mkdir -p /mnt/films/
EXPOSE 6878 62062 8621 8000
COPY root/ /
