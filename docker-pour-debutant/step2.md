
## Task




### Lancer un serveur web avec l'image Nginx 


Run an nginx container and map port 80 on the container to port 8080 on your host. Map port 443 on the container to port 4443 on the host
`docker container run -d -p 8080:80 nginx`{{execute}}

 Visit : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/



Maintenant lancer le même container cette fois-ci en mode interactif :

`docker run --name ubuntu_bash --rm -i -t -p 8080:80 nginx bash`{{execute}}

### ça ne marche pas !

Liser le message : 

`docker: Error response from daemon: driver failed programming external connectivity on endpoint ubuntu_bash (86517137dbfe4675e648a330cffca08abe829ada9b045a6a868c8c04869851ff): Bind for 0.0.0.0:8080 failed:*port is already allocated*.`

Le conteneur que vous avez lancer tout à leur est toujour entrain de trourné en tâche de fond pour le voir : 

`docker ps `{{execute}}

et pour le remercier 

`docker stop $(docker ps -q -a)`{{execute}}

Modifier la page principale du serveur web (nginx) : 

on vas chercher le ficher nginx 

`find / -type f -iname "index.html"`{{execute}}


`echo '<html><head><title>Welcome '"$name"'!</title></head><body><h1>Welcome '"$name" to my class'!</h1></body></html>' > /usr/share/nginx/html/index.html`{{execute}}



`nginx`{{execute}}

arrêtez le processur nginx en appuyant sur ces deux touches simultanement 

Ctrl + c

sortez du bash du conteneur en appuyant sur ces deux touches simultanement 

Ctrl + d