# Lab #8 - Docker hub

## Création d'un répertoire

`mkdir currency-api`{{execute}}

## Récuperation de code

`cd currency-api`{{execute}}

`wget https://raw.githubusercontent.com/LinuxArchitects/docker-currency-api/master/Dockerfile && wget https://raw.githubusercontent.com/LinuxArchitects/docker-currency-api/master/currency-api.py && wget https://raw.githubusercontent.com/LinuxArchitects/docker-currency-api/master/requirements.txt`{{execute}}

## Voir le github d'où previent le code

visit : https://github.com/LinuxArchitects/docker-currency-api

Il y a un problème dans ce code, _pouvez-vous l'identifier ?_

## Corrgier le problème

Fait les corrections nécessaires dans le fichier en question

## Connecter vous sur docker hub en ligne de commande

`docker login`{{execute}}

## Créer un repository sur docker hub

vim https://hub.docker.com/repositories

garder la commande de push générer par docker sous le coude

`docker push <account>/<repositoy>:<tagname>`

## Builder le container avec la commande build

`docker build -t <account>/<repositoy>:latest .`

## Testez l'image docker

`docker run --name currency-mad -p 8050:5000 <account>/<repositoy>:latest`

allez sur le lien :

visitez la page : https://[[HOST_SUBDOMAIN]]-8050-[[KATACODA_HOST]].environments.katacoda.com/v1/EUR-MAD

Quelle est le taux de change euro dirham Marocain aujourd'hui ?

## Pusher l'image docker

`docker push <account>/<repositoy>:latest`{{execute}}

# Félicitation vous êtes à présent un contributeur sur la plateforme Docker