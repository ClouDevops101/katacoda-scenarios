This is your first step.

## Task

This is an _example_ of creating a scenario and running a **command**

`docker ps`{{execute}}

### subtask


Run an nginx container and map port 80 on the container to port 8080 on your host. Map port 443 on the container to port 4443 on the host
`docker container run -d -p 8080:80 nginx`{{execute}}

 Visit : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/


Maintenant lancer le même container cette fois-ci en mode interactif :

`docker run --name ubuntu_bash --rm -i -t -p 8080:80 nginx bash`{{execute}}

Taper manuellement cette commande /!\:

Modifier la page principale d'nginx : 

on vas chercher le ficher nginx 

`find / -type f -iname "index.html"`{{execute}}

Copier cette commande et remplacer <prénom> par votre prénom 

`name="<prénom>"`

`echo '<html><head><title>Welcome '"$name"'!</title></head><body><h1>Welcome '"$name" to my class'!</h1></body></html>' > /usr/share/nginx/html/index.html`{{execute}}



'nginx'
