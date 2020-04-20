---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/AWS-CLI
---
## Misc

  - These notes were originally written 2018
  - There might be some relevant script stuff in [cadogan/infra
    (PRIVATE)](https://github.com/claresudbery/Cadogan/tree/master/infra)
  - We have two clis:
      - Brew install awscli
      - After installing run this command: Aws configure
          - It will ask for Profile
              - You can create separate profles, but if you don’t it
                will give you a default
              - If you have more than one profile: Export
                AWS\_PROFILE=”\[profile-name\]”
          - Less \~/.aws/config
          - Secret keys:
              - AWS | IAM | Users | Security Credentials | Access Key ID
                  - Delete previous and add new one: Create access key –
                    copy secret key
      - Cmd **aws help** will give you cli commands
      - Cmd **aws s3 ls s3://\[bucket-name\]**
          - This allows you to connect straight to S3 bucket
      - In general, it can be useful to use the command line
  - AWS CLI Documentation:
    [<span class="underline">https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html</span>](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

## AWS CLI Auto-scaling groups

  - aws ec2 update-auto-scaling-group --auto-scaling-group-name
    awseb-e-9mnmbbramu-stack-AWSEBAutoScalingGroup-1C00LH0YI7JD9
    --health-check-type ELB
  - aws autoscaling describe-auto-scaling-groups
    --auto-scaling-group-name my-auto-scaling-group
    awseb-e-9mnmbbramu-stack-AWSEBAutoScalingGroup-1C00LH0YI7JD9
