Création d'une image vide
Comme une image n'est qu'un fichier tar, une image vide peut être créée à l'aide de la commande ci-dessous.

`tar cv --files-from /dev/null | docker import - empty`{{execute}}

En important le tar, les métadonnées supplémentaires seront créées.

`docker images`{{execute}}

Cependant, comme le conteneur ne contient rien, il ne peut pas démarrer de processus.



Step 1 - Create Dockerfile
Docker Images start from a base image. The base image should include the platform dependencies required by your application, for example, having the JVM or CLR installed.

This base image is defined as an instruction in the Dockerfile. Docker Images are built based on the contents of a Dockerfile. The Dockerfile is a list of instructions describing how to deploy your application.

In this example, our base image is the Alpine version of Nginx. This provides the configured web server on the Linux Alpine distribution.

Task
Create your Dockerfile for building your image by copying the contents below into the editor.

`vim Dockerfile`{{execute}}

```Copy to EditorFROM nginx:alpine
COPY . /usr/share/nginx/html```
The first line defines our base image. The second line copies the content of the current directory into a particular location inside the container.


