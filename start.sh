#!/bin/bash
EXTERNAL_APACHE_CONF="/srv/apache/config"
SVN_DIR="/srv/svn"
if [ -d "$EXTERNAL_APACHE_CONF" ] && [ "$(ls -A $EXTERNAL_APACHE_CONF)" ] ; then
  cp -R $EXTERNAL_APACHE_CONF/* /etc/apache2/conf-enabled/
fi
chown -R www-data:www-data /etc/apache2

if [ -d "$SVN_DIR" ] ; then
  chown -R www-data:www-data $SVN_DIR
fi

/usr/sbin/apache2ctl -D FOREGROUND
tail -f /var/log/apache2/error.log
