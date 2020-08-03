---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/GovPaaS-And-Cloud-Foundry
---

## Gov PaaS Cloud Foundry Access

### Intro

Cloud Foundry is an open source container-based architecture that runs
apps in any programming language. Gov PaaS is a UK government digital
service, which can be accessed via the Cloud Foundry (cf) utility:

More info: <https://docs.cloud.service.gov.uk/get_started.html#get-started>

#### Pre Requisties:

  - In order to connect, a user needs a Gov PaaS account..
  - `cf utility` needs to be installed following the instructions
    at <https://docs.cloud.service.gov.uk/get_started.html#get-started>
  - If using cloud foundry to access `psql`, you must have
    PostgreSQL installed locally; with access on the $PATH/%PATH% to
    the psql command line utility.

Note - when instantiating `cf login` for the first  time, you may have to
provide the `-a` parameter with `api.cloud.service.gov.uk`

### Access

1.  Install the "cf" utility:
    [https://docs.cloud.service.gov.uk/get_started.html#get-started](https://docs.cloud.service.gov.uk/get_started.html#get-started)

2.  Install the "conduit" extention 

> cf install-plugin conduit
> 
> Note, a recent upgrade by Gov PaaS means you might need to upgrade to
> existing conduit plugin:
> 
> cf install-plugin -r CF-Community "conduit"

3.  Tunnel into the server

> cf conduit \[DB\_Service\_Name\]  -- psql

*Note - by logging in using "cf conduit" passing "psql", you are
effectively logging in as the postgres identity user account*
