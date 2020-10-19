# Lab #4 - Service advanced
Vous pouvez suivre mes cours sur Udemy
https://bit.ly/UdemyAH

Avec kubectl run, il est possible de créer le déploiement et de l'exposer comme une seule commande.

Tâche
Utilisez la commande command pour créer un deuxième service http exposé sur le port 8001.

`kubectl run httpexposed --image=katacoda/docker-http-server:latest --replicas=1 --port=80 --hostport=8001`{{execute}}

Sous les couvertures, cela expose le pod via Docker Port Mapping. Par conséquent, vous ne verrez pas le service répertorié à l'aide de

`kubectl get svc`{{execute}}

Pour trouver les détails que vous pouvez utiliser

`docker ps | grep httpexposed`{{execute}}

En exécutant la commande ci-dessus, vous remarquerez que les ports sont exposés sur le pod, pas le conteneur http lui-même. Le conteneur Pause est responsable de la définition du réseau du pod. Les autres conteneurs du pod partagent le même espace de noms réseau. Cela améliore les performances du réseau et permet à plusieurs conteneurs de communiquer sur la même interface réseau.
