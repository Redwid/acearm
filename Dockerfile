FROM debian:stretch-slim

ARG LINK_TO_ACESTREAM


RUN apt-get update \
    && apt-get install -y sudo procps curl nano git python2.7 python-pip \
    && cd /tmp/ \
    && curl -L $LINK_TO_ACESTREAM -o acestream_rpi.tar.gz \
    && tar xzfv acestream_rpi.tar.gz \
    && rm -rf acestream_rpi.tar.gz \
    && mv /tmp/acestream.engine/ / \
    && find /acestream.engine/androidfs/system -type d -exec chmod 755 {} \; \
    && find /acestream.engine/androidfs/system -type f -exec chmod 644 {} \; \
    && chmod 755 /acestream.engine/androidfs/system/bin/* /acestream.engine/androidfs/acestream.engine/python/bin/python \
    && cd / \
    && git clone https://github.com/Redwid/HTTPAceProxy.git \
    && sed -i 's:$ACEADDON/acestream.log:/log/acestream.log:g' /acestream.engine/start_acestream_chroot.sh \
    && pip install psutil sh \
    && pip install --no-binary gevent gevent \
    && apt-get autoclean \
    && apt-get autoremove \
    && apt remove --allow-remove-essential --auto-remove build-essential git rsync libc6-dev openssh-client -y \
    && apt-get clean \
    && apt remove --allow-remove-essential apt -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 6878 62062 8621 8000

CMD ["/usr/bin/python2", "/HTTPAceProxy/acehttp.py"]