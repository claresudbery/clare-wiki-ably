---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/AWS-Basics
---

## AWS-Start

Setting yourself up on first use:

* Select region (often EU (Ireland)) from top right
* On your first time in, you need to set up multi factor authentication:
  * Click Services, top left
  * Select IAM (in the group headed Security, Identity and Compliance)
  * Select Users on the left
  * Click on your name
  * Select Security Credentials
  * Click the pencil icon next to Assigned MFA Device
  * Select “virtual” if you want to use an authenticator app on your phone
  * Install Google Authenticator on your phone, and scan the VR code
  * After setting this up, sign out and sign in again

## AWS-Navigation

General navigation:

* Select region (often EU (Ireland)) from top right
* To get at useful stuff:
  * Click Services, top left
  * Then you can select Cloudwatch, Elastic Beanstalk etc

## AWS Logging using Cloudwatch

To see logs:

* Click Services, top left 
* Select Cloudwatch (in the “Management Tools” group)
* Click Logs (LHS)
* Select the environment you want
* To see more columns (eg ingestion time), click the cog icon, top right
* Most recent logs are at the bottom by default
* To change the time period, see the options top right

