---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/GoCD
---

## Example Pipeline Overview

  - There's a spreadsheet [describing the Cadogan GoCD pipelines in detail here](https://docs.google.com/spreadsheets/d/1SBV5Pe9S03844uzPHPovMXN7q9Fx9r4SVKRf9QpoSvk/edit#gid=999853802) (only available to Clare).
  - Generally pipelines are initially copying stuff into S3 artefacts
    buckets, and then copying from there into final buckets, which are
    pointed at either by Cloudfront distributions or EBS environments.
    
      - The pipelines which deploy to artefacts buckets are
        automatically triggered
    
      - The pipelines which copy from artefacts into main buckets are
        mostly manual (apart from dev)
    
      - QA, Dev and Showcase will be triggered by / pull stuff from
        master branch.
    
      - Preproduction and Production will be triggered by / pull stuff
        from release branch.

  - Branches:
    
      - Typically we only have 2 branches: master and release
        
          - Master is used for dev, qa and showcase
        
          - Release is used for pre-prod and prod
        
          - Regression tests are done on pre-prod
    
      - Backend only has 3 envs: dev, preprod and prod
    
      - Frontend always has 5 envs: dev, qa, showcase, preprod, prod
    
      - Pipelines are grouped into pipeline groups
    
      - Jobs always run in parallel
        
          - They are the most granular level
    
      - See pipeline | settings | automatic pipeline scheduling to
        tell whether a pipeline is automatic or not
        
          - Also see Settings | Materials | any git repos | “Poll for
            new changes”

## Showing / Hiding Pipelines

  - To see hidden pipelines, use the Personalise menu in Go (top right)
  - It’s a good idea to hide old pipelines so you don’t use them by
    accident – but even better is to delete them\!

