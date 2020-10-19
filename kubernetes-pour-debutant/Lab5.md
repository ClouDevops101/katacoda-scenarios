# Lab #5 - Scale Pods
Vous pouvez suivre mes cours sur Udemy
https://bit.ly/UdemyAH

Avec notre déploiement en cours, nous pouvons désormais utiliser kubectl pour faire évoluer le nombre de répliques.

La mise à l'échelle du déploiement demandera à Kubernetes de lancer des pods supplémentaires. Ces pods seront ensuite automatiquement équilibrés en charge à l'aide du service exposé.

Tâche
L'échelle de commande kubectl nous permet d'ajuster le nombre de pods en cours d'exécution pour un déploiement particulier ou un contrôleur de réplication.

`kubectl scale --replicas=3 deployment http`{{execute}}

En listant tous les pods, vous devriez voir trois en cours d'exécution pour le déploiement http `kubectl get pods`{{execute}}

Une fois que chaque pod démarre, il est ajouté au service d'équilibrage de charge. En décrivant le service, vous pouvez afficher le point de terminaison et les pods associés qui sont inclus.

`kubectl describe svc http`{{execute}}

Faire des demandes au service demandera dans différents nœuds de traiter la demande.

`watch curl http://172.17.0.54:8000`{{execute}}

regarder le nom du pod qui changer à chaque fois ce qui signifie que votre requet est traité alternativement par different pods : _Loadbalancing_

Vous avez un nombre imprédictible d'utilisateur considérez la commande autoscale qui s'utilise de cette façon :

`kubectl autoscale deployment http --min=2 --max=4`{{execute}}
