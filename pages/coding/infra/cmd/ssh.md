---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/SSH-Access
---
## Setting up ssh keys on your machine

- Everything you need is [here on the Git page](/pages/coding/tools/Git#use-ssh-to-access-repos-instead-of-https).

## SSH Access to Servers (Mac and Windows)

  - \!\! Remember your backend code might be running in a docker
    container, so you won’t see the code directly on the instance – you
    have to look into the docker container
      - To see running docker instances: **sudo docker ps -a**
  - To ssh direct into instance, you can use a pem file
  - To copy files, see [Copying Files From an SSH-ed Instance](#copying-files-from-an-ssh-ed-instance)
  - Ssh access: These are the commands to run on command line:
      - \!\! It’s not the same on Windows – see below
      - This: ssh -i "your-pem-file.pem"
        [<span class="underline">ubuntu@\[ip address
        here\]</span>](mailto:ubuntu@54.229.230.165)
      - Your pem file has to be in same path - or specify exact path
      - To find the url: Go to EC2 instance, select in EC2, bottom right
        see public IPv4 and domain IPv4 - one is just numbers, one is
        longer with letters, either one of those will do
      - Note that each url must be prefixed by user name
          - For instances which are spawned by EBS, the user is likely
            to be ec2-user
      - To ssh out again, type **logout**
  - \!\!On Windows, use Putty.
      - Comprehensive instructions for setting this up here:
        [<span class="underline">https://linuxacademy.com/howtoguides/posts/show/topic/17385-use-putty-to-access-ec2-linux-instances-via-ssh-from-windows</span>](https://linuxacademy.com/howtoguides/posts/show/topic/17385-use-putty-to-access-ec2-linux-instances-via-ssh-from-windows)
      - Once you’re set up, this is how you ssh in:
          - Start the PuTTY utility
          - Enter host name,
              - eg
                [<span class="underline">ubuntu@</span>](mailto:ubuntu@34.251.102.228)\[ip
                address\]
          - Expand the SSH section on the left and click Auth
          - Browse for ppk file
          - Click Open
          - To ssh out again, type **logout**
          - For more on how to use PuTTY, see PuTTY section below

## Copying Files From an SSH-ed Instance

  - To copy files, use SCP command or PSCP on Windows with Putty
    installed (see [above](#ssh-access-to-servers-mac-and-windows))
      - SCP on a Mac:
          - scp -i "\[path to file\]"
            [<span class="underline">ubuntu@\[ip
            address\]:/home/ubuntu</span>](about:blank)
          - \!\! Note that you might only have permission to copy into
            home folder
          - That command (^) copies files from local machine to ssh-ed
            machine
          - To do it the other way around, just swap source and target
      - PSCP in Windows with PuTTY:
          - Copying files from the ssh-ed machine to the outside world:
              - First create a saved host config:
                  - In PuTTY, set up a host config
                  - Then instead of clicking Open, select Sessions (top
                    left)
                  - Enter a name under Saved Sessions
                  - Click Save
                  - Now if you want that host config again, you can just
                    click Load
              - Now in a command prompt: **pscp
                ec2-user@SavedHost:/folder/myfile.txt C:\\Temp**
                  - (or **pscp C:\\Temp/myfile.txt
                ec2-user@SavedHost:/folder** for the opposite direction)
                  - **SavedHost** is your saved PuTTY host config.
                  - **In this case ec2-user is the user you are using to
                    log in to the remote server**
                  - This will copy the file from the remote SSH-ed host
                    to your local machine.
              - More here:
                [<span class="underline">https://it.cornell.edu/managed-servers/transfer-files-using-putty</span>](https://it.cornell.edu/managed-servers/transfer-files-using-putty)

## PuTTy Tips

- You can configure the user name (eg ec2-user) so you don't have to type it in every time - on the left, Connection | Data and then **Auto-login username**. Don't forget to go back to Session (left) and click Save.
- When you make changes to a config, you have to go back to Session (top left) and click Save for those changes to stick.
- You can use **SSH tunnel** (on the left - Connection | SSH | Tunnels) to attach a port to an SSH configuration and forward from that port to your server via SSH (you have to manually open the session first for it to work).

## Copying files between a remote AWS SSM instance and your local machine

- SSM - AWS Systems Manager Session Manager.
- [Details here](https://www.tripwire.com/state-of-security/security-data-protection/cloud/aws-session-manager-enhanced-ssh-scp-capability/)

## Using ssh to access GitLab

First make sure you have a GitHub account. If you don't have one already, you can sign up (it's free): https://github.com/ 

Then you will need to create an SSH key and add it to both GitHub and GitLab. The following instructions tell how to create / add an SSH key to GitHub: https://help.github.com/articles/generating-an-ssh-key/. 

Then you can add your key to GitLab: 

* Go to GitLab: https://git.stockport.gov.uk/

* Go to Profile Settings (picture of a person, bottom right)

* Select SSH Key at the top

* In a command prompt (or GitBash, Powershell or equivalent) run this command: **clip < ~/.ssh/id_rsa.pub**

* This will put the SSH key in your clipboard. Now you can paste it into the large "Key" text box, enter a Title and then click Add Key.