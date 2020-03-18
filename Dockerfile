FROM arm32v7/debian:stretch-slim

ARG LINK_TO_ACESTREAM

RUN apt-get update \
    && apt-get install -y sudo procps curl nano git python2.7 python-pip  \
    && cd /tmp/ \
    && curl -L $LINK_TO_ACESTREAM -o acestream_rpi.tar.gz \
    && tar xzfv acestream_rpi.tar.gz \
    && rm -rf acestream_rpi.tar.gz \
    && mv /tmp/acestream.engine/ / \
    && find /acestream.engine/androidfs/system -type d -exec chmod 755 {} \; \
    && find /acestream.engine/androidfs/system -type f -exec chmod 644 {} \; \
    && chmod 755 /acestream.engine/androidfs/system/bin/* /acestream.engine/androidfs/acestream.engine/python/bin/python \
    && mkdir /acestream.engine/androidfs/dev \
    && mknod -m 644 /acestream.engine/androidfs/dev/random c 1 8 \
    && mknod -m 644 /acestream.engine/androidfs/dev/urandom c 1 9 \
    && cd / \
    && git clone https://github.com/pepsik-kiev/HTTPAceProxy.git \
    && sed -i 's:pomoyka.win:91.92.66.82:g' /HTTPAceProxy/plugins/config/torrenttelik.py \
    && sed -i 's:logfile = None:logfile = "/log/acehttp.log":g' /HTTPAceProxy/aceconfig.py \
    && sed -i 's:acespawn = False:acespawn = True:g' /HTTPAceProxy/aceconfig.py \
    && sed -i 's:acecmd = .*:acecmd = "sudo bash /acestream.engine/acestream.start":g' /HTTPAceProxy/aceconfig.py \
    && sed -i 's:$ACEADDON/acestream.log:/log/acestream.log:g' /acestream.engine/acestream.start \
    && pip install psutil \
    && pip install --no-binary gevent gevent \
    && apt-get autoclean \
    && apt-get autoremove \
    && apt remove --allow-remove-essential --auto-remove build-essential git rsync libc6-dev openssh-client -y \
    && apt-get clean \
    && apt remove --allow-remove-essential apt -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 6878 62062 8621 8000

CMD ["/usr/bin/python2", "/HTTPAceProxy/acehttp.py"]