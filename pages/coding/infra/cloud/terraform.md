---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/Terraform
---
## Misc

  - Avoid iron bindings

  - State file is used to map code to actual stuff

  - People use it to integrate with other projects - it’s like doing
    integration in the database

  - Instance templates kind of create a stamp that you can use to create
    lots of different instances with the same characteristics

  - Everything is scoped to a project = an infrastructure stack in an
    environment

  - In GCP, all resources are scoped to projects
    
      - Using projects by scoping them to infrastructure stacks in an
        environment
    
      - There are different instances of an instance template in each
        project, but the template is generated by code
    
      - By “terraform resource” we mean a thing that is defined by code,
        that lives in the cloud
    
      - Eg logstash\_instances.tf:
        
          - First line: resource "google\_compute\_instance\_template"
            "logstash"
        
          - This is a resource of type
            google\_compute\_instance\_template that has a name of
            logstash
    
      - Instance template documentation - get there by clicking on link
        in VS Code
        ([<span class="underline">https://www.terraform.io/docs/providers/google/r/compute\_instance\_template.html</span>](https://www.terraform.io/docs/providers/google/r/compute_instance_template.html))
    
      - Reference to a variable: project = "${ var.project }"
        
          - All variables are defined in variables.tf (by convention -
            not necessarily)
        
          - They can have defined types, eg list - the default type is
            string
    
      - Generally have several resources per file - grouped logically eg
        logstash
    
      - This refers to an attribute on another resource:
        instance\_template =
        "${google\_compute\_instance\_template.logstash.self\_link}"
        
          - So a.b.c where a is the resource type, b is the name, and c
            is an attribute
        
          - \! attribute not the same as an argument\!
        
          - Attributes are often computed values - a value that, eg,
            might come from cloud API after the resource has been
            created
        
          - Arguments are the things you see in the .tf file (aka
            manifest - Obs team are calling them Teraform plans but
            that’s not quite right)
        
          - Self\_link is a GCP concept - basically a unique ID like a
            resource URI
    
      - A module is a way of reusing code across multiple projects

  - Terraform reads everything in and compies a graph - no entry point

  - Terraform syntax:
    [<span class="underline">https://www.terraform.io/docs/configuration/syntax.html</span>](https://www.terraform.io/docs/configuration/syntax.html)

  - Terraform is an infrastructure definition tool whereas Chef (etc)
    are configuration management tools

  - See **closed indices:**
    <https://docs.google.com/document/d/1eeEXpBgsuWIIt_teRYAIbYxY9Zf7sdQNC6BKlw9BPVg/edit#heading=h.gjdgxs>
    for some useful Terraform stuff

## Creating a new project

  - Install terraform and hub:
    
      - brew install terraform
    
      - brew install hub

## Deployment in Jenkins

  - Terraform pipeline:
    
      - This is where you run terraform
    
      - Steps:
        
          - Click Back to Project (on left) (if applicable, ie you just
            did a deployment)
        
          - Click Build with Parameters (on left)
        
          - Fill in TerraformWorkdir
        
          - Select correct branch
        
          - Select “plan” to see results of deployment without actually
            deploying
        
          - Select “apply” to actually deploy
        
          - Click Build
        
          - To view console output: On the left hand side, under Build
            History, , mclick the flashing blue dot next to the build
            number
    
      - Every time you do a Plan or an Apply it refreshes the state
        that’s stored in the bucket (a GCP thing - like S3) by
        interrogating APIs to see if current state has changed since the
        las time the bucket was updated

## Local variables

  - This is a bit of a misnomer

  - It’s more like the difference between variable and constant

  - You can have a variable defined in a .vars file and assigned in
    terraform.tfvars, but you can only assign a constant value to it

  - If you want to assign an expression to a variable...
    
      - Eg **couple\_var = $concat(var.clare, var.ally)**
    
      - ...then you need to use locals.

  - The scope of the resulting thing will actually be the same as
    anything defined in a variable section, hence the use of the word
    “local” is misleading.

## Connecting to hosts after provisioning

  - the only way would be via gcloud because chef doesn’t run on those
    machines - chef is the main way we put our standard stuff on, eg the
    thing that hooks in LDAP to authentication - so you can ssh in with
    your user
    
      - This: **gcloud --project acme-logging-dev compute ssh
        logstash-cg9l --zone us-central1-a --internal-ip**
    
      - To find the hostname so you can gloud ssh in, run this command:
        **gcloud compute instances list**

  - If you use gcloud ssh, you can add this to your fish script to make
    it simpler:
    
      - function gsh --argument hostname
    
      - gcloud compute ssh --internal-ip $hostname
    
      - end
    
      - This has the effect of replacing (on the command line, when
        typing) “gcloud compute ssh --internal-ip” with “gsh”
    
      - Or this:
    
      - function gssh() {
    
      - IFS='@' read -ra ARGS \<\<\< "$1"
    
      - INST="${ARGS\[0\]}"
    
      - PRJ="${ARGS\[1\]}"
    
      - gcloud compute ssh --internal-ip $INST --project $PRJ
    
      - }

## Running terraform tests

  - First this: bundle install --path vendor/bundle

  - See rakefile for tasks that have been configured.

  - Acceptance tests (using inspec?):
    
      - Not really acceptance tests\! More like, asserting that
        resources exist etc

  - Spec tests (using rspec?):
    
      - End-to-end tests
    
      - This: **bundle exec rake tests:spec**

## General Test thoughts

  - Because so much of infra is declarative, you are just asserting that
    what you declared has been declared

  - Either that or you are testing other people’s frameworks (eg
    Terraform, chef etc)

  - If you have logic in your terraform, it’s worth it

  - Unit tests: You specify resources you DON’T want to change, then it
    warns you if they change

  - General agreement that the best way to do testing for infrastructure
    is more like the stuff we have done with an end-to-end test, some
    kind of smoke test, checking end points etc, doing things like
    defining readiness: assert it should be listening on a port, and if
    it is then it is ready.