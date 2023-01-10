---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/AWS-Cloud-Practitioner
---

## Useful links

- Course is [here](https://explore.skillbuilder.aws/learn/course/134/play/62437/aws-cloud-practitioner-essentials)
  - Log in using SSE login (for Clare)
    - ...although sometimes it works with my AWS console login too? But sometimes not?

## Module 1 - Intro

- The three cloud computing deployment models are cloud-based, on-premises, and hybrid. 

## Module 2 - Compute in the Cloud (EC2, ELB, SQS, SNS, ECS, EKS)

### Module 2 questions

- Pricing questions
  - They talk about scaling and elasticity, but don't the pricing plans mitigate against that?
    - eg committing to a certain amount of usage, or asusming you know in advance whether something can be interrupted.
  - Savings plan pricing: 
    - Any usage up to the commitment is charged at the discounted Savings Plan rate
    - But also "reduce your compute costs by committing to a consistent amount of compute usage"
    - this makes it sound like they want you to use instances for at LEAST the committed amount of time, but the pricing structure makes it sound like you are committing to at MOST that much?
    - Maybe AWS Cost Explorer will help to make sense of this stuff?
  - Dedicated hosts
    - Did Nkeiruka say this was for if you want 24-hr uptime? Wouldn't others (eg reserved instances) work for that? Or did I misremember which pricing plan she was talking about?
  - Reserved instances:
    - "can pay for them with three payment options: all upfront, where you pay for them in full when you commit; partial upfront, where you pay for a portion when you commit; and no upfront, where you don't pay anything at the beginning"
    - Why would you choose all upfront or partial upfront? What are the benefits?

- Scaling questions
  - If you have desired num instances, what defines whether you GET that number of instances?
    - What does it mean in practice?
    - When will you have min instances running and when will you have desired instance running?
  - Do you need to individually configure the ELB for both front end requests and back end communication? (Answer: Yes)


### Module 2 Terminology

- "decoupled system"
- redundancy
- EC2 auto-scaling: dynamic vs predictive
- Scale out (more instances) vs scale up (larger instances)
- ELB: Elastic Load Balancer
- SQS: Simple Queue Service
- SNS: Simple notification service. Many models:
  - Messaging - sending messages to queues
  - Pub/sub - different model - create an SNS topic for people to subscribe to
    - Queues can be subscribers
  - Fan out notifications to end users using mobile push, SMS, and email
- Payload = data contained iwthin a message (SNS)
- ECS: Elastic Container Service (container orchestration - uses Docker)
- EKS: Elastic Kubernetes Service - similar to ECS, but uses different tooling and with different features. 
- AWS Fargate: a serverless compute platform for ECS or EKS
  - Allows you to use ECS or EKS without needing to manage EC2 instances to host the containers / clusters
- Instance family: When you launch an EC2 instance, you choose the instance family. The instance family determines the hardware the instance runs on. 
  - Different instance families:
    - General purpose
      - provide a balance of compute, memory, and networking resources.
    - Memory optimized
      - more ideal for workloads that process large datasets in memory, such as high-performance databases.
    - Compute optimized
      - eg a batch processing workload
    - Storage optimized
      - workloads that require high, sequential read and write access to large datasets on local storage.
- Pricing plans
  - On-demand
    - pay on-demand. More expensive than savings or reserved (can get up to 72% savings)
  - Savings plan
    - commit to usage. 1-year or 3-year plans (= cheapest)
    - (can get up to 72% savings compared to on-demand)
  - Reserved instances
    - commit to usage. 1-year or 3-year plans (= cheapest)
    - (can get up to 72% savings compared to on-demand)
    - reverts to on-demand if you go over agreed time
  - Spot instances
    - can get up to 90% savings compared to on-demand
    - instances not guaranteed to be available - have to wait
    - instances can be terminated with little warning
  - Dedicated hosts
    - hosts belong to you. Most expensive

## Module 3 - Global infrastructure and reliability (regions, AZs, edge locations, EBS)

### Module 3 questions

- Do you have to manually build in redundancy across multiple AZs, or can you get Amazon to autmoatically handle that for you?
  - Ah, it's answered: Regions already autmopatically operate across AZs?
  - but does that include redundancy, within scaling groups for instance?
  - "You should always deploy infrastructure across at least two Availability Zones. And some AWS services like Elastic Load Balancing, Amazon SQS, and Amazon SNS already do this for you."

### Module 3 terminology

- AZs: Availability Zones
  -  allow you to run across physically separated buildings, tens of miles of separation, while keeping your application logically unified.
- CDN: Content Delivery Network, for caching - means you can cache data in the region closest to the customers rather than have a separate instance there.
- CloudFront: Amazon CDN
- Edge locations: 
  - Used by Cloudfront CDN
  - Not same as regions
  - You can push content from a region to edge locations all around the world
  - eg we host site in Oregon Region, and deploy static web assets (eg images) in CloudFront closest to user (eg Ireland).
  - Also used for DNS
    - helping direct customers to the correct web locations with reliably low latency.
- Amazon Route 53: DNS
- AWS Outposts: hosting in your own building
  - AWS will basically install a fully operational mini Region, right inside your own data center
- APIs: How to access AWS services
  - Ways of accessing APIs:
    - AWS Management Console (browser based)
    - AWS Command Line Interface (CLI)
    - AWS Software Development Kits (SDKs)
      - Supported programming languages include C++, Java, .NET, and more.
    - AWS CloudFormation
      - infrastructure as code
      - allows you to define a wide variety of AWS resources in a declarative way
      - using JSON or YAML text-based documents called CloudFormation templates.
      - not just limited to EC2-based solutions. 
      - supports many different AWS resources 
        - from storage, databases, analytics, machine learning, and more
    - or various other tools 
- AWS Elastic Beanstalk (EBS)
  - For orchestrating / coordinating / provisioning all your instances
  - coordinate EC2, auto-scaling and load balancers all in one place
  - allows you to save environment configurations
  - where all your environments are managed
  - The home of load balancing
  - Handles the following:
    - Adjusting capacity
    - Load balancing
    - Automatic scaling
    - Application health monitoring

## Module 4 - networking (VPCs, VPNs etc)

### Module 4 terminology

- Amazon Virtual Private Cloud (VPCs)
  - essentially your own private network in AWS
  - provision a logically isolated section of the AWS Cloud 
  - where you can launch AWS resources in a virtual network that you define.
  - can be public facing so they have access to the internet, 
  - or private with no internet access, usually for backend services like databases or application servers. 
  - The public and private grouping of resources are known as subnets 
    - they are ranges of IP addresses in your VPC. 
    - public subnet for publicly facing urls
    - private subnet for services to talk to each other
- internet gateway (IGW)
  - attached to your VPC
  - allow traffic from the public internet to flow into and out of your VPC
- virtual private network (VPN)
  - so you can attach to all your internal private network stuff in your VPC
- virtual private gateway
  - for private subnets in your VPC
  - allows you to create a VPN connection
  - for if you want to establish an encrypted VPN connection to your private internal AWS resources
- AWS Direct Connect
  - completely private, dedicated fiber connection from your data center to AWS
  - ...because virtual private gateways still use main networks so are subject to slowdowns caused by high traffic
- network hardening
  - making more secure
- network access control list (ACL)
  - every packet that crosses the subnet boundaries gets checked against it
  - every network has a default ACL which allows all inbound and outbound traffic
    - but for custom network ACLs, all inbound and outbound traffic is denied until you add rules to specify which traffic should be allowed.
- security groups
  - instance level network security
  - by default, denies all inbound and outbound traffic
  - ...because ACL only gets to evaluate a packet if it crosses a subnet boundary, in or out
    - doesn't evaluate if a packet can reach a specific EC2 instance or not
  - key difference between a security group and a network ACL is 
    - security group is stateful - has memory re who to allow in or out
      - will allow responses to requests it previously allowed
    - network ACL is stateless - remembers nothing, checks every packet regardless
- geolocation DNS
  - direct traffic based on where the customer is located. 
  - eg traffic from N. America to the Oregon Region, traffic in Ireland to Dublin 

## Module 5 - Storage and databases

### Module 5 questions


### Module 5 terminology

## Module 6 - Security

### Module 6 questions


### Module 6 terminology

## Module 7 - Monitoring and Analytics

### Module 7 questions


### Module 7 terminology


