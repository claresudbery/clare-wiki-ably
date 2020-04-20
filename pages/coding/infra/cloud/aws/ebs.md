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

## Health checks and unhealthy instances:

  - > We had problems when we were not using ELB health for
    > auto-scaling, we were using EC2 health instead - so although the
    > instances were unhealthy, they were not terminated

  - > If no health check is configured: By default, the load balancer is
    > configured to open a TCP connection on port 80. If the instance
    > acknowledges the connection, it is considered healthy. More here:
    > [<span class="underline">https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.healthstatus.html\#using-features.healthstatus.understanding</span>](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.healthstatus.html#using-features.healthstatus.understanding)

  - > “Automatically Terminate Unhealthy Instances” uses the EC2
    > definition of healthy, not the EB definition. And the EC2
    > definition of unhealthy is just an instance that’s “retiring” or
    > “retired”
    
      - > But we changed this to automatically terminate instances based
        > on the EBS health check (rather than EC2), which can be done
        > without having to change the auto-scaling trigger. We simply
        > changed the group policy and left the trigger alone:
        > [<span class="underline">https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environmentconfig-autoscaling-healthchecktype.html</span>](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environmentconfig-autoscaling-healthchecktype.html)

  - Contrary to what it says in that link, it is possible to do this via
    the UI:

  - In EC2, go to auto-scaling groups down on the left

  - Select an auto-scaling group, check tags or environment Id (embedded
    in group name) to find the correct one

  - Details tab:
    
      - Edit (top right)
    
      - Health check type - change to ELB
    
      - > We also set up a CloudWatch alarm to notify us if we have 0
        > healthy instances
    
      - > You can give an alarm an associated action (which can be stop,
        > terminate, reboot or recover). These alarms come for free and
        > do not require you to pay for the elevated service.
    
      - > But we can’t put “remove instance” as an action for 0 healthy
        > hosts, because the min/max instance rule takes precedence, and
        > it won’t let you remove instances if you already have the min
        > number of instances.
    
      - > More details here:
        > [<span class="underline">https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html</span>](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html)
        
          - > \!\! These instructions are for adding an alarm to a
            > SPECIFIC instance, rather than ANY instance. For ANY
            > instance, you could do this:
        
          - > You need the **StatusCheckFailed\_Instance** metric, and
            > you have to do it via the View All CloudWatch Alarms page
            > - select Create Alarm at the top, then in the Select
            > Metric section, search for your environment Id.
        
          - > How to evaluate alarms:
            > [<span class="underline">https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html\#alarm-evaluation</span>](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarm-evaluation)

  - More here:
    [<span class="underline">https://stackoverflow.com/questions/44346103/aws-beanstalk-how-to-reboot-or-terminate-automatically-an-instance-that-is-no</span>](https://stackoverflow.com/questions/44346103/aws-beanstalk-how-to-reboot-or-terminate-automatically-an-instance-that-is-no)

## AMIs

  - The AMI is the thing that AWS uses to create an operating system for
    each instance – a bit like a docker image
  - EBS: If you go to an application, then Configuration | Instances |
    Custom AMI Id
      - – where are the custom AMIs set up? You don’t need to care\! The
        important thing is when you’re looking at an app, look at top
        right to see what’s being used, eg node.js

## CloudWatch Alarms

  - CloudWatch alarms can be configured to alert us in particular
    circumstances
      - Eg we had them set up for 0 healthy hosts and over a certain
        threshold of 5xx alarms
      - Note that notifications are handled via topics - use the SNS
        service in AWS
  - CloudWatch alarms and monitoring can be accessed via load balancers
  - You can view load balancers if you select them on the right in the
    EC2 management console
  - You can select load balancers one by one and check “Instances” to
    see whether you have the right one – or make a note somewhere\!
  - In the load balancer, you can click “View all CloudWatch alarms” to
    view other alarms, and to edit alarms: In the list of alarms, click
    View (on the right), then select Actions | Modify from the dropdown
    at the top.
  - When you view all alarms, you will see several in ALARM status
      - These will mostly have names that include “AWSEBCloudwatchAlarm”
        then will be labelled either Low or High
      - These are the default alarms created as a result of setting
        scaling triggers in EBS | Configuration | Scaling | Scaling
        Trigger, where “High” alarms are triggered by breaching the
        upper threshold, and “Low” alarms by breaching the lower
        threshold
      - These alarms all have auto-scaling actions attached - ie either
        add or remove an instance (unless the min or max instance values
        prevent you)
      - Their names are based on AutoScaling group names
      - To see AutoScaling groups, go to EC2 and click AutoScaling
        Groups on the left
      - AutoScaling group names are reasonably easy to parse because
        they include environment Ids - as do the alarms
