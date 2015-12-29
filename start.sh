#!/bin/bash
set -e
source ${SVN_BUILD_DIR}/functions

#rm -fr /var/run/apache2/*
config_apache

# Set svn repository permission
chown -R ${APACHE_RUN_GROUP}:${APACHE_RUN_USER} ${SVN_PARENT_PATH}
