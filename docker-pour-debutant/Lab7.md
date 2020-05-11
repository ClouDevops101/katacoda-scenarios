# Lab #6 - Docker Volumes

Step 1 - Créer un Dockerfile
Les images Docker commencent à partir d'une image de base. L'image de base doit inclure les dépendances de plate-forme requises par votre application, par exemple, lorsque la JVM ou le CLR est installé.

Cette image de base est définie comme une instruction dans le Dockerfile. Les images Docker sont construites sur la base du contenu d'un Dockerfile. Le Dockerfile est une liste d'instructions décrivant comment déployer votre application.

Dans cet exemple, notre image de base est la version alpine de Nginx. Cela fournit le serveur Web configuré sur la distribution Linux Alpine.

Tâche
Créez votre Dockerfile pour construire votre image en copiant le contenu ci-dessous dans l'éditeur.

`touch Dockerfile index.html`{{execute}}

Ediiter le dockerfile
Il faut selectioner le fichier dans l'éditeur et appuyer sur le button Copy to Editor

`FROM nginx:alpine COPY . /usr/share/nginx/html`{{copy}}

La première ligne définit notre image de base. La deuxième ligne copie le contenu du répertoire actuel dans un emplacement particulier à l'intérieur du conteneur.

Étape 2 - Créer une image Docker
Le Dockerfile est utilisé par la commande de génération Docker CLI. La commande build exécute chaque instruction dans le Dockerfile. Le résultat est une image Docker intégrée qui peut être lancée et exécutée votre application configurée.

La commande build prend en compte différents paramètres. Le format est docker build -t <build-directory>. Le paramètre -t vous permet de spécifier un nom convivial pour l'image et une balise, couramment utilisé comme numéro de version. Cela vous permet de suivre les images construites et d'être sûr de la version en cours de démarrage.

Tâche
Construisez notre image HTML statique en utilisant la commande build ci-dessous.

`docker build -t webserver-image:v1 .`{{execute}}

Vous pouvez afficher une liste de toutes les images sur l'hôte à l'aide d'images Docker.

L'image construite aura le nom webserver-image avec une balise de v1.

Étape 3 - Exécuter
L'image intégrée peut être lancée de manière cohérente avec d'autres images Docker. Lorsqu'un conteneur se lance, il est mis en bac à sable à partir d'autres processus et réseaux sur l'hôte. Lors du démarrage d'un conteneur, vous devez lui donner l'autorisation et l'accès à ce dont il a besoin.

Par exemple, pour ouvrir et se lier à un port réseau sur l'hôte, vous devez fournir le paramètre -p <host-port>: <container-port>.

Tâche
Lancez notre image nouvellement construite fournissant le nom convivial et la balise. Comme il s'agit d'un serveur Web, liez le port 80 à notre hôte à l'aide du paramètre -p.

`docker run -d -p 80:80 webserver-image:v1`{{execute}}

Une fois démarré, vous pourrez accéder aux résultats du port 80 via `curl docker` {{execute}}

Pour afficher les demandes dans le navigateur, utilisez les liens suivants

visitez la page à nouveau: https: // [[HOST_SUBDOMAIN]] -8080- [[KATACODA_HOST]] .environments.katacoda.com /

Vous avez maintenant un site Web HTML statique desservi par Nginx.
