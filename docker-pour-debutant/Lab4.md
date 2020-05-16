# Lab #4 - Process

### Lancer un serveur web avec l'image Nginx

Run an nginx container and map port 80 on the container to port 8080 on your host. Map port 443 on the container to port 4443 on the host
`docker container run -d -p 8080:80 nginx`{{execute}}

Docker ne trouve pas l'image en local, puis décide d'aller la chercher sur docker hub, donc il réalise un docker pull implécite :

Visit : https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

Avec cette commande vous etes capable d'auditer les processus qui tournent au sein du container docker

`docker top ubuntu_bash`{{execute}}

Maintenant lancer le même container cette fois-ci en mode interactif :

`docker run --name ubuntu_bash --rm -i -t -p 8080:80 nginx bash`{{execute}}

### ça ne marche pas !

Lisez le message :

`docker: Error response from daemon: driver failed programming external connectivity on endpoint ubuntu_bash (86517137dbfe4675e648a330cffca08abe829ada9b045a6a868c8c04869851ff): Bind for 0.0.0.0:8080 failed:*port is already allocated*.`

Le conteneur que vous avez lancer tout à leur est toujour entrain de trourné en tâche de fond pour le voir :

### Tâche

`docker ps`{{execute}}

et pour le remercier

`docker stop $(docker ps -q)`{{execute}}

Lancer à nouveau la commande : `docker ps`{{execute}} le container est-il toujours présent sur la table des processus ?

Vous pouvez aussi faire presque la même chose avec la commande :

`docker kill $(docker ps -q -a)`{{execute}}

Modifier la page principale du serveur web (nginx) :
