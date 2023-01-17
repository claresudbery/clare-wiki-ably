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

- Block-level storage 
  - accessed from EC2 instances
  - a place to store files
  - When a file is updated, it updates just the pieces that change. 
  - good for databases, enterprise software, or file systems. 
  - same as hard drive on laptop or PC
  - different types of storage listed below
- Object storage
  - In object storage, each object consists of 
    - data - eg image, video, text document
    - metadata - info re what data is, how used, object size, etc
    - key - unique identifier
  - not same as block storage
    - when you modify a file in block storage, only the pieces that are changed are updated. When a file in object storage is modified, the entire object is updated.
- instance store volumes
  - attached automatically to some EC2 instances
  - ephemeral / temporary
  - suitable for temporary files, scratch data, easily recreatable data
  - physically attached to EC2 host
  - if you stop or terminate instance, all data will be deleted
    - because when restarted will likely start on different host
- Amazon Elastic Block Store (EBS)
  - block storage - not object storage
    - because block storage, is good for if you want to make incremental changes
    - and don't want to work with full objects
    - eg if making small edits to large video files
    - so don't want to download / upload the whole video on each change
    - If you are doing complex read, write, change functions, then use EBS
  - create virtual hard drives - "EBS volumes" - to attach to EC2 instances
  - not tied directly to same host
  - data written will persist between EC2 instance stop / start
  - define the size, type and configurations of the volume you need.
  - can take incremental backups of your data called snapshots
    - incremental, so only data changed since last snapshot are saved.
  - After you create an EBS volume, it can attach to an Amazon EC2 instance.
