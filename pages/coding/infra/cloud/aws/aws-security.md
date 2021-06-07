---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/AWS-Security
---
## Historic Notes

  - These notes were originally written 2018

## **IAM Users**

  - If you check the IAM users section in AWS, you’ll see user accounts.
      - Click through and you’ll see access policies.
      - Click Show Policy and you’ll see what a policy looks like.
          - I’ve never created one of these policies from scratch, but
            there’s plenty of documentation online.
      - This allows users to access the relevant S3 bucket

## Security Groups – EC2

  - Start in EC2
  - You can set up a server to only run on some networks
      - Might mean you can’t access it from home
      - You could use a VPC to work from home – use private IPs, not
        public – so others can’t access the server
      - To add an office: Add IP address of the network to security
        groups – then everyone there can access your server
  - If you want to add security for any EC2 instance, eg outbound or
    inbound
      - Select the instance
      - Scroll to the far right to see security group
      - Click on the link
      - \!\! Note that if you start from Security Groups (listed on the
        left in EC2), it doesn’t display them all at once, so you might
        need to click (top right) for the next page of results
  - Click Edit
  - You need to enable
      - These:
          - ssh access (port22)
          - http access (port80)
          - Custom TCP Rule (port 8153) (this is to enable http)
          - HTTPS access (port 443)
          - Custom TCP Rule (port 8154) (this is to enable HTTPS)
      - Why:
          - Http, Custom TCP and HTTPS are so you can access from
            browser (eg
            [<span class="underline">http://54.171.48.173:8153/go/pipelines</span>](http://54.171.48.173:8153/go/pipelines)
            or
            [<span class="underline">https://54.171.48.173:8154/go/pipelines</span>](https://54.171.48.173:8154/go/pipelines))
          - SSH is so that you can ssH in on command line
  - \!\! Some of the IPs you see configured might be third parties like
    an ISP provider
      - Don’t remove access without checking first \!\!
  - If adding access from home, to find your external IP address you can
    use this site:
    [<span class="underline">https://www.whatismyip.com/</span>](https://www.whatismyip.com/)
  - If you want to connect to any machine, you can just click the
    Connect button in EC2 (at the top of the list of instances, when
    you’ve selected an instance) – same as for CodeCommit
  - But will only work if ssh is enabled on the inbound route in
    security groups
## Setting yourself up on first use

  - Select EU (Ireland) from top right
  - First time in, set up multi factor authentication
      - Click Services, top left
      - Select IAM (in the group headed Security, Identity and
        Compliance)
      - Select Users on the left
      - Click on your name
      - Select Security Credentials
      - Click the pencil icon next to Assigned MFA Device
      - Select “virtual” if you want to use an authenticator app on your
        phone
      - Install Google Authenticator on your phone, and scan the VR code
      - After setting this up, sign out and sign in again
