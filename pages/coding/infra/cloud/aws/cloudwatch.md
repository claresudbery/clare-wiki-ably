---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/Cloudwatch
---

## AWS Logging using Cloudwatch

To see logs:

* Click Services, top left 
* Select Cloudwatch (in the “Management Tools” group)
* Click Logs (LHS)
* Select the environment you want
* To see more columns (eg ingestion time), click the cog icon, top right
* Most recent logs are at the bottom by default
* To change the time period, see the options top right

## Health checks and unhealthy instances

  - We had problems when we were not using ELB health for
    auto-scaling, we were using EC2 health instead - so although the
    instances were unhealthy, they were not terminated

  - If no health check is configured: By default, the load balancer is
    configured to open a TCP connection on port 80. If the instance
    acknowledges the connection, it is considered healthy. More here:
    [<span class="underline">https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.healthstatus.html\#using-features.healthstatus.understanding</span>](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.healthstatus.html#using-features.healthstatus.understanding)

  - “Automatically Terminate Unhealthy Instances” uses the EC2
    definition of healthy, not the EB definition. And the EC2
    definition of unhealthy is just an instance that’s “retiring” or
    “retired”
    
      - But we changed this to automatically terminate instances based
        on the EBS health check (rather than EC2), which can be done
        without having to change the auto-scaling trigger. We simply
        changed the group policy and left the trigger alone:
        [<span class="underline">https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environmentconfig-autoscaling-healthchecktype.html</span>](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environmentconfig-autoscaling-healthchecktype.html)

  - Contrary to what it says in that link, it is possible to do this via
    the UI:

  - In EC2, go to auto-scaling groups down on the left

  - Select an auto-scaling group, check tags or environment Id (embedded
    in group name) to find the correct one

  - Details tab:
    
      - Edit (top right)
    
      - Health check type - change to ELB
    
      - We also set up a CloudWatch alarm to notify us if we have 0
        healthy instances
    
      - You can give an alarm an associated action (which can be stop,
        terminate, reboot or recover). These alarms come for free and
        do not require you to pay for the elevated service.
    
      - But we can’t put “remove instance” as an action for 0 healthy
        hosts, because the min/max instance rule takes precedence, and
        it won’t let you remove instances if you already have the min
        number of instances.
    
      - More details here:
        [<span class="underline">https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html</span>](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html)
        
          - \!\! These instructions are for adding an alarm to a
            SPECIFIC instance, rather than ANY instance. For ANY
            instance, you could do this:
        
          - You need the **StatusCheckFailed\_Instance** metric, and
            you have to do it via the View All CloudWatch Alarms page
            - select Create Alarm at the top, then in the Select
            Metric section, search for your environment Id.
        
          - How to evaluate alarms:
            [<span class="underline">https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html\#alarm-evaluation</span>](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarm-evaluation)

  - More here:
    [<span class="underline">https://stackoverflow.com/questions/44346103/aws-beanstalk-how-to-reboot-or-terminate-automatically-an-instance-that-is-no</span>](https://stackoverflow.com/questions/44346103/aws-beanstalk-how-to-reboot-or-terminate-automatically-an-instance-that-is-no)

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
## Useful debugging tools in Cloudwatch

  - Logs
  - Alarms | History
  - Metrics
  - View individual alarms (see below)

## Viewing Individual Alarms

  - Go here:
  - Cloudwatch
  - Alarms (LHS)
  - Find the healthy host count one (“HealthyHostCount \< 1 for 1
    minute”) for ryfzuqamvb
      - It will either be in Red (“ALARM”) or green (“OK”) (or maybe
        “insufficient”?)
  - Select / click
  - Click the graph on the Details tab
  - Select “1w” at the top
  - …or Cloudwatch | Metrics – All Metrics, select ELB, then “Per LB” or
    “Per LB, per A-Z”
      - (to find out which LB you are looking at, go to EC2 and select
        load balancers on the left, then select a particular load
        balancer and view tags to get a cross reference)
      - To see healthy host count, see notes above
      - …or you can go to Elastic Beanstalk | Monitoring and fiddle
        about with the date range
