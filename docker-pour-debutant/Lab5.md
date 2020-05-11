# Lab #5 - Docker Networking

Cherche l'adresse ip du système Linux hôte :

récuperer l'adresse ip :

`ip address | grep -v "127.0.0.1" | grep "inet"|awk '{print $2}'`{{execute}}

Lancer une image docker ubuntu en mode interactif :

`docker run -it ubuntu bash'`{{execute}}

Votre prompt shell change et vous êtes maintenant en mode :
root@XXXXXX:/#

Lancer une misé à jour de package au sein du container docker :

`apt-get update'`{{execute}}

Mainenant que le système de package est à jour nous allons installer la commande IP adress qui n'existe pas dans l'image ubuntu lightweight :

`apt-get install -y iproute2`{{execute}}

ensuite la même opération que sur le linux hôte :

`ip address | grep -v "127.0.0.1" | grep "inet"|awk '{print $2}'`{{execute}}

Est-ce la même adresse ?
