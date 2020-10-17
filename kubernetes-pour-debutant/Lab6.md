# Lab #7 - Déployment avec des fichier Yaml

Vous pouvez suivre mes cours sur Udemy
https://www.udemy.com/user/abdelilah-heddar/

De nombreuses applications nécessitent la création de plusieurs ressources, comme un déploiement et un service. La gestion de plusieurs ressources peut être simplifiée en les regroupant dans le même fichier (séparés par --- dans YAML). Par exemple:

Récuperer ce fichier Yaml

`wget https://k8s.io/examples/application/nginx-app.yaml`{{execute}}

Regarder son contenu et aprécier les différentes directive yaml du fichier

Regardez bien ce qu'il ya dans la section _kind_ et _port_
`less nginx-app.yaml`{{execute}}

Plusieurs ressources peuvent être créées de la même manière qu'une seule ressource:

`kubectl apply -fnginx-app.yaml`{{execute}}

Vous n'avez plus besoin de ces ressources :

`kubectl delete -f nginx-app.yaml`{{execute}}

Vous avez perdu votre fichier mais vous voulez faire des opération du ce déploiement comment faire ?

S'il existe plusieurs déployement sur le cluster nous pouvons selectionner celui qui nous inetresse avec les _labels_

Modifier le nom du label dans le fichier yaml :
changer app=nginx par covid=212 ou autre

et redéployer le cluster

`kubectl apply -f nginx-app.yaml`{{execute}}

Maintenant supprimer le déployement et le service du cluster

`kubectl delete deployment,services -l covid=twoonetwo`{{execute}}
