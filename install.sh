!#/bin/bash

apt-get update && apt-get upgrade
apt-get install curl unzip python-dev gcc g++
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install psutil --upgrade
pip install gevent --upgrade
apt-get remove gcc python-dev g++
apt-get autoremove
curl -L https://sybdata.de/files/public-docs/acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz -o acestream_rpi.tar.gz
tar xzfv acestream_rpi.tar.gz
rm -rf acestream_rpi.tar.gz
mkdir -p /opt/acestrem.engine/
mv acestrem.engine /opt/acestrem.engine/
find /opt/acestrem.engine/androidfs/system -type d -exec chmod 755 {} \; \
find /opt/acestrem.engine/androidfs/system -type f -exec chmod 644 {} \; \
chmod 755 /opt/acestrem.engine/androidfs/system/bin/* /opt/acestrem.engine/androidfs/acestream.engine/python/bin/python 
wget -o - https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip -O aceproxy.zip 
unzip aceproxy.zip -d /opt/
curl -sSL https://raw.githubusercontent.com/sybdata/acearm/master/aceproxy.service > /etc/systemd/system/aceproxy.service
rm -rf /opt/HTTPAceProxy-master/aceconfig.py
curl -sSL https://raw.githubusercontent.com/sybdata/acearm/master/root/HTTPAceProxy/aceconfig.py > /opt/HTTPAceProxy-master/aceconfig.py
systemctl daemon-reload
systemctl enable aceproxy.service
systemctl start aceproxy.service
systemctl status aceproxy.service
