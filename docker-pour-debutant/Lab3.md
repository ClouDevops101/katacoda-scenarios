# Lab #3 - Lancer votre premier webserveur sur docker

Vous pouvez suivre mes cours sur Udemy
https://www.udemy.com/user/abdelilah-heddar/

Maintenant lancer le même container cette fois-ci en mode interactif :

### Tâche

`docker run --name ubuntu_bash --rm -i -t -p 8080:80 nginx bash`{{execute}}

visitez la page : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

on vas chercher le ficher nginx

`find / -type f -iname "index.html"`{{execute}}

Et on va le personaliser la page :

`echo '<html><head><title>Welcome '"$name"'!</title></head><body><h1>Welcome '"$name" to my class'!</h1></body></html>' > /usr/share/nginx/html/index.html`{{execute}}

Lancer le serveur web nginx

`nginx`{{execute}}

visitez la page à nouveau : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

arrêtez le processur nginx en appuyant sur ces deux touches simultanement

[Ctrl) + (c)

sortez du bash du conteneur en appuyant sur ces deux touches simultanement

[Ctrl) + (d)

et si on refait un coup de

`docker ps`{{execute}}

Le contener lancé est-il présent ? et pour quelle raison ?
