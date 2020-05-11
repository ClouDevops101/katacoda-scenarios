# Lab #6 - Docker Volumes

## Étape 1 - Créer un conteneur

Les conteneurs de données sont des conteneurs dont la seule responsabilité est d'être un lieu de stockage / gestion des données.

Comme les autres conteneurs, ils sont gérés par le système hôte. Cependant, ils ne s'exécutent pas lorsque vous exécutez une commande docker ps.

Pour créer un conteneur de données, nous créons d'abord un conteneur avec un nom connu pour référence future. Nous utilisons la boîte occupée comme base car elle est petite et légère au cas où nous voudrions explorer et déplacer le conteneur vers un autre hôte.

Lors de la création du conteneur, nous fournissons également une option -v pour définir où d'autres conteneurs liront / enregistreront les données.

### Tâche

Créer un conteneur de données pour stocker les fichiers de configuration à l'aide
`docker create -v /config --name dataContainer busybox`{{execute}}

## Étape 2 - Copy Files

Avec le conteneur en place, nous pouvons maintenant copier des fichiers de notre répertoire client local dans le conteneur.

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
