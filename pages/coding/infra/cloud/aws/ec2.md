---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/EC2
---
## Historic Notes

  - These notes were originally written 2018

## Dynamic EC2 instances:

  - To find which instances belong to which EBS environments, go to EBS
    | Health, and find instance Id
  - These are spun up on demand by EBS load balancer
  - You can see a log of when they are created and deleted in EBS |
    Events

## IP addresses

  - To see IP address, select Instances on the left, select an, then
    lower right see “IPv4 Public IP”
  - To find out which instances are being spawned by a particular EBS
    config:
      - Select the EBS project
      - Click Health on the left hand side
      - You will see an instance Id there – you can map this back to EC2

## Volumes vs Instances:

  - Sometimes when you look at EC2 you may see, for instance, 27
    instances but 33 volumes. Even if some instances have been
    terminated, that still won’t explain the shortfall.
  - There are always more volumes than instances
  - It’s about memory. You can increase the hard disk effectively – so
    some instances might have more than one volume

## EC2 Instance Sizes

  - eg t1.micro or t2.small. You might want to change an instance size,
    eg if an instance is crashing when running npm install, which could
    be caused by a lack of space to accommodate downloaded packages.

## Terminated EC2 instances

  - They’re terminated because they were spun up by the load balancer,
    and are no longer needed
  - Check EBS for health checks
  - You’ll see more of them if you are prone to brief periods of high
    load – new instances get spun up in response to load
  - They remain in terminated state for a while so you can look at them,
    but then after a while they disappear
