# Lab #4 - Docker image

Une image conteneur est un fichier tar contenant des fichiers tar. Chacun des fichiers tar est une couche. Une fois que tous les fichiers tar ont été extraits au même emplacement, vous disposez du système de fichiers du conteneur.

Cela peut être exploré via Docker. Tirez les couches sur votre système local.

`docker pull redis:3.2.11-alpine`{{execute}}

Exportez l'image au format tar brut.

`docker save redis:3.2.11-alpine > redis.tar`{{execute}}

Extraire sur le disque

`tar -xvf redis.tar`{{execute}}

Tous les fichiers tar de couche sont désormais visibles.

`ls`{{execute}}

L'image comprend également des métadonnées sur l'image, telles que les informations de version et le nom de la balises.

`cat repositories`{{execute}}

`cat manifest.json`{{execute}}

Extraire une couche vous montrera quels fichiers cette couche fournit.

`tar -xvf da2a73e79c2ccb87834d7ce3e43d274a750177fe6527ea3f8492d08d3bb0123c/layer.tar`{{execute}}

## Création d'une image vide

Comme une image n'est qu'un fichier tar, une image vide peut être créée à l'aide de la commande ci-dessous.

`tar cv --files-from /dev/null | docker import - empty`{{execute}}

En important le tar, les métadonnées supplémentaires seront créées.

`docker images`{{execute}}

Cependant, comme le conteneur ne contient rien, il ne peut pas démarrer de processus.