## Adding New Go Users / Removing Users

  - SSh into the Go server
      - See SSH Access to Go Server, below
  - Open the user file:
      - First you have to open a new shell with admin privileges: **sudo
        su**
      - Then go to the right folder: **cd /var/go**
      - Now open the user file: **vi user\_file**
  - Now, in a separate Terminal tab (Cmd + T) on your main Mac, create
    an SHA for your password (replace “password” with the actual
    password):
      - Like this: **slappasswd -h {SHA} -s password**
  - Now add your user name and password SHA to the user file
      - Press **i** to get into insert mode
      - Then add your name, a colon and your SHA, like this:
        **clare:{SHA}3vKr3vKr3vKr3vKr3vKr3vKr3vK=**
          - (that’s not a real sha)
      - To paste from system clipboard:
          - make sure you used vi rather than VIM
          - Use Cmd + Shift + V
  - Finally, to save the user file: First hit **esc**, then type **:wq**
    and Enter
  - Once you’ve added the user, you need to grant them roles:
      - Go to
        Go: [<span class="underline">http://54.171.48.173:8153/go/pipelines</span>](http://54.171.48.173:8153/go/pipelines)
      - Go to Admin | User Summary
      - Check checkbox next to the user 
      - Select Roles dropdown at the top
      - Check checkboxes next to desired roles

## SSH Access to Go Server 

  - To ssh into the server:
  - Get yourself into the folder where your pem file lives
  - Terminal: **ssh -i "go-server.pem"
    [<span class="underline">ec2-user@54.171.48.173</span>](mailto:ec2-user@54.171.48.173)**

## Security Access to Go

  - See "[Security Groups -
    EC2](/pages/coding/infra/cloud/aws/AWS-Security#security-groups-ec2)"

## Go Servers and Agents

  - AWS (EC2) contains one server which also acts as an agent, plus one
    other agent
  - Micro instance of Go on EC2
      - Commands on go agent when ssh-ed in:
          - /var/log/go
          - sudo service g-server status
          - /go/go-agent/^c
          - sudo su –l go
      - Go server was manually installed on this server
      - 2 agents there for every job – backend, fronted, mocks
      - Getting a Go agent up on ec2:
          - create ec2 instance
          - install go agent
          - configure GO\_SERVER url
          - start go agent
          - ssh keys generate
          - add it to aws new user
          - copy access keys
          - install git
          - change ssh config permissions, chmod 600 \~/.ssh/config
          - install jdk, yum install java-1.8.0-openjdk-devel
          - npm install -g npm
          - install and configure aws cli
          - install docker (yum install)
          - give go user permissions of docker or add to the user group
            (sudo usermod -a -G docker go)
      - In EC2, Go Agent 1 and Go Server
          - You might want to ssh in if you want to check resources, or
            if git repo unable to clone
          - Typical use case is to view server logs
              - To see logs:
              - ls –la /go/go-agent/log
              - ls –la /go/go-server/artifacts
              - And you might want to look at previous artefacts, or
                manually remove files
              - ls –la /storage/
              - To ssh out again, type **logout**
              - Less /etc/default and /etc/default/go-agent
                  - To see port settings etc
                  - Go\_server\_port=8153
          - Go Agent 1 doesn’t have go-server, only has go-agent

## Docker image for Go Agent

  - Go-cd have always published their go server and agent images
  - This is the docker image that one of our colleagues created to make
    go agent: Infra/dockerfile
      - Get gocd image
      - Update
      - Install git
      - Get jdk
      - Get bzip2
      - Switch user
      - Install nvm
      - Source nvm and run nvm install
      - Change to root
      - Run docker
      - Probably also have to add docker, mocks + dependencies, galen
      - We would also need ssh keys and credentials – don’t mention them
        in the containers
      - Sometimes docker takes time for daemon to load – be patient
  - Basic image is always ubuntu
  - Get package manager there
  - Command to run up image is this: docker run -v
    \~/.ssh/:/home/go/.ssh/ -d -e
    GO\_SERVER\_URL="[<span class="underline">https://54.171.48.173:8154/go</span>](https://54.171.48.173:8154/go)"
    --name='gocd-agent' gocd-agent

<!-- end list -->

  - One of our colleagues created a docker image which could be used to
    create the Go agent:
      - Go to dockerhub:
      - amiedeep/gocd-agent
      - docker run -v \~/.ssh/:/home/go/.ssh/ -d -e
        GO\_SERVER\_URL="[<span class="underline">https://54.171.48.173:8154/go</span>](https://54.171.48.173:8154/go)"
        --name='gocd-agent' gocd-agent

## Setting up the Local Go Agent

  - Our notes from when we did this:
  - You need nodejs set up - I used homebrew to install this.
      - Troubleshooting: The previous team used node version 6.11.3 so
        if you run into trouble with the version you have installed use
        a tool like nvm
        ([<span class="underline">https://github.com/creationix/nvm</span>](https://github.com/creationix/nvm))
        to switch versions.
      - N.B. This may assume that your nodejs installation is managed by
        brew and not independently installed.
  - You should have node installed and ensure that /usr/local/bin is in
    your $PATH - this can be done by editing your \`\~/.bash\_profile\`
    and adding: **export PATH="/usr/local/bin:$PATH"**
  - Ensure you have the right components installed globally by running:
    **npm install -g bower ember-cli galen**
  - Download go-agent from web site, install into the Applications
    folder as per a standard mac app.
      - The go-agent server config should go to https on port 8154 (not
        8153, that’s http)
      - Configure this by running the go-agent app and heading to Go
        Agent \> Preferences
      - [<span class="underline">https://54.171.48.173:8154/go</span>](https://54.171.48.173:8154/go)
      - \[option SSL Mode: No Verification should be selected\]
  - Buildreactor dashboard is used in chrome for the build display -
    uses the (non-admin) user.  A new user can be setup with a new
    password and non-admin permissions to replace this.
  - Build assets typically end up at a path like:
      - This: /Users/\<your username\>/Library/Application Support/Go
        Agent/pipelines/product
      - You'll also need to configure the go-agent to replace the old
        build server on the go server
        ([<span class="underline">https://54.171.48.173:8154/go/pipelines</span>](https://54.171.48.173:8154/go/pipelines))
        but the docs should give enough
        guidance: [<span class="underline">https://docs.gocd.org/current/configuration/managing\_a\_build\_cloud.html</span>](https://docs.gocd.org/current/configuration/managing_a_build_cloud.html) 

## Deployment environments

  - Gulpfile.js references deployEnv:
      - See GoCD for env var which then finds its way into gulpfile.js
      - Build\_and\_publish.sh (which is in infra) also takes the var
        from Go pipeline.

## Configuring jobs to run on particular Go Agents

  - Note: It's possible to set up individual pipeline jobs to run on
    specific Go agents.
  - You do this using resources, which are configured under Job Settings
    in pipelines and also under Resources on each agent.
  - Full documentation here (under “Matching jobs to agents”):
    [<span class="underline">https://docs.gocd.org/current/configuration/managing\_a\_build\_cloud.html</span>](https://docs.gocd.org/current/configuration/managing_a_build_cloud.html)
  - For an example in Cadogan:
      - Select Agents in Go (top navbar)
      - Select the checkbox next to an agent
      - Select the Resources dropdown, top right
      - Now go into the settings for the product pipeline
      - Select the Deploy job, under the deploy\_showcase stage (over on
        the left)
      - Select job Settings
      - You can see the resource(s) specified under Resources. Each of
        these resources can then also be attached to one or more Go
        agents (see above).

## Navigating the Go server to see where files are stored during deployments:

  - Click into the settings (cog icon) for the Backend-api pipeline.
  - Select the top level on the left
  - Select the Materials tab
  - Click on git
  - You'll see destination directory is backend folder
  - To find out which Go agent is used for this pipeline:
      - Drill down into an individual job on the left (eg Backend\_api,
        Build\_Test, compile\_test)
      - Select Job Settings, check Resources.
      - Now go to Agents (top menu) and you'll see which agents handle
        jobs with those resources.
      - In this case the resource is backend, and one of the agents
        handling backend is
        [<span class="underline">ip-172-31-23-137</span>](http://54.171.48.173:8153/go/agents/fe171ea0-fccf-4bc5-ba7f-58318659f53f).
  - This is the Go server. In the AWS management console under EC2
    instances, you can see it has that private IP address
  - If you ssh into the Go server, you can look for the destination
    directory referred to above. This will give you a bit of a feel for
    what happens on a Go agent during a deployment.
  - Note that you need the **sudo su** command to open up a shell with
    the correct privileges

## Renaming / Top tip for checking connections between things in Go

  - Select Admin | Config XML
  - Search for a string (eg the name of a resource)
  - You'll find all the elements of Go config that reference that
    string.
  - This is particularly useful if you want to rename something: You can
    use this technique to check whether it’s being referred to anywhere
    else.