- S3: Amazon Simple Storage Service
  - object storage - not block Storage
  - web-enabled: Every object has a URL
  - regionally distributed
  - serverless - no EC2 instances needed
  - When selecting an Amazon S3 storage class, consider these two factors:
    - How often you plan to retrieve your data
    - How available you need your data to be
  - maximum file size for an object in Amazon S3 is 5 TB.
  - S3 tiers (aka storage classes):
    - [full list is here](https://aws.amazon.com/s3/storage-classes/)
    - S3 standard:
      - high availability for objects
      - higher cost than other storage classes
      - 11 nines of durability
        - means an object stored has 99.999999999% probability will remain intact after 1 year.
      - data stored in at least 3 facilities. So multiple copies.
      - useful for static website hosting (HTML files)
        - just upload static web assets, and so forth into a bucket
        - then enter the bucket's URL and ba-bam! Instant website
    - S3-IA (S3 Infrequent Access)
      - accessed less frequently but requires rapid access when needed
      - backups, disaster recovery files, or owt that needs long-term storage
      - Two types:
        - Amazon S3 Standard-Infrequent Access (S3 Standard-IA)
          - same level of availability as Amazon S3 Standard
          - lower storage price and higher retrieval price
          - store data in a minimum of three Availability Zones
        - Amazon S3 One Zone-Infrequent Access (S3 One Zone-IA)
          - Stores data in a single Availability Zone
          - Has a lower storage price than Amazon S3 Standard-IA
          - Good if:
            - You want to save costs on storage.
            - can easily reproduce data if AZ failure happens.    
    - Amazon S3 Glacier
      - retain data for several years for auditing purposes. 
      - don't need it to be retrieved very rapidly
      - S3 Glacier vault lock policy
        - if compliance requirements re retaining data for certain period of time
        - specify controls like WORM (write once read many)
        - lock the policy from future edits
        - option of uploading directly to Glacier or using S3 Lifecycle policies
      - Different types:
        - Amazon S3 Glacier Instant Retrieval
          - Works well for archived data that requires immediate access
          - can retrieve within millisecs, with same performance as S3 Standard.
        - Amazon S3 Glacier Flexible Retrieval
          - Low-cost storage designed for data archiving
          - Able to retrieve objects within a few minutes to hours
        - S3 Glacier Deep Archive
          - Lowest-cost object storage class ideal for archiving
          - Able to retrieve objects within 12 hours (from 12 to 48 hours)
          - stored across at least 3 geographically dispersed Availability Zones
    - Amazon S3 Intelligent-Tiering
      - Ideal for data with unknown or changing access patterns
      - Requires a small monthly monitoring and automation fee per object
      - S3 monitors objects’ access patterns. 
      - If object not accessed an object for 30 consecutive days, Amazon S3 automatically moves it to the infrequent access tier, Amazon S3 Standard-IA. If you access an object in the infrequent access tier, Amazon S3 automatically moves it to the frequent access tier, Amazon S3 Standard.
    - Amazon S3 Outposts
      - Reminder: AWS Outposts = hosting in your own building
      - Creates S3 buckets on Amazon S3 Outposts
      - Makes it easier to retrieve, store, and access data on AWS Outposts
- S3 Lifecycle policies
  - policies you can create that can move data automatically between tiers
  - eg 
    - S3 Standard for 90 days, 
    - then S3-IA for 30 days, 
    - then after 120 days total, to S3 Glacier.
- EFS = Elastic File System
  - eg multiple servers accessing shared file system
  - Different from EBS:
    - In order to attach EC2 to EBS, you need to be in the same AZ
      - But EFS stores data in and across multiple Availability Zones. 
    - Also one EBS attaches to one EC2 instance
      - Amazon EFS can have multiple instances reading and writing from it at the same time.
    - If you provision a two terabyte EBS volume and fill it up, it doesn't automatically scale to give you more storage
    - As you write more data to EFS, it automatically scales. No need to provision any more volumes.
    - Uses block storage
- RDS = Relational Database Service
  - can migrate on-prem RDB doing a lift and shift to EC2
  - or can use use RDS which is managed service
    - automated patching, backups, redundancy, failover, disaster recovery
  - six engines available
    - Amazon Aurora
    - PostgreSQL
    - MySQL
    - MariaDB
    - Oracle Database
    - Microsoft SQL Server
  - relational = good for business analytics, because you need complex relational joins
- Amazon Aurora = most managed relational database option
  - comes in two forms, MySQL and PostgreSQL
  - 1/10th the cost of commercial grade databases
  - data is replicated across facilities, so you have six copies at any given time
  - deploy up to 15 read replicas, so you can offload your reads and scale performance
  - continuous backups to S3
  - point in time recovery, so you can recover data from a specific period. 
  - number of different security options
    - Many Amazon RDS database engines offer encryption at rest and encryption in transit
  - five times faster than standard MySQL databases
  - reduces unnecessary input/output (I/O) operations
  - good if your workloads require high availability
- Amazon DynamoDB
  - Serverless database
  - you create tables
  - Data is organized into items, and items have attributes
  - stores this data redundantly across availability zones
    - mirrors the data across multiple drives under the hood for you
  - massively scalable
  - highly performant
  - granular API access
  - NoSQL
    - rigid SQL databases can have performance and scaling issues when under stress
    - and cannot have any variation in the types of data that you store in a table
    - DynamoDB = flexible schema
    - write queries based on a small subset of attributes that are designated as keys. 
  - One type of structural approach for nonrelational databases is key-value pairs.
- Amazon Redshift
  - Data warehousing as a service
  - Good for historical analytics
  - MAssively scalable
  - multiple petabyte sizes is very common
  - with Amazon Redshift Spectrum, you can directly run a single SQL query against exabytes of unstructured data running in data lakes. 
  - achieve up to 10 times higher performance than traditional databases for business intelligence
- DMS = Database Migration Service
  - migrate existing databases onto AWS in a secure and easy fashion
  - source database remains fully operational during the migration
  - source and target databases don't have to be of the same type
  - homogenous = source and target databases are same type, eg MySQL to MySQL
    - source can be on-prem, EC2 or RDS
    - target can be EC2 or RDS
  - heterogenous = source and target databases are different
    - two-step process
    - first convert using AWS Schema Conversion Tool
  - other use cases:
    - development and test database migrations
    - database consolidation
      - you have several databases and want to consolidate them into one central database. 
    - continuous database replication
      - use DMS to perform continuous data replication. 
      - This could be for disaster recovery or because of geographic separation. 
      - Sending ongoing copies of your data to other target sources instead of doing a one-time migration
- Amazon DocumentDB
  - full content management system
  - Great for content management, catalogs, user profiles. 
- Amazon Neptune 
  - a graph database
  - engineered for social networking and recommendation engines
  - also great for fraud detection needs. 
- Amazon Managed Blockchain
  - create and manage blockchain networks with open-source frameworks. 
  - Blockchain is a distributed ledger system that lets multiple parties run transactions and share data without a central authority.
- Amazon QLDB = Quantum Ledger Database
  - immutable system of record where any entry can never be removed from the audits. 
  - better than blockchain for financial regulators, because blockchain adds a huge decentralization component
- Amazon ElastiCache
  - adds caching layers on top of your databases that can help improve read times of common requests from milliseconds to microseconds
  - without your team needing to worry about the heavy lifting of launching, uplift, and maintenance
  - available in both MemCached and Redis
- DAX = DynamoDB Accelerator
  - native caching layer designed to dramatically improve read times for your nonrelational data. 



## Module 6 - Security

### Module 6 questions


### Module 6 terminology

- shared responsibility model
  - AWS controls security of the cloud and customers control security in the cloud.
  - AWS, control the data centers, security of our services, and all the layers in this section
  - customers control the workloads that they run in the cloud
    - eg  If AWS discovers there are some new vulnerabilities in your version of Windows, let's say, we can certainly notify your account owner but we cannot deploy a patch. 
    - and you are responbible for securing your data
      - although AWS will give you some toold you can use to do it
- root account user
  - When you create an AWS account, you are given what is called the root account user. 
  - owner of the AWS account and has permission to do anything they want inside of that account.
  - can access and control any resource in the account.
  - recommend as soon as you create an AWS account and log in with your root user, you turn on multi-factor authentication
- IAM = AWS Identity and Access Management
  - create IAM users
  - When you create an IAM user, by default, it has no permissions
  - least privilege principle: give people access only to what they need and nothing else.
- IAM policy
  - given to IAM users
  - JSON document that describes what API calls a user can or cannot make.
- IAM groups
  - groups of users 
  - can attach a policy to a group and all of the users in that group will have those permissions.
- IAM roles
  - Roles have associated permissions that allow or deny specific actions
  - can be assumed for temporary amounts of time
  - When an identity assumes a role, it abandons all of the previous permissions that it has and it assumes the permissions of that role.
  - Before an IAM user, application, or service can assume an IAM role, they must be granted permissions to switch to the role.
- AWS Organizations
  - central location to manage multiple AWS accounts
  - consolidated billing for all member accounts
    - with bulk discounts
  - hierarchical groupings of your accounts to meet security, compliance, or budgetary needs
  - group accounts into organizational units, or OUs
  - root = parent container for all the accounts in your organization. 
  - service control policies, or SCPs
    - specify the maximum permissions for member accounts in the organization
    - restrict which AWS services, resources, and individual API actions, the users and roles in each member account can access.
    - you can apply service control policies (SCPs) to the organization root, an individual member account, or an OU.
- compliance
  - AWS complies with a long list of assurance programs that you can find online
  - the Region you choose to operate out of, might help you meet compliance regulations
    - eg you can only legally store data in the country that the data is from
  - AWS also offers multiple whitepapers and documents that you can download and use for compliance reports
- AWS Artifact
  - gain access to compliance reports done by third parties who have validated a wide range of compliance standards.
- AWS Artifact Agreements
  - if you need to sign an agreement with AWS regarding your use of certain types of information throughout AWS services
  - review, accept, and manage agreements for an individual account and for all your accounts in AWS Organizations
- AWS Artifact Reports
  - provide compliance reports from third-party auditors
  - provide the AWS audit artifacts to your auditors or regulators as evidence of AWS security controls. 
- AWS Compliance Center 
  - compliance information all in one place
  - will show you compliance enabling services 
  - and documentation like the AWS Risk and Security Whitepaper
- Customer Compliance Center
  - read customer compliance stories to discover how companies in regulated industries have solved various compliance, governance, and audit challenges
  - access compliance whitepapers and documentation on topics such as:
    - AWS answers to key compliance questions
    - An overview of AWS risk and compliance
    - An auditing security checklist
  - includes an auditor learning path
- DDoS
  - distributed denial-of-service
  - attack on your enterprise's infrastructure
  - a single machine attacking your application has no hope of providing enough of an attack by itself
    - so the distributed part is that the attack leverages other machines around the internet to unknowingly attack your infrastructure.
  - attack examples:
    - UDP flood
      - The bad actor sends a simple request, give me weather. 
      - But it gives a fake return address on the request, your return address.
      - So now the Weather Service very happily floods your server with megabytes of rain forecasts
      - Solution = security groups. 
        - The security groups only allow in proper request traffic
        - security groups operate at the AWS network level
      - also get shrugged off by the scale of the entire AWS Regions capacity, not your individual EC2's capacity
    - HTTP level attacks
      - look like normal customers asking for normal things like complicated product searches over and over and over
      - ELB handles the http traffic request first, so it waits until the entire message, no matter how fast or slow, is complete before sending it over to the front end web server
    - Slowloris attack
      - attacker pretends to have a terribly slow connection. Y
      - production servers are standing there waiting for the customer to finish their request
- AWS Shield with AWS WAF
  - For the sharpest, most sophisticated attacks
  - specialized defense tools
  - uses a web application firewall to filter incoming traffic for the signatures of bad actors
  - has extensive machine learning capabilities
  - can recognize new threats as they evolve
- AWS WAF = web application firewall 
  - lets you monitor network requests that come into your web applications. 
  - works together with Amazon CloudFront and an Application Load Balancer. 
  - Uses a web access control list (ACL) to protect your AWS resources. 
- AWS Shield Standard
  - automatically protects all AWS customers at no cost
  - detect malicious traffic in real time and automatically mitigate it
- AWS Shield Advanced
  - turn AWS into your partner against DDoS attacks
  - paid service that provides detailed attack diagnostics and the ability to detect and mitigate sophisticated DDoS attacks. 
  -  integrates with other services such as Amazon CloudFront, Amazon Route 53, and Elastic Load Balancing
  - integrate AWS Shield with AWS WAF by writing custom rules to mitigate complex DDoS attacks.
- Other security services
  - server-side encryption at rest is enabled on all DynamoDB table data
  - integrates with AWS KMS, or Key Management Service, for managing the encryption key that is used to encrypt your tables
- AWS KMS, or Key Management Service
  - manage encryption keys
  - create, manage, and use cryptographic keys
  - choose the specific levels of access control that you need for your keys.
- SSL = secure sockets layer
  - to encrypt data in transit
- Amazon Inspector
  - runs an automated security assessment against your infrastructure
  - check on deviations of security best practices, exposure of EC2 instances, vulnerabilities, and so forth.
  - three parts:
    - a network configuration reachability piece, 
    - an Amazon agent, which can be installed an EC2 instances, 
    - a security assessment service that brings them all together
- Amazon GuardDuty
  - threat detection
  - analyzes continuous streams of metadata generated from your account
    - and network activity found on AWS CloudTrail events, Amazon VPC Flow Logs, and DNS logs. 
  - uses integrated threat intelligence such as 
    - known malicious IP addresses, 
    - anomaly detection, 
    - machine learning 
  - runs independently from your other AWS services

## Module 7 - Monitoring and Analytics

### Module 7 questions


### Module 7 terminology


