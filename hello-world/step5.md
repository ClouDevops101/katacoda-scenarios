Création d'une image vide
Comme une image n'est qu'un fichier tar, une image vide peut être créée à l'aide de la commande ci-dessous.

`tar cv --files-from /dev/null | docker import - empty`{{execute}}

En important le tar, les métadonnées supplémentaires seront créées.

`docker images`{{execute}}

Cependant, comme le conteneur ne contient rien, il ne peut pas démarrer de processus.

