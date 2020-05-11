Les processus des conteneurs ne sont que des processus Linux normaux avec une configuration supplémentaire appliquée. Lancez le conteneur Redis suivant pour voir ce qui se passe sous le capôt..

`docker run -d --name=db redis:alpine`{{execute}}

Le conteneur Docker lance un processus appelé redis-server. Depuis l'hôte, nous pouvons afficher tous les processus en cours d'exécution, y compris ceux démarrés par Docker.

`ps aux | grep redis-server`{{execute}}

Docker peut nous aider à identifier les informations sur le processus, y compris le PID (Process ID) et PPID (Parent Process ID) via `docker top db`{{execute}}

Qui est le PPID? Utilisé `ps aux | grep <ppid>`{{execute}}to find the parent process. Likely to be
pour trouver le processus parent. Probablement être _Containerd_.

install pstree on ubuntu debain
`apt-get install psmisc`{{execute}}

La commande pstree répertorie tous les sous-processus. Voir l'arborescence des processus Docker à l'aide de `pstree -c -p -A $(pgrep dockerd)`{{execute}}

Comme vous pouvez le voir, du point de vue de Linux, ce sont des processus standard et ont les mêmes propriétés que les autres processus de notre système.

## Process Directory

Linux n'est qu'une série de fichiers et de contenus magiques, ce qui le rend amusant à explorer et à naviguer pour voir ce qui se passe sous les couvertures, et dans certains cas, changer le contenu pour voir les résultats.

La configuration de chaque processus est définie dans le répertoire / proc. Si vous connaissez l'ID de processus, vous pouvez identifier le répertoire de configuration.

La commande ci-dessous répertorie tout le contenu de / proc et stocke le PID Redis pour une utilisation future.

`DBPID=$(pgrep redis-server) echo Redis is $DBPID ls /proc`{{execute}}

Chaque processus a ses propres paramètres de configuration et de sécurité définis dans différents fichiers. `ls /proc/$DBPID`{{execute}}

Par exemple, vous pouvez afficher et mettre à jour les variables d'environnement définies pour ce processus. `cat /proc/$DBPID/environ`{{execute}}

`docker exec -it db env`{{execute}}
