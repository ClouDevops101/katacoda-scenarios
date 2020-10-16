# Lab #2 - Déployer un Pod

La commande suivante lancera un déploiement appelé http qui lancera un conteneur basé sur Docker Image katacoda/docker-http-server:latest.

`kubectl run http --image=katacoda/docker-http-server:latest --replicas=1`{{execute}}

Vous pouvez ensuite utiliser kubectl pour afficher l'état des déploiements

`kubectl get deployments`{{execute}}

Pour découvrir ce que Kubernetes a créé, vous pouvez décrire le processus de déploiement.

`kubectl describe deployment http`{{execute}}

La description comprend le nombre de répliques disponibles, les étiquettes spécifiées et les événements associés au déploiement. Ces événements mettront en évidence les problèmes et les erreurs qui auraient pu se produire.

Dans l'étape suivante, nous exposerons le service en cours d'exécution.

Mais que ce passe t'il à l'échelle du pod :

`kubectl get pods`{{execute}}

Il a des logs ce pod ?

`kubectl logs -f`{{copy}} copier / coller le nom du pod
