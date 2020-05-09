This is your first step.

## Task

This is an _example_ of creating a scenario and running a **command**

`docker ps`{{execute}}

### subtask


Run an nginx container and map port 80 on the container to port 8080 on your host. Map port 443 on the container to port 4443 on the host
`docker container run -d -p 8080:80 nginx`{{execute}}

 Visit : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
