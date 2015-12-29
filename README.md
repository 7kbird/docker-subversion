# docker-subversion
Subversion support different authorization, e.g.Redmine and LADP

## AuthType Basic
    TODO:

## Redmine

Run the container
```
docker run -d \
    --volume="/srv/docker/svn:/srv" \
    --env="REDMINE_DB_NAME=redmine_product" --env="REDMINE_DB_USER=redmine" --env="REDMINE_DB_PASS=password" --link=postgres:postgres \
    --name subversion 7kbird/subversion
```
