---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/Docker
---

## Links

- [Made Tech Docker Guide](https://learn.madetech.com/guides/11-Docker/)
- [Docker Hub](https://hub.docker.com/) for Docker images
- [Dockerfile Docs](https://docs.docker.com/engine/reference/builder/) 
* [Docker commands](https://docs.docker.com/engine/reference/run/)
* [Summary of common Docker commands](https://www.edureka.co/blog/docker-commands/)
- [Docker Compose Docs](https://docs.docker.com/compose/compose-file/)
- [Dockerising a Sinatra app](https://www.codewithjason.com/dockerize-sinatra-application/)
  - See [my sinatra-docker repo](https://github.com/claresudbery/sinatra-docker) for an example created following the above tutorial. It's deployed on Heroku [here](https://sinatra-docker.herokuapp.com/).
  - See [my tic-tac-toe repo](https://github.com/claresudbery/tic-tac-toe-kata) for another example of a Dockerised Sinatra app. It's deployed on Heroku [here](https://tic-tac-toe-docker.herokuapp.com/tictactoe).
- [Dockerising a .Net app](https://docs.microsoft.com/en-us/dotnet/core/docker/build-container?tabs=windows)
  - [dotnet docker hub](https://hub.docker.com/_/microsoft-dotnet)
  - [Deploying an ASP.Net dockerised app to Heroku](https://medium.com/@vnqmai.hcmue/deploy-asp-net-core-to-heroku-for-free-using-docker-bd6d6fc161ae)
  - My heroku-deployed dockerised ASP.Net app:
    - [source code](https://github.com/claresudbery/dotnet-docker-clare) (check readme for notes on things I had to do to get it working)
    - [deployed app](https://dotnet-docker-clare.herokuapp.com/)
  - I also have a heroku-deployed dockerised .Net Core web API:
    - [source code](https://github.com/claresudbery/webapi-docker) (check readme)
    - [deployed API](https://webapi-docker.herokuapp.com/shiny)
- [Deploying a Docker container to Heroku](https://devcenter.heroku.com/articles/container-registry-and-runtime)

## Misc

  - Run a bash shell in your docker container: **docker exec -it
    \[container name\] /bin/bash**

  - Alex: “I use this for when I make too much trash in docker and need
    to take it out”:
    
      - Cmd: **docker ps -a | grep -v COMMAND | awk '{ print $1 }' |
        xargs docker rm -f**
    
      - Documentation on docker commands:
        [<span class="underline">https://docs.docker.com/v17.09/engine/reference/commandline/build/\#options</span>](https://docs.docker.com/v17.09/engine/reference/commandline/build/#options)

## Docker commands

- Show all containers: `docker ps`
- Look at the config for a container: `docker inspect [container  name]`
- Start, stop etc: `docker start`, `docker stop`
- Remove a container: `docker rm`
- Exit a Docker Container: **Ctrl + C**
- See volumes: `docker volume ls`
- Remove a volume: `docker volume rm`
- This:	`docker images` - shows you all current images
- This:	`docker logs [image name]` – shows you the output from the container
- This:	`docker run help`
  -	To get syntax of a command
- This:	`docker run –help`
  -	gives you documentation on the docker run command
  -	!! The way this is listed is slightly confusing
    -	for instance, it says “-d, --detach” and then there are a ton of other commands prefixed with –
    -	the other commands are unrelated!
   -	What it’s actually telling you is that “-d” is a shortcut for “--detach”. Everything that comes after that is just switches beginning with d that do not have shortcuts
- This:	`docker-machine ssh`
  -	Get yourself inside the docker-machine, which is run on a VirtualBox VM running Linux
    -	In fact you can run up VirtualBox manager and you will see the sonar docker machine listed in there
    -	This is useful because you can do things like increase the amount of RAM available
    -	You need about 4Gb RAM here!
  -	Otherwise you’re outside the machine
- This:	`docker tag 72bdc47a77cf demo:latest`
  -	Tags an image
  -	the id is the image id, then ‘demo’ will be the repository and ‘latest’ will be the tag
-	To run a container but mapping port 80 to port 3000:
  -	`docker run -d -p 80:3000 demo:latest`
  -	This means you can now just go to localhost in the browser

## Docker tags

  - Docker tags are effectively names.
    
      - The tag is a way of identifying an image. Locally, it will have
        a specific image id - and if you do docker images you can see
        all the tags that correspond to that image locally.
    
      - But docker will interpret the tag as a way of pulling (or
        pushing) an image.

  - We often see pairs of docker commands that look like this:
    
      - Cmd: **docker build -t burrow burrow**
    
      - Cmd: **docker tag burrow gcr.io/acme-gcr-dev/burrow:latest**
    
      - The **-t** flag on the docker build command is *tagging* the
        build as **burrow**
    
      - The **docker tag** command is saying, “OK, I just created an
        image called (aka tagged) **burrow**, but now I’ve decided to
        take that image - which I’m referring to by it’s current tag
        (the first param), and I’m applying a *second* tag to it (the
        second param)“

  - Docker images are stored in registries. There is docker hub, amazon
    ecr, google gcr, quay.io or you can host your own. When you push an
    image to a repository you specify the tag you’re pushing. Docker
    uses this tag to identify where to push the image - essentially, the
    first component (bit before the first slash) specifies the registry
    you’re pushing to. Everything after that is registry dependent.

  - Apart from the bit after the colon - which is the version label.

  - In the case of GCR (Google Container Registry), the second component
    specifies the project and then the rest of the main part specifies
    the path under that project.

  - Google GCR uses the rest of the path to locate the image within the
    project. So burrow is at
    [<span class="underline">https://console.cloud.google.com/gcr/images/yourid/GLOBAL/burrow?project=yourid\&gcrImageListsize=30</span>](https://console.cloud.google.com/gcr/images/yourid/GLOBAL/burrow?project=yourid&gcrImageListsize=30).
    The path could have multiple components - so here’s the burrow
    produced by \#coreplatform
    [<span class="underline">https://console.cloud.google.com/gcr/images/yourid/GLOBAL/cdc/burrow?project=yourid\&gcrImageListsize=30</span>](https://console.cloud.google.com/gcr/images/yourid/GLOBAL/cdc/burrow?project=yourid&gcrImageListsize=30)

  - Which you can see is the in cdc folder.

  - Just to complicate things, there are a whole host of special rules
    around pushing to Docker Hub (you don’t need to specify the
    docker.io prefix) for backwards compatibility reasons. None of those
    will affect us though as we’re always going to push to gcr.io

  - How docker obtains permissions to push are specified in the
    .docker/config.json file in your home directory. You will see a
    whole bunch of entries under the credHelpers key which indicate that
    the gcloud tool should be used to obtain the required token (for the
    various gcr.io registry names)
## Get into a docker container from outside and run commands

  - To get into a docker container from outside:
      - This: **sudo docker ps**
      - Then this (fill in id): **sudo docker exec –it \[id\]
        /bin/bash**

## Run docker containers in Windows Parallel on a Mac

(This may be out of date.)

You may need to enable Nested Virtualization.

You only need to do this if you are running Windows Parallels on a Mac. You will have to enable nested virtualization if you want to run docker containers (because they use VirtualBox). To do this:

* Shut down your Windows Parallels machine 
* Go to Parallels. Now from the very top menu, choose Actions | Configure | Hardware | CPU & Memory | Advanced Settings | Enable nested virtualization
* Now start up Windows again.
* *Troubleshooting*: If you see this error when you run commands like docker-machine create: “This computer doesn't have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory”
  * You need to either enable VT-X/AMD-v in the bios as per the error message,
  * Or if you are running Windows Parallels on a Mac, you need to enable nested virtualization in Windows Parallels:
  * Shut down your Windows Parallels machine 
  * Go to Parallels. Now from the very top menu, choose Actions | Configure | Hardware | CPU & Memory | Advanced Settings | Enable nested virtualization
  * Now start up Windows again.