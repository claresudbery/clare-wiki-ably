---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/Docker
---
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

  - Show all containers: **docker ps**

  - Look at the config for a container: **docker inspect \[container
    name\]**

  - Start, stop etc: **docker start, docker stop**

  - Remove a container: **docker rm**

  - See volumes: **docker volume ls**

  - Remove a volume: **docker volume rm**

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
    [<span class="underline">https://console.cloud.google.com/gcr/images/acme-gcr-dev/GLOBAL/burrow?project=acme-gcr-dev\&gcrImageListsize=30</span>](https://console.cloud.google.com/gcr/images/etsy-gcr-dev/GLOBAL/burrow?project=etsy-gcr-dev&gcrImageListsize=30).
    The path could have multiple components - so here’s the burrow
    produced by \#coreplatform
    [<span class="underline">https://console.cloud.google.com/gcr/images/acme-gcr-dev/GLOBAL/cdc/burrow?project=acme-gcr-dev\&gcrImageListsize=30</span>](https://console.cloud.google.com/gcr/images/etsy-gcr-dev/GLOBAL/cdc/burrow?project=etsy-gcr-dev&gcrImageListsize=30)

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
