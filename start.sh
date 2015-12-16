#!/bin/bash
APACHE_DIR="/srv/apache"
APACHE_CONF_DIR="/srv/apache/config"
SVN_DIR="/srv/svn"

if [ -d "$APACHE_CONF_DIR" ] && [ ! -L "/etc/apache2/conf-enabled" ] ; then
  ln -s $APACHE_CONF_DIR /etc/apache2/conf-enabled
fi

chown -R www-data:www-data $APACHE_DIR $SVN_DIR /etc/apache2

/etc/init.d/apache2 start && \
tail -F /var/log/apache2/*.log
