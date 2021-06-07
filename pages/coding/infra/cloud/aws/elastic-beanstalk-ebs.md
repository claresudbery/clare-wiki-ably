---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/Elastic-Beanstalk-EBS
---
## General Stuff

  - These notes were originally written 2018
  - To find out which instances are being spawned by a particular EBS
    config:
      - Select the EBS project
      - Click Health on the left hand side
      - You will see an instance Id there – you can map this back to EC2
  - For each EB instance you select an image, eg nodejs and docker are
    used for ours
  - To see CNAME, select an application and you will see it upper right 
      - The url on the end is the CNAME
  - Dashboard: Sometimes you will see WARN for warning, but that might
    just mean it has terminated an instance because traffic has lowered
    – so probably not anything to worry about

## Check Instances

To see running instances and generally see how things are going:

* Services => Elastic Beanstalk
* Select your project at the top, then environment from the dropdown
*	For a list of recent events, see Dashboard. This is the default view.
* For running instances, click Monitoring (left) and see HealthyHostCount (bottom right)
* For Events, select Events on the left
  *	! Be aware that this is not the only source for events
  *	You can also look at Cloudwatch | Alarms:
    *	If you want to correlate events with auto-scaling:
    *	Cloudwatch: Alarms on the LHS – select the sub-menu of red alarms
    * Click on the row which contains the id you're interested in (select the checkbox)
    *	Now check the History tab in the lower half of the screen
* To configure number of instances:
  * Configuration => Scaling

## Scaling Triggers

- To check load: EBS – applications – \[project\] – \[env\] -
  dashboard
    - Config for this is set up in load balancer : Scaling trigger =
      Network Out
    - Json response from network ie response to browser in response to
      browser requests
    - Max is 600000 (or whatever) Mb in 5 minutes – if this is
      exceeded, new server is spun up
    - Go to EBS and select Monitoring on the left, then you can see
      from the graphs how many mb are coming back from network in
      responses
-	Auto-scaling rescues us if an instance goes down, but it’s slow
  -	It might be that if you have 3 availability zones then effectively you have 3 instances
  -	Might not be though – basically several params are interacting with one another


## Events & Deployment

  - Elastic Beanstalk events: “Deploy configuration” is just what
    happens when you edit the EBS config (eg change notifications)
  - “Desired capacity” refers to CURRENT desired capacity. This changes
    constantly depending on traffic.
  - Even when environment health is SEVERE, this only comes through as a
    warning, not an error.
  - There is an npm install command which is run as part of the setup
    when a new instance is spun up.
      - Occasionally it can fail, which will prevent the instance from
        being spun up correctly.
          - When this happens the instance can get stuck in a funny
            state and may need terminating manually.
  - If you want to know how EBS knows what to deploy to each instance,
    this may or may not be helpful…
      - In the example I worked on, EBS used a combination of an AMI and
        a prerender zip file in an S3 bucket
      - The zip file was placed in the S3 bucket by Go during each
        deployment
      - You could tell which zip file was currently being deployed to
        new instances because you saw it on the dashboard in EBS at the
        top of the page under “running version”
      - You could tell which AMI was being used because you saw it on
        the dashboard in EBS at the top of the page under
        “Configuration”
      - When a new instance was spun up, you could see exactly what was
        done by pulling logs for an instance and looking at the file
        eb-activity.log
      - This included an **npm install** command
  - Healthy host count can appear to be out of step with “num instances”
    because you also have to take unhealthy hosts into account
  - The times of CloudWatch alarms are sometimes slightly out of step
    with EB events
  - Don’t configure S3 logging without doing a reboot immediately
    afterwards
  - EB knew about the S3 bucket and was configured to pull stuff from
    there
      - You could see this because when we pulled logs for an instance,
        in eb-commandprocessor.log, we saw references to config file
        /etc/elasticbeanstalk/.aws-eb-stack.properties.
      - When we SSHed into a running instance and looked at this
        properties file, we saw this:
          - environment\_bucket=elasticbeanstalk-eu-west-1-829851215903

## Health checks and unhealthy instances

- See [Cloudwatch page](/pages/coding/infra/cloud/aws/Cloudwatch#health-checks-and-unhealthy-instances).

## AMIs

  - The AMI is the thing that AWS uses to create an operating system for
    each instance – a bit like a docker image
  - EBS: If you go to an application, then Configuration => Instances =>
    Custom AMI Id
      - – where are the custom AMIs set up? You don’t need to care\! The
        important thing is when you’re looking at an app, look at top
        right to see what’s being used, eg node.js

## CloudWatch Alarms

- See [Cloudwatch page](/pages/coding/infra/cloud/aws/Cloudwatch#cloudwatch-alarms).

## Environment Events

*	Understanding Environment Events – elastic beanstalk
  *	Docs – elastic beanstalk - Understanding Environment Events - http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/events.html

## ELB = Load balancer

Don't confuse EBS (Elastic Beanstalk) with ELB (Elastic Load Balancer)!

## Elastic beanstalk hooks

-	ELB (EBS?) has its own internal file structure which mirrors the sequence of actions which happen on spinning up a running instance
-	You can place shell scripts in an appropriate folder to make them be executed at the appropriate time
  -	Eg hooks/restartappserver/pre
-	See .ebextensions folder in dts-frontend ([Samba](https://github.com/claresudbery/samba))
  -	Files in here contain examples of configured shell scripts
## Changing deployment configs (this example is from samba)

  - Beanstalk.json (in [Samba](https://github.com/claresudbery/samba))
  - Example: search for rollingupdate in DTS
  - Example of “feature flagging” or setting things for individual
    environments: DTS: BeanstalkInstanceType being set to “t2.small” in
    some environments.
      - This setting is actually in the yaml and then referred to in
        beanstalk.json
  - To access via front end instead:
      - Elastic Beanstalk | Configuration
      - For rolling updates: select Update and Deployments
  - When you make changes to things like instance type, it completely
    kills the machine and restarts it. If you have rolling updates
    enabled, this seems to have the effect (because of a bug) of
    deploying with the previously-released version of the software.
      - To fix this, you need to do this:
      - Elastic Beanstalk: Go to dashboard for your environment
      - Click Upload and Deploy (button, top middle)
      - Click the Application Versions link in the section labelled “ To
        deploy a previous version, go to the [Application Versions
        page](https://eu-west-1.console.aws.amazon.com/elasticbeanstalk/home?region=eu-west-1#/application/versions?applicationName=iag).”
      - Select the version you want and click Deploy
      - Go back to the pipeline (Snap CI) and redeploy

## Finding Names of Load Balancers 

  - Go to the EC2 service
  - For load balancers:
      - Click on Load Balancing on the left
      - Select a particular load balancer, then select the Tags tab
      - You can then correlate this with the load balancer names you see
        in Cloudwatch | Metrics
      - To find the direct hash url, look at the Description tab – “DNS
        name”

## Logs

  - To see logs:
  - Go to elastic beanstalk
  - Click the desired environment.
  - Click logs
  - Click request logs either last 100 or entire logs as a zip file.
