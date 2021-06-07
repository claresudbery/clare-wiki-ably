---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/Cloud-Formation
---
## Intro

  - You can access all Amazon APIs via Cloud Formation
      - Declarative
      - Use to create and manage resources in AWS setup
      - In Samba: See Aws-provisioning github repo
          - Has scripts and templates to instruct Cloud Formation to
            create infrastructure
          - Eg beanstalk.json
          - If you make changes, Cloud Formation (CF) detects the
            changes
              - For instance, adding a new tag for a new version
              - It will then perform an update
              - You will see this in the CF front end as an update
          - Cloud Formation creates stack = instantiation of template
          - One template leads to several stacks - one stack per env
