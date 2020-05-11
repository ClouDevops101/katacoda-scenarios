# Lab #3 - Lancer votre premier webserveur sur docker

Maintenant lancer le même container cette fois-ci en mode interactif :

`docker run --name ubuntu_bash --rm -i -t -p 8080:80 nginx bash`{{execute}}

visitez la page : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

on vas chercher le ficher nginx

`find / -type f -iname "index.html"`{{execute}}

`echo '<html><head><title>Welcome '"$name"'!</title></head><body><h1>Welcome '"$name" to my class'!</h1></body></html>' > /usr/share/nginx/html/index.html`{{execute}}

`nginx`{{execute}}

visitez la page à nouveau : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

arrêtez le processur nginx en appuyant sur ces deux touches simultanement

[Ctrl) + (c)

sortez du bash du conteneur en appuyant sur ces deux touches simultanement

[Ctrl) + (d)

et si on refait un coup de

`docker ps`{{execute}}

Le contener lancé est-il présent ? et pour quelle raison ?
