---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/AWS-Cloud-Practitioner
---

## Useful links

- Course is [here](https://explore.skillbuilder.aws/learn/course/134/play/62437/aws-cloud-practitioner-essentials)
  - Log in using SSE login (for Clare)
    - ...although sometimes it works with my AWS console login too? But sometimes not?

## Module 1

- The three cloud computing deployment models are cloud-based, on-premises, and hybrid. 

## Module 2

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


## Terminology

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
