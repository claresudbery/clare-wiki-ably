---
layout: page
location: pages/coding/infra/cloud/gcp/leaf
permalink: /pages/coding/infra/cloud/gcp/GCP-Notes
---
## Misc

  - To get at GCP and see our infrastructure there:
    
      - Go to console:
        [<span class="underline">https://console.cloud.google.com</span>](https://console.cloud.google.com)
    
      - Select your project from the dropdown at the top (or search for
        it)
    
      - Then click Compute Engine on the left
    
      - You’ll see the nfs-server instance listed

  - See also **closed indices:**
    <https://docs.google.com/document/d/1eeEXpBgsuWIIt_teRYAIbYxY9Zf7sdQNC6BKlw9BPVg/edit#heading=h.gjdgxs>

  - To ssh into a GCP server:
    
      - Install gcloud suite - **brew cask install google-cloud-sdk**
        
          - This to see what has been installed using cask: **brew cask
            list**
        
          - This to see what has been installed using cask: **brew cask
            list**
        
          - **For Linux:
            [<span class="underline">https://cloud.google.com/sdk/docs/quickstart-redhat-centos</span>](https://cloud.google.com/sdk/docs/quickstart-redhat-centos)**
    
      - Use google tool set
    
      - Cmd: **gcloud compute** **ssh --internal-ip nfs-server**
        
          - That will download ssh key from google
        
          - “**nfs-server**” is the name of the instance in GCP
    
      - You’ll get prompted to do various things with credentials. When
        it asks you to set project the project name is
        acme-thingelk-sandbox: **gcloud config set project
        acme-thingelk-sandbox**
    
      - See **closed indices:**
        <https://docs.google.com/document/d/1eeEXpBgsuWIIt_teRYAIbYxY9Zf7sdQNC6BKlw9BPVg/edit#heading=h.gjdgxs>

## GCP vs GCE

  - GCP is like saying “AWS” whereas GCE is like saying “EC2”

  - GCE is not a data centre for our context, it’s just a logical place
    where we have machines

## gsutil

  - See here:
    [<span class="underline">https://cloud.google.com/storage/docs/gsutil</span>](https://cloud.google.com/storage/docs/gsutil)

  - “gsutil is a Python application that lets you access Cloud Storage
    from the command line.”

  - Used when working on closed indices

## Finding / logging into instances

  - This: **gcloud compute instances list --project acme-logging-prod |
    grep logstash**

  - Gcloud compute docs:
    [<span class="underline">https://cloud.google.com/compute/docs/gcloud-compute/</span>](https://cloud.google.com/compute/docs/gcloud-compute/)

  - Find instance in GCP:
    
      - From root url select observability-logging-dev project
    
      - Then select Compute Engine over on left
    
      - \! Although the project is called observability-logging-dev in
        the dropdown, it’s actual name on the command line is
        acme-logging-dev

<!-- end list -->

  - To ssh into an instance:
    
      - Use google tool set
    
      - Install gcloud suite - **brew cask install google-cloud-sdk**
        
          - This to see what has been installed using cask: **brew cask
            list**
        
          - This to see what has been installed using cask: **brew cask
            list**
        
          - **For Linux:
            [<span class="underline">https://cloud.google.com/sdk/docs/quickstart-redhat-centos</span>](https://cloud.google.com/sdk/docs/quickstart-redhat-centos)**
    
      - Cmd: **gcloud compute** **ssh --internal-ip nfs-server**
        
          - That will download ssh key from google
        
          - “**nfs-server**” is the name of the instance in GCP
    
    <!-- end list -->
    
      - You’ll get prompted to do various things with credentials. When
        it asks you to set project the project name is
        acme-thingelk-sandbox:
        
          - Change project: **gcloud config set project
            acme-thingelk-sandbox**
        
          - Or just include the project in the ssh command: **gcloud
            compute** **ssh --internal-ip nfs-server** **--project
            acme-thingelk-sandbox**

## Firewalls

  - How they work:
    
      - You can have ingress rules (define traffic coming IN to a
        server)
        
          - So for instance, the rule which allows servers to connect to
            the NFS server is an INGRESS rule for the nfs server
    
      - Alternatively you get egress rules which are about traffic
        coming OUT of a server
    
      - You can add target tags and source tags to a rule
        
          - Target tags are the tags that a server needs to have in
            order to have this rule applied
        
          - So for instance, for the ingress rule, the target is the NFS
            server that traffic is coming INTO
            
              - The source is the servers that ae sending traffic to the
                target
            
              - Presumably for egress rules it’s the other way round
        
          - This means that if you give your server the relevant tag,
            the rule will then apply to your server
        
          - To apply a tag to a server, set tags in your Terraform
            
              - Eg in gce.tf, in the section for the nfs-server compute
                instance, we have the line **tags =
                \["observe-thingelk"\]**
            
              - Or do it manually in GCP by goign Compute Engine (on the
                left) | VM Instances, selecting an instance then
                clicking edit at the top, then filling in the Network
                tags section.

## Metadata API

  - You can get the project of whatever gcp instance you’re logged into
    via gcp metadata: **curl -s
    "http://metadata.google.internal/computeMetadata/v1/project/project-id"
    -H "Metadata-Flavor: Google"**
    
      - Project = A way of separating out infrastructure that relates to
        different things from each other

  - The whole metadata API is great, more of it here:
    [<span class="underline">https://cloud.google.com/compute/docs/storing-retrieving-metadata</span>](https://cloud.google.com/compute/docs/storing-retrieving-metadata)
