FROM arm32v7/debian:stretch-slim

# Set correct environment variables
ENV DEBIAN_FRONTEND=noninteractive LANG=ru_RU.UTF-8 LANGUAGE=ru_RU:ru LC_ALL=ru_RU.UTF-8
WORKDIR /tmp
# set ports
EXPOSE 8621 62062 6878 8000

# Set the locale
RUN locale-gen ru_RU.UTF-8 && \

# update apt and install dependencies
apt-get update -y && \
apt-get install -y \
wget \
mc \
nano \
htop \
curl \
unzip \
python-gevent \
python-pip \
python-dev \
gcc && \
pip install --upgrade pip && \
pip install psutil --upgrade && \
pip install gevent --upgrade && \
apt-get remove \
gcc \
python-pip \
python-dev && \
apt-get autoremove && \

#acestream
wget -o - https://sybdata.de/files/public-docs/acestream.zip -O acestream.zip && \
unzip acestream.zip -d /opt/ && \
curl -sSL https://raw.githubusercontent.com/sybdata/acestream/master/acestream.service > /etc/systemd/system/acestream.service && \
chmod +x /opt/acestream/acestream.engine/acestream.start && \
chmod +x /opt/acestream/acestream.engine/acestream.stop && \
systemctl daemon-reload && \
systemctl enable acestream.service && \
systemctl start acestream.service && \
# install HTTPAceProxy
wget -o - https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip -O aceproxy.zip && \ 
unzip aceproxy.zip -d /opt/ && \
curl -sSL https://raw.githubusercontent.com/sybdata/acestream/master/aceproxy.service > /etc/systemd/system/aceproxy.service && \
systemctl daemon-reload && \
systemctl enable aceproxy.service && \
systemctl start aceproxy.service && \
systemctl status aceproxy.service && \

# clean up
apt-get clean && \
rm -rf /tmp/* /var/tmp/*

WORKDIR /
