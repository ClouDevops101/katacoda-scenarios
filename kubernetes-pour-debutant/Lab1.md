# Lab #1 - Démarrer le cluster
Vous pouvez suivre mes cours sur Udemy
https://www.udemy.com/user/abdelilah-heddar/

## Étape 0 Combien de noeud actif

Combien de noeud dispose notre cluster

`kubectl get nodes`{{execute}}

hum ! vous avez une erreur du type

```
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```

Peut être que le cluster n'est pas démarré.

## Étape 1 - Démarrer le Cluster

Pour commencer, nous devons lancer un cluster Kubernetes.

executer la ligne de commande suivante :

`launch.sh`{{execute}}

Vous avez un message :

```
Waiting for Kubernetes to start...
Kubernetes started
```

Maintenant vous pouvez vérifier le nombre de noeud

`kubectl get nodes`{{execute}}
