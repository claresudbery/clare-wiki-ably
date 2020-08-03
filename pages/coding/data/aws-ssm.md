---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/AWS-And-SSM
---

## AWS: Connect via localhost using AWS CLI and SSM

### Prerequisites

AWS account with an AWS access key id and and aws secret access key

### Get yourself set up with the AWS CLI and SSM

  - Install AWS CLI: 
      - On a Mac:`brew install awscli`
          - More info
            [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
      - On Windows: see
        [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)
  - Get your AWS access key and token: In AWS console, click your name
    top right and select Security Credentials
  - Export them to your env vars in \~/.bashrc as below
      - The ID is the 20-char one, probably all alpha characters
      - The key is the longer one (40 chars)

```
export AWS\_ACCESS\_KEY\_ID='XXXXXXXXXXXXXXXXXXXX'

export AWS\_SECRET\_ACCESS\_KEY='xxx111/xxx111xxx111xxx111/xxx111xxx111+X'
```

  - Install the session manager plugin (Windows / Linux instructions and
    other
    details [here](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html))

```
curl
"https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip"
-o "sessionmanager-bundle.zip"

unzip sessionmanager-bundle.zip

sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin
-b /usr/local/bin/session-manager-plugin
```

  - Get the AWS CLI set up
      - `aws configure --profile \<PROFILENAME\>`
      - (if you don't have more than one aws account you can use default
        as the profile name or miss it out altogether)
      - AWS Access Key ID and secret access key as above
      - region name is whatever your region is, access key and token from the previous
        step.
      - If you have more than one AWS account you can change to this new
        profile (see below)
      - Now you can use the `aws ssm` command to connect (see below)

**Linux/Mac**

`export AWS\_PROFILE=\<PROFILENAME\>`

**Windows**

`setx AWS\_PROFILE \<PROFILENAME\>`

### Connect Using SSM

Start a session to access the remote server.

  - On command line:
      - `aws ssm start-session --target '\[EC2 instance id\]'`
          - (on Windows, this doesn’t seem to work in GitBash - use
            Windows Terminal or a Linux shell instead)
      - Don't forget the quotes around instance id - the resulting error
        if you forget is non-obvious
      - You might want to have the ec2-user credentials while you work:
        `sudo su ec2-user` – or if you’re doing database stuff you might
        want `sudo su postgres`
  - ... or via AWS management console:
      - Use the Systems Manager service
      - Select Session Manager on left
      - Click Start Session, top right
      - Select the correct instance and click Start Session
      - You’ll want to have the ec2-user credentials while you work:
        `sudo su ec2-user`
