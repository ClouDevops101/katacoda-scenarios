# Lab #3 - Exposer un service

Une fois le déploiement créé, nous pouvons utiliser kubectl pour créer un service qui expose les pods sur un port particulier.

Exposez le déploiement http nouvellement déployé via kubectl expose. La commande vous permet de définir les différents paramètres du service et comment exposer le déploiement.

Tâche
Utilisez la commande suivante pour exposer le port de conteneur 80 sur la liaison de l'hôte 8000 à l'IP externe de l'hôte.

`kubectl expose deployment http --external-ip="172.17.0.54" --port=8000 --target-port=80`{{execute}}

Vous pourrez ensuite envoyer une requête ping à l'hôte et voir le résultat du service HTTP.

`curl http://172.17.0.54:8000`{{execute}}
