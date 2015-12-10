FROM ubuntu:14.04

RUN apt-get -y update

# Install apache and svn
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 subversion

# Install modules for access control
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y libapache2-svn libapache-dbi-perl \
    libapache2-mod-perl2 libauthen-simple-ldap-perl

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN usermod -U www-data && chsh -s /bin/bash www-data

RUN a2enmod dav dav_svn perl auth_digest

RUN rm -fr /var/www/html
ADD apache2.conf /etc/apache2/apache2.conf

EXPOSE 80

VOLUME /srv/svn

CMD /etc/init.d/apache2 start | tail -f /var/log/apache2/error.log
