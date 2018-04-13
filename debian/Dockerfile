FROM arm32v7/debian:stretch-slim

# Set correct environment variables
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp
# set ports
EXPOSE 8621 62062 6878 8000

# update apt and install dependencies
RUN \
apt-get update -y && \
apt-get install -y \
wget \
mc \
nano \
htop \
curl && \
#acestream
curl -L https://sybdata.de/files/public-docs/AceStream_3.1.29_py2.7.14_webUI_ARMv8l.tar.gz -o acestream_rpi.tar.gz && \
tar xzfv acestream_rpi.tar.gz && \
rm -rf acestream_rpi.tar.gz && \
mv /tmp/acestream.engine /tmp/acestream && \
mkdir -p /system/ && \
mkdir -p /storage && \
mv /tmp/acestream/androidfs/system/* /system/ && \
find /system -type d -exec chmod 755 {} \; && \
find /system -type f -exec chmod 644 {} \; && \
mv /tmp/acestream/androidfs/acestream.engine/ / && \
chmod 755 /system/bin/* /acestream.engine/python/bin/python && \
echo "67.215.246.10 router.bittorrent.com" >> /etc/hosts && \
echo "212.129.33.59 dht.transmissionbt.com" >> /etc/hosts && \
echo "87.98.162.88 dht.transmissionbt.com" >> /etc/hosts && \
# install HTTPAceProxy
wget -o - https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip -O aceproxy.zip && \ 
unzip aceproxy.zip -d /opt/ && \
curl -sSL https://raw.githubusercontent.com/sybdata/acestream/master/aceproxy.service > /etc/systemd/system/aceproxy.service && \

# clean up
apt-get clean && \
rm -rf /tmp/* /var/tmp/*

WORKDIR /
CMD ["/system/bin/acestream.sh"]
