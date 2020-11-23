---
layout: page
location: pages/coding/infra/o11y/leaf
permalink: /pages/coding/infra/o11y/Nagios
---
## Misc

  - Used for alerting

  - Set up a series of alerts based on all of our systems

  - Typically notify when something goes wrong, and also when something
    resolves

  - Integrations with Slack and Pager Duty

  - Configure settings in Pager Duty so alerts result in texts and phone
    calls

  - High urgency and low urgency alerts

  - Alerts contain links to run books

  - Try to strike a balance between good coverage and excessive noise

  - Alerts when thresholds are crossed

## onboarding session on Alerting / Nagios

  - Nagios asks NRPE daemon - which is installed on host - to run a
    check and then send the results back to Nagios - advantage being
    that you only need one port open
    
      - \- so effectively Nagios starts the conversation by ASKING for
        the data

  - NSCA daemon runs on host - often via cron - scheduled - and sends
    data back to Nagios
    
      - \- the difference being that with NSCA, it runs the check
        automatically without being asked
    
      - Active vs passive checks (which is how they’re defined in
        Nagios):
        
          - active = NRPE - active from Nagios
        
          - passive = NSCA - no action on Nagios’ side

  - Postfix and PDAgent are both running on Nagios hosts
    
      - Postfix doing SMTP stuff to send emails because of alerts
        
          - In GCP we can’t do SMTP so can’t send an email from within
            GCP infrastructure, so we use MailJet
    
      - PDAgent sending pages to PagerDuty

  - Catchpoint
    
      - pings acmeweb and if response is too slow or nonexistent then
        after a few minutes it triggers an LSE (Large Scale Event)

