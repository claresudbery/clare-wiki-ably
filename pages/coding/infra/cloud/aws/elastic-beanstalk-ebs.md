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
* For running instances, click Monitoring (left) and see HealthyHostCount (bottom right)
* For Events, select Events on the left
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