---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/Kubernetes
---
## Overview

  - In the cloud use GKE – Google’s hosted Kubernetes thing

## Clusters and namespaces 

  - Each GCP project has one or more clusters. Each cluster has one or
    more namespaces.
      - Typically (for Acme, I don’t know about elsewhere) there will be
        separate projects for dev and prod, each with their own cluster.
  - Select **Kubernetes Engine** on the left in GCP Console
  - Each cluster has a certain number of nodes
      - Each node has XGb of RAM, and X CPUs
      - What’s the definition of a CPU? It’s woolly - something like one
        hyperthreaded CPU thingy
  - To deploy to a different namespace or cluster, just change namespace
    / cluster and then apply your manifest(s)
  - We have our own namespace within the cluster
      - You can use **kubectl** to specify which namespace you will be
        working in (see Changing namespace below), but be aware that
        this is still within one cluster. If you want to switch clusters
        you have to set your config up - see [Kube Config section below](#kube-config-adding-clusters).
      - There’s a quota (for memory and CPU) on the namespace which
        doesn’t kill anything but stops you from running things
      - The quota determines how much of the cluster we are able to use
      - To see the pods in our namespace, run **kubectl get po** or use
        **k9s**      
  - If you want to see what namespaces are available in a cluster:
    **kubectl get namespace**
  - If you want to see what clusters are available:
      - I haven’t found a way to do it on command line, but if you want
        to see which clusters YOU have configured in your Kube config,
        you can do **kubectl config get-contexts**
      - Each GCP project has its own clusters
          - So for instance Acme-syseng-gke-dev project has just one
            cluster
      - So one way to see clusters is via GCP UI - select a project,
        then Kubernetes Engine on the left, then select clusters
  - If you want to access multiple clusters from the command line:
      - See [Kube Config section below](#kube-config-adding-clusters)
      

## Kube Config / Adding Clusters
  - Use your config to do things like access multiple clusters from the
    command line
  - If you want to see what you have set up in your config:
      - Cmd: **kubectl config view**
  - [Kube Config docs](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-context-and-configuration)
  - Access multiple clusters from the command line:
      - To add a cluster to your Kube config:
          - This: **gcloud beta container clusters get-credentials
            syseng --region us-central1 --project Acme-xxxx**
      - Beware there are two commands that look v similar but are not
        the same:
          - This changes the current context: **kubectl config set
            current-context
            gke\_Acme-xxxx\_us-central1\_yyyy**
          - This changes the current *namespace* in what has already
            been set as the current context: **kubectl config
            set-context --current --namespace=your-namespace**
      - To see what clusters you have configured and what namespace
        they’re set to: **kubectl config get-contexts**
      - More info:
          - [Kube config / multiple clusters](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)

## Changing namespace

  - Naked **kubectl** commands are all in default namespace
  - You can specify namespace: **kubectl get po --namespace obsv-tools**
  - When we did the long command containing **get-credentials** (see
    below or elsewhere in this section), that downloaded a file for us
    called **kube.cfg** - and one of the things it contains is our
    current namespace
  - We never edit that file directly but we do it using **kubectl** -
    but it’s not pretty, and we want to do it all the time
  - So instead, use the Krew package manager (see below) to get the
    **change-ns** plugin for **kubectl**
  - Once that’s installed you can change namespace more easily:
    **kubectl change-ns obsv-tools**

## Deployments and pods and replica sets

  - At the centre of Kubernetes you have containers, they are deployed
    as pods
      - In fact one pod can contain several containers - for instance
        burrow contains burrow and burrow-exporter.
  - You can deploy a pod and it will start, but if it stops nothing will
    restart it. And there will only be one instance.
      - You can have a manifest with **kind: Pod** at the top, and
        that’s what you’ll get if you do this.
      - Instead, make your manifest be **kind: Deployment** and use the
        replicas value to specify how many replicas you want. Just by
        making it a Deployment you ensure it will be replaced if it
        dies.
      - Deployments:
        [<span class="underline">https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/\#deploymentspec-v1-apps</span>](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#deploymentspec-v1-apps)
      - That’s the difference between manifest and deployment: A
        deployment is a particular kind of manifest, and not all
        manifests are deployments
      - a manifest is any description of a Kubernetes resource
      - Note that you can have several manifests in one yaml file - for
        instance burrow.yaml currently contains manifests of the
        following kinds: Deployment, Service, ConfigMap, Ingress.
  - Because we often want more than one copy and we want them to stay
    alive, we need a replica set
      - A replica set will keep a certain number of replicas alive all
        the time
      - You can see replica sets with **kubectl get rs**, and you’ll see
        there that there are several replica sets for burrow - I think
        you get a new replica set every time you delete / restart
      - In the deployment manifest you see **replicas: 1** and this
        means we’re saying we will only ever only have one instance at a
        time.
      - The deployment manifest also contains constraints for things
        like CPU and memory. If these conditions are broken, Kube will
        restart the pod.
  - Because we want to update our application, we have a deployment (a
    particular type of manifest) - which decides how we’re going to roll
    out our changes
      - There is a 1-\* relationship between Deployment and ReplicaSet.
        Each time you change the Deployment it creates a new ReplicaSet.
        If for example the Deployment is doing a rolling update, it will
        progressively ramp up the instances in the new ReplicaSetand
        ramp down the instances in the old ReplicaSet. If the new
        instances failed to start correctly - it would ramp them back up
        in the old ReplicaSet.
  - The default is to do a rolling update - create new replica set, set
    the desired state to 1, bring up the new one, downgrade the previous
    one
  - All this can be controlled in detail as much as you like
  - Basic compute model for long running services

## Connecting to a cluster

  - Go here:
    <https://console.cloud.google.com/kubernetes/list?project=xxxx>

  - Click the Connect button, copy the text: **gcloud beta container
    clusters get-credentials syseng --region us-central1 --project
    xxxx**

  - Run that in your terminal

  - Now use kubectl for everything - see below

## Using **kubectl** on the command line

  - Kube (shorthand for Kubernetes) represents everything as a set of
    RESTful resources

  - To make a change, we save the state of a system we’d like, push to
    API server which stores it in a database - try to make sure world
    always represents what we’ve told it we want it to be

  - Everything we do is via API using **kubectl**
    
      - Common commands are get, create, describe (another version of
        get), delete

  - Everything happens inside namespaces

  - See below for commands

## K9s

  - Useful for looking at all pods in a namespace

  - To install: **brew install derailed/k9s/k9s**

  - Then to run, just **k9s** on command line

  - Because it uses brew to install, it’s easier to install on laptop -
    otherwise you have to build from source code

  - Note that when you hit **d** to do a describe on a pod, the
    formatting / syntax of the result is slightly different than if you
    do **kubectl describe po \[pod-name\]**

## Kubectl API commands: 

  - See nodes: **kubectl get nodes**

  - See pods: **kubectl get po**
    
      - Shows you all the pods

  - See deployments (defined in deployment manifests generally named
    deploy.yml): **kubectl get deploy**

  - See replica sets: **kubectl get rs**

  - See all namespaces in the cluster: **kubectl get namespace**

  - For deleting pods:
    
      - See separate section below

  - If you do a **kubectl** **describe** instead, you get a whole lot
    more detail
    
      - Same command but **describe** instead of **get**
        
          - Eg **kubectl describe po** or **kubectl describe rs**
        
          - You really want to specify an individual id though
            (**kubectl describe po lodash-monitor-1572429600-fqjp2**),
            otherwise you’ll get ALL the pods or ALL the replica sets.
        
          - Note that the formatting / syntax of the result is slightly
            different from when you hit **d** on a pod in **k9s**
    
      - Eg: run **kubectl get rs** to get ids of replica sets, then
        **kubectl describe rs** to get full details on all replica sets,
        or **kubectl describe rs apidevicemetrics-597b79847** to get
        full details on one replica set - where
        **apidevicemetrics-597b79847** is the rs id

## Deleting K8s Pods

  - Sometimes **kubectl delete** **pod \[podname\]** or using **kill**
    from k9s isn’t enough

  - Things to try (you could also try adding **--all-namespaces** to any
    of these):
    
      - Check for replica sets using **kubectl get rs**
    
      - Force the delete: **kubectl delete pod --grace-period=0
        \[pod-name\]**
    
      - Delete the deployment instead of the pod
        
          - Check for deployments using **kubectl get deployments**
        
          - Cmd: **kubectl delete deployment \[deployment name\]**
        
          - Note that you probably just want the main name, without any
            suffixes - ie **grafana-backup** instead of
            **grafana-backup-1574161800-kxnzw**
    
      - Check for any jobs that are recreating your pod: kubectl get
        jobs
    
      - Check for / delete any relevant replication controllers:
        
          - Cmd: **kubectl get replicationcontroller**
        
          - Cmd: **kubectl delete replicationcontroller \[name\]**

## Krew

  - Krew commands:
    
      - Download and use Krew:
        [<span class="underline">https://github.com/kubernetes-sigs/krew</span>](https://github.com/kubernetes-sigs/krew)
        - it’s a package manager for **kubectl** plugins
    
      - **kubectl krew search**
        
          - Shows you all the plugins
    
      - Install plugin: **kubectl krew install change-ns**
        
          - where **change-ns** is a plugin you want to install

## Helm

  - Tool for templating deployments in Kubernetes – a way of writing
    Kubernetes config – in theory supposed to make it easier, might not
    do in practice?

## Cloudbuild and k8s-tools

  - In the k8s-tools repo
    (<https://github.com/claresudbery/Infra-Scripts/tree/master/k8s-tools>),
    all the folders (eg **ci-testing**, **grafana-backup**,
    **hound-to-graphite**), they all represent projects

  - Each project is self contained in the relevant folder

  - They all contain a cloudbuild.yaml or a cloudbuild.libsonnet

  - There is also, in the root, a recursive\_cloudbuild.yaml
    
      - If it finds a cloudbuild libsonnet, it will first compile it to
        yaml before beginning a build

  - Inside each cloudbuild yaml / cloudbuild.libsonnet:
    
      - Build an image - eg docker image
    
      - Each step in there runs in parallel by default
        
          - There is an array called steps which defines the steps
        
          - a dash represents an item in an array
        
          - the first line of the array is just the first item in the
            array, NOT the name of the array
            
              - so the point is that the dash just represents ONE item
                in an array, it’s not pointing at the start of an array
        
          - It’s just that each of the items in the steps array is
            itself an array
        
          - At the time of writing, the first item in each of the steps
            sub-arrays was called args - it’s better if you put the id
            as the first item, just cos it makes it easier to read (it
            doesn’t make any semantic difference)
    
      - waitFor tells you to run synchronously, so one step will run
        after another
    
      - if you convert the yaml to json (using jq) it’s sometimes easier
        to read

  - Pushing your code to master causes a cloud trigger which triggers a
    cloud build
    
      - Via a git hook
    
      - Cloud builds are visible here:
        <https://console.cloud.google.com/cloud-build/builds?project=><span class="underline">xxxx</span>
        
          - The docker file gets built and pushed to GCR (Google
            Container Registry) and then the manifests are applied to
            the cluster.
        
          - Docker images visible in GCR here:
            <https://console.cloud.google.com/gcr/images/acme-gcr-dev?project=><span class="underline">xxxx</span>
    
      - For cloud builds to trigger, they must have as their source
        either a github repo - public or private - on gitbucket.com or
        github.com, or in Google cloud source - so not git enterprise
    
      - So we don’t need a hook that sends something to cloud build,
        instead we need something that syncs our repo over in github
        enterprise over to cloudsource in GCP
    
      - There is a whole thing called ghe-mirror (GithubEnterprise
        mirror) which syncs things over to a corresponding CloudSource
        repo
    
      - You can use kubectl to see a ghe-mirror service running in K8S
    
      - We’re not using the terraform module (ghe-mirror something
        something) although we are using some of the code that comes out
        of it cos Rajat sorted that out
    
      - The url for the hook is a k8s url
    
      - Pushing to master represents a deployment of the code
    
      - To set up the hook with the mirror, in the terraform repo in
        development/engineering/acme-syseng-gke-dev (there’s one for
        prod too), you’ll see cloud-builder.tf containing a
        google\_cloudbuild\_trigger resource
        
          - You can see the k8s-tools trigger here:
            <https://console.cloud.google.com/cloud-build/triggers/xxxx?project=><span class="underline">xxxx</span>
        
          - The trigger itself is called “Push to master branch (Deploy
            the k8s monorepo)”
    
      - There’s a real benefit to using this internal google build tool
        cos of all the access to google stuff

  - If a project doesn’t contain a cloudbuild.yaml or
    cloudbuild.libsonnet, that means the recursive build will skip that
    project