## Services / alerts

  - Services folder (nagios/etc/services) used to configure alerts

  - Services are basically alerts
    
      - \!\!\! Services are named in their service\_description field
    
      - \!\!\! They’re really names not descriptions, even though they
        contain spaces\!
    
      - Check\_interval – how often it’s checked – default unit is
        minutes
    
      - Not all fields are mandatory
    
      - See Nagios object definitions:
        [<span class="underline">https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/objectdefinitions.html\#service</span>](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/objectdefinitions.html#service)
    
      - Notification\_options: under what circs do we send an alert:
        “w,c,r” = warning, critical, resolved – means we will be
        alerted for all three states
    
      - Use generic\_service will use a template in the template folder
        – a lot of the required fields are specified there.
    
      - Retry can be specified, re whether it rechecks the status – can
        resolve itself if data changes
    
      - Check\_command: first part is command name, then arguments are
        separated by \!
    
      - So basically we’re running a script on the Nagios box
    
      - But sometimes we want to execute scripts on the relevant host –
        see NRPE below
    
      - Some of the Nagios config is generated from Chef automatically –
        things like lists of all roles and hosts
    
      - So for instance you might see hostgroup\_name of SecThing\_role
        – this tells you there is a role called SecThing, and the
        automation has appended \_role to the name
    
      - check\_aggregate will specify another service, the idea being
        that you aggregate across several hosts and only alert once per
        group of hosts, rather than alerting for every single host
        
          - This does mean that you might have notification\_period set
            to **never** on the services being aggregated, but that
            doesn’t mean they’re not alerting
        
        <!-- end list -->
        
          - For instance you might have something which calls
            check\_aggregate, passing an argument called “Disk Space on
            /root” which refers to another service called “Disk Space on
            /root”
    
      - notification\_period
        
          - Can be set to never – see check\_aggregate

## Pynag / Find all alerts

  - manages the configuration of Nagios
    
      - v useful for navigating the spaghetti of Nagios config - for
        instance if you want to find all the services attached to a
        particular host?

  - type `pynag list --examples` to see some sample `pynag` queries.

  - It’s possible to use pynag to query Nagios and get a list of all
    alerts

  - Spiros put a query together for me - see Acme / scripts /
    FindAllAlerts or ask spiros

<!-- end list -->

  - A sample **pynag** query: **/usr/bin/pynag livestatus --get services
    --columns "state host\_name description"| grep thingelk | grep
    'Kibana Query Interface'**
    
      - This gets Nagios services (a service is an alert definition)
        with the stated 3 columns and then greps for thingelk hosts and
        the 'Kibana Query Interface' service

<!-- end list -->

  - Here’s another one: **pynag livestatus --get services --columns
    "state host\_name description check\_command\_expanded" | grep ^2 |
    grep 'Disk Space' | grep thingelk**

## Disabling notifications in Nagios

  - If you need to make an alert stop shouting at you, you can disable
    it via the Nagios web ui - just find it and click the disable button

## Hosts

  - Each alert will specify a host or a host group

  - Hosts:
    
      - Hosts can be configured with an IP address as an individual host
    
      - But sometimes that IP address might be 127.0.0.1, eg the base
        host gcp-virtual-host, which is a virtual host (nothing to do
        with VMs)
    
      - A host might have register = 0, which means it is abstract and
        can’t be used directly
    
      - If an alert uses a host derived from one with register=0, this
        means you will see any alerts associated with that host grouped
        together in the Nagios UI

  - Host groups
    
      - Host groups represent groups of hosts
    
      - This just means that you can group together host definitions
        into a host group
    
      - The alert will be run on every host in the group
    
      - One host might be in many groups
    
      - $HOSTADRESS$ is a Nagios variable that might be referred to by a
        command
        
          - This means the command will access every host in the group,
            and it will be an actual host with an IP address
        
          - We are writing the services, so it’s up to us how the
            service relates to the host, eg by referring to HOSTADDRESS
        
          - If a service gets run on a host group, that means the
            command is executed several times, once for every host in
            the group.

## NRPE

  - A plugin that allows you to run scripts remotely

  - Nagios Remote Plugin Execution

  - THE NRPE script runs locally, and that’s the thing that says connect
    to a partic host and run a script on that host

  - You can tell an NRPE service / alert because it will use the
    nrpe-service template – but actually it could use that without being
    NRPE – the thing which really tells you is the command itself, which
    is something like check\_nrpe

## NSCA

  - In general NSCA are passive checks that are executed not on nagios
    but on the monitored hosts

  - The NRPE checks are triggered by Nagios via the NRPE hosts

  - the NSCA are scheduled on the remote hosts and inform the outcome
    the nagios hosts via the NSCA daemon
    
      - The NSCA daemon runs on the nagios hosts, with an open port
        which it uses to receive data
    
      - We have had problems receiving data, where a netcat command
        (**nc**) to that port failed

  - so with NSCA you can have a check command run by a crontab that
    inform nagios host

  - so Nagios can trigger a passive check with NRPE or can just sit and
    wait for the results coming from NSCA on the remote hosts

  - that are triggered independently from Nagios (via cronjob)

## Commands

  - Commands folder
    
      - Shared subfolder – commands.cfg contains most of the commands
    
      - These are bespoke – written by us
    
      - You’ll see command\_line is the actual command being run – often
        refers to a Ruby script in the libexec folder (use find files to
        find it)
    
      - Each command will tell you whether it can result in ok, warn,
        critical etc – then the service will define whether to alert for
        each possible status

  - Libexec folder
    
      - Ruby scripts
    
      - Commands

  - Some commands
    
      - **check\_http** -
        
          - comes with Nagios - details here:
            [<span class="underline">https://linux.101hacks.com/unix/check-http/</span>](https://linux.101hacks.com/unix/check-http/)
        
          - To run it, you have to run it from one of the Nagios hosts
            (**nagios01.c.acme-nagios-prod.internal** and
            **nagios02.c.acme-nagios-prod.internal**) and add the path
            to the command: **/usr/nagios/libexec/check\_http -I
            thingelk09.ab5.acme.com -H thingelk.acmecorp.com -u / -e
            "302" -S -N**
        
          - ...or if you run it from within **/usr/nagios/libexec/** you
            have to add **.** like this: **./check\_http**

## Nagios UI

  - Host name from service – you can search on this on the left
    
      - Be aware this might not be what you think
    
      - Eg alerts on ELK.ab5 might actually be checking both ab2 and ab5

  - If you click the name of an alert, it takes you through to an
    individual screen for that alert with service commands on the right
    
      - For instance, to check the alert straight away, click reschedule
        to run the check again and see if it’s still in an alert status

## SkipDeploy

  - If a particular host is causing problems, you can use
    nagios.skip\_deploy as a node attribute to make deploys skip the
    host entirely

  - Same process as for nonagios (see below)

## Pdagent

  - There’s a piece of software called pdagent that interfaces between
    Nagios and PagerDuty – this is probably the thing that creates the
    acknowledgement comments at the bottom of the Nagios alert window

## Testing / deploying new alerts:

  - > Tool TryNagios allows you to check syntax

  - Just run **try-nagios** on the command line in your VM

  - > Testing:
    
      - > Start out with a low urgency alert to see if it’s working
    
      - > Before you push, you can check the command to see it does what
        > you expect when you change values
    
      - > Basically though, you are testing in prod
