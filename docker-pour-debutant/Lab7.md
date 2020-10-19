# Lab #7 - Docker Volumes
Vous pouvez suivre mes cours sur Udemy
https://bit.ly/UdemyAH

https://katacoda.com/courses/docker/persisting-data-using-volumes

Les volumes Docker sont créés et attribués au démarrage des conteneurs.
Les volumes de données vous permettent de mapper un répertoire hôte sur un conteneur pour partager des données.
Ce mapping est bidirectionnelle. Il permet d'accéder aux données stockées sur l'hôte depuis l'intérieur du conteneur. Cela signifie également que les données enregistrées par le processus à l'intérieur du conteneur sont conservées sur l'hôte.

## Étape 0 - Data Volumes

Cet exemple utilisera Redis comme moyen de conserver les données. Démarrez un conteneur Redis ci-dessous et créez un volume de données à l'aide du paramètre -v. Cela spécifie que toutes les données enregistrées dans le conteneur dans le répertoire /data doivent être conservées sur l'hôte dans le répertoire /docker /redis-data.

`docker run -v /docker/redis-data:/data \ --name r1 -d redis \ redis-server --appendonly yes`{{execute}}

We can pipe data into the Redis instance using the following command.

`cat data | docker exec -i r1 redis-cli --pipe`

Redis will save this data to disk. On the host we can investigate the mapped direct which should contain the Redis data file.

`ls /docker/redis-data`

This same directory can be mounted to a second container. One usage is to have a Docker Container performing backup operations on your data.

`docker run -v /docker/redis-data:/backup ubuntu ls /backup`

## Étape 1 - Créer un conteneur

Les conteneurs de données sont des conteneurs dont la seule responsabilité est d'être un lieu de stockage / gestion des données.

Comme les autres conteneurs, ils sont gérés par le système hôte. Cependant, ils ne s'exécutent pas lorsque vous exécutez une commande docker ps.

Pour créer un conteneur de données, nous créons d'abord un conteneur avec un nom connu pour référence future. Nous utilisons la busybox comme base car elle est petite et légère au cas où nous voudrions explorer et déplacer le conteneur vers un autre hôte.

Lors de la création du conteneur, nous fournissons également une option -v pour définir où d'autres conteneurs lire / écrire les données.

### Tâche

Créer un conteneur de données pour stocker les fichiers de configuration à l'aide
`docker create -v /config --name dataContainer busybox`{{execute}}

## Étape 2 - Copy Files

Avec le conteneur en place, nous pouvons maintenant copier des fichiers de notre répertoire client local dans le conteneur.

Créer un fichier vide

`touch config.conf`{{execute}}

Pour copier des fichiers dans un conteneur, vous utilisez la commande docker cp. La commande suivante copiera le fichier config.conf dans notre dataContainer et le répertoire config.

`docker cp config.conf dataContainer:/config/`{{execute}}

## Étape 3 - Montez les volumes

Maintenant, notre conteneur de données a notre configuration, nous pouvons référencer le conteneur lorsque nous lançons des conteneurs dépendants nécessitant le fichier de configuration.

En utilisant l'option --volumes-from <container>, nous pouvons utiliser les volumes de montage d'autres conteneurs à l'intérieur du conteneur en cours de lancement. Dans ce cas, nous lancerons un conteneur Ubuntu qui fait référence à notre conteneur de données. Lorsque nous listons le répertoire config, il affichera les fichiers du conteneur attaché.

`docker run --volumes-from dataContainer ubuntu ls /config`{{execute}}

Si un répertoire / config existait déjà, les volumes-from remplaceraient et seraient le répertoire utilisé. Vous pouvez mapper plusieurs volumes sur un conteneur.

## Étape 4 - Exporter / importer des conteneurs

Si nous voulions déplacer le conteneur de données vers une autre machine, nous pouvons l'exporter vers un fichier .tar.

`docker export dataContainer > dataContainer.tar`{{execute}}

La commande docker import dataContainer.tar réimportera le conteneur de données dans Docker.
