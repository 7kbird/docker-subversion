# docker-subversion
Subversion support different authorization, e.g.Redmine and LADP

## AuthType Basic

Create a file ``/srv/docker/svn/conf/subversion.conf`` and add the below lines for creating apache virtual host
```
<location />
DAV svn
SVNParentPath /srv/svn/repos
AuthType Basic
AuthName "Authorization Realm"
AuthUserFile /srv/svn/svn.users
AuthzSVNAccessFile /srv/svn/authz.conf
Require valid-user
</location>
```
**SVNParentPath /srv/svn/repos/**: Parent Directory without repository name
**AuthUserFile /srv/svn/svn.users**: User information created by command ``htpasswd``
**AuSVNAccessFile /srv/svn/authz.conf**: User access information

Create a folder ``/srv/docker/svn`` contain all ``authz.conf`` and ``svn.users``

Run the container
```
docker run -d \
    -v /srv/docker/svn:/srv/svn \
    -v /srv/docker/conf:/etc/apache2/conf-enabled:ro \
    --name subversion 7kbird/subversion
```
