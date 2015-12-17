#!/bin/bash
APACHE_DIR="/srv/apache"
APACHE_CONF_DIR="/srv/apache/config"
APACHE_MOD_DIR="/srv/apache/mods"
SVN_DIR="/srv/svn"

rm -fr /var/run/apache2/*

if [ -d "$APACHE_CONF_DIR" ] && [ ! -L "/etc/apache2/conf-enabled" ] ; then
  rm -fr /etc/apache2/conf-enabled
  ln -fs $APACHE_CONF_DIR /etc/apache2/conf-enabled
fi
if [ -d "$APACHE_MOD_DIR" ] && [ "$(ls -A $APACHE_MOD_DIR)" ] ; then
  cp -fr $APACHE_MOD_DIR/* /etc/apache2/mods-enabled/
fi

chown -R www-data:www-data $APACHE_DIR $SVN_DIR /etc/apache2

exec /usr/sbin/apachectl -D FOREGROUND || \
tail -F /var/log/apache2/*.log
