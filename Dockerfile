FROM hurricane/dockergui:x11rdp

MAINTAINER you'll be lucky sunshine <atsomeplace@onthenet.com>

# set variables
# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99 GROUP_ID=100 APP_NAME="AuroraMon" WIDTH=1420 HEIGHT=840 TERM=xterm


ADD rc.xml /nobody/.config/openbox/rc.xml
ADD startapp.sh /startapp.sh

# install some stuff
RUN apt-get update -q && \
apt-get install libwxgtk2.8-dev g++ libwxgtk2.8-0 make -qy && \
curl -o /tmp/aurora.zip -L http://sourceforge.net/projects/auroramonitor/files/latest/download?source=files && \
unzip /tmp/aurora.zip -d /tmp && \
cd /tmp/auroramon-1.07/src && \
make && \
mv /tmp/auroramon-1.07/src/auroramon /usr/bin && \

#clean up
cd / && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /nobody
