---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/AWS-CodeCommit
---
## Historic Notes

  - These notes were originally written 2018

## Before Accessing the Code

  - Visit AWS Management Console:
    [<span class="underline">https://829851215903.signin.aws.amazon.com/console</span>](https://829851215903.signin.aws.amazon.com/console)
  - If not already done, enter your credentials
  - If you don’t have git installed, follow Step 2 in this guide:
    [<span class="underline">http://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html</span>](http://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html)
  - Set up your git credentials: Follow Step 3 in this guide:
    [<span class="underline">http://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html</span>](http://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html)
  - Move onto “Accessing the Code” below.

## Accessing the Code

  - (first see “before accessing the code”, above)
  - Visit AWS Management Console:
    [<span class="underline">https://829851215903.signin.aws.amazon.com/console</span>](https://829851215903.signin.aws.amazon.com/console)
  - If not already done, enter your credentials
  - Expand the All Services section at the top
  - Select CodeCommit (under Developer Tools, in the middle)
  - Make sure you select the right region in AWS: top right: EU
    (Ireland)
  - Now you should see a list of repos (see Repo Descriptions below)
  - Click on these one by one. For each one:
      - Open Terminal (Mac), or command line in Windows (Windows key + X
        + A)
      - Navigate to folder where you want code to live
      - Back in CodeCommit, in your repo, click on Connect (top right)
      - For ssh: see below
      - For https (not recommended):
          - In the pop-up dialog towards the bottom there is a box with
            a line of text starting **git clone** – copy this into your
            terminal
      - You will be prompted to enter user name + pw: use the ones you
        created for your git credentials above.
          - You might not have to repeat this step for every repo

## Ssh Access

  - In Terminal:
      - Cd .ssh (in home folder)
      - Vi \[your-git-name\]-github.pub
      - Copy all contents
  - In AWS:
      - Go to IAM
      - Go to Users – select your name
      - Go to SecurityCredentials tab
      - Click Upload SSH Public key
      - Paste contents of public key
      - Go to CodeCommit and select any code base
      - Click Connect
      - Select the ssh radio button (under connection type)
      - Copy the text in the top code box (starts “Host
        git-codecommit.\*.amazonaws.com”)
  - In file system:
      - In the .ssh folder (probably in your home folder), there is a
        file called config
      - If you don’t have this file, create it in a text editor (note
        that it has no file extension)
      - Paste the text just copied from the Connect section
      - Edit the following sections:
          - **Your-IAM-SSH-Key-ID-Here** = SSH Key ID as displayed in
            IAM | Security credentials (see above)
          - **Your-Private-Key-File-Name-Here** = the private key file
            which matches the .pub file mentioned above
              - In your .ssh folder, you will see two files, with the
                same name, one has a .pub extension and one doesn’t
      - Save the config file
  - Now you can clone any repo by (eg) copying the git clone line from
    the Connect section in Code Commit
