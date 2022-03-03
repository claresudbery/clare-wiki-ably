---
layout: page
location: "pages/coding/infra/cmd/leaf"
permalink: /pages/coding/infra/cmd/Linux
---

## Misc

  - To find out which version of CentOS: **cat /etc/centos-release**

  - Single unified file system, with disks mounted on that file system
    at different mount points

  - dev is a special bit of the file system for devices
    
      - You can interact directly with devices using those iles
    
      - If you run the df command on a linux box you’ll often see hard
        drives called sd or md,
        
          - eg you might see sda1, sda2, , sdb1, sdb2 where 1 and 2
            represents partitions and a and b are different disks.
        
          - sd is something like satyrd disk, md is software RAID – sd
            is more modern
        
          - if it’s md you’ll just get multiple partitions, not multiple
            disks (or something)
        
          - If you specify the root, you’ll only get one result per host
            when you run **df /**

  - Use **yum provides python3** to find which package will give us
    python3
    
      - We want python 3.7 for Alex’s script - gives really good string
        interpolation. **yum** only has Python 3.4
    
      - **yum** is locked down in CentOS, everything super secure, so
        doesn’t have stuff as up to date as **brew** does (eg python3)

  - Kernel always starts first, but can’t do much, so the next thing to
    start is the first process
    
      - Old school way of killing Linus = **kill 1** – ie kill the
        process which is numbered 1
        
          - So for instance if you run a docker container with ES where
            ES is process Id 1, then if you kill ES you will kill the
            whole docker container
        
          - Effectively the container is the process if there is only
            one process
    
      - Process 1 is your user space
    
      - Each user space is completely separate therefore low overhead

## Systemctl + SystemD

  - Systemctl – facility for interacting with systemD – An init system
    used for CentOS 7 and most newer Linux distribs
    
      - An init system controls what processes start up at system
        startup – you can use it to control processes like starting,
        stopping, restarting etc

  - Can be used to do stuff with services, eg start / stop services, eg
    ElasticSearch

  - For instance get status of ES: **systemctl status elasticsearch1**

  - SystemD handles processes
    
      - There isn’t much great documentation - best bet is to Google
        “systemd unit file”

  - Systemd unit files:
    
      - Every service / process will have its own unit file - eg (on
        nagios01)/usr/lib/systemd/system/nsca.service for the NSCA
        process
    
      - If you have a look at that unit file, you’ll see it has actions
        defined for ExecStart and ExecReload - often don’t need anything
        for Stop cos you just use kill for that.
    
      - The paths you’ll see are root paths, so using system commands
        like /bin/kill to kill the process which has its own PID defined
        (the PID is what you see when you do **ps -aux**)
    
      - NSCA has type=forking, which means that when it starts, it will
        create a new process but will then fork another process from
        that one. This can happen when it needs elevated privileges to
        get things started but then creates a new forked process with
        lower privileges, and kills the parent one (although sometimes
        parent processes are kept around for whatever reason).

  - Systemctl commands:
    
      - Cmd: **systemctl** **list-unit-files**
    
      - Cmd: **systemctl status \[service name\]**
    
      - Cmd: **systemctl restart \[service name\]**
    
      - Cmd: **systemctl start \[service name\]**
    
      - Cmd: **systemctl stop \[service name\]**
    
      - Cmd: **systemctl disable \[service name\]**
    
      - Cmd: **systemctl** **journal -u \[service name\]**: get logs
        
          - Or try **journalctl -u \[service name\]**
        
          - We once got the following error on thingelkarchive15
            (7/8/19, investigating THING-142657) when running
            journalctl: “Error was encountered while opening journal
            files: Input/output error”
        
          - Tera fixed this by manually removing the journald logs and
            restarting systemd-journald
    
      - Cmd: **systemctl reset-failed** when you want to restart a
        failed service
        
          - **systemd** manages the restart of services when they fail
        
          - but if a service fails too many times, too quickly, it will
            stop trying to restart the service and will instead mark the
            service as failed
        
          - if a service is marked as failed by systemd then it ignores
            new commands to start it back up
        
          - there is a command **systemctl reset-failed** that clears
            the failure flag from the service and lets one restart the
            service again the normal way

## Syslog

  - Syslog is a Unix standard

  - Any Linux based server will be running syslog to do its host based
    logging

  - Eg audit logs, kernel logs all go through syslog

  - They use Syslog NG (Next Generation?)

  - There are different binaries you can slot in to fulfil the Syslog
    role

  - They all use the same protocol

  - Although originally designed for system events, is also used here
    for application logs

  - Syslog-ng is running to get data from servers to loghosts
    
      - Loghosts keep copies of all logs
    
      - Syslog-ng has client and server versions - running on clients to
        send data and on loghosts as server - has an open port that you
        send the data to, then stores the data on disk

## Unix

  - Linux is a flavour of unix

  - There are some commands the same

  - Most of the time the difference doesn’t really matter

  - But some commands in unix have different behaviour to Macs (OSX is
    based on unix)

  - Windows cmd prompt (DOS???) has a lot of differences

  - Normally if you’re struggling in the terminal, you’ll want to look
    up unix commands

## Windows

- If you want to run Linux on Windows, you need [WSL](/pages/coding/dotnet/Windows-Subsystem-for-Linux---WSL).

## Yum

  - Yum is the package manager used in CentOs Linux

  - Yum is locked down in CentOS, everything super secure, so doesn’t
    have stuff as up to date as **brew** does (eg python3)
    
      - Apparently (according to Ben Smith) you can manually add the
        newer python repo for yum on the command line - but you have to
        accept the keys for the repo not shipped with the distribution

  - Use **yum provides python3** to find which package will give us
    python3

  - Use **yum repolist** or **yum repolist -v** to see list of current
    repos
    
      - \-v means verbose

  - Repos are also visible here: **cd /etc/yum.repos.d**
    
      - (In those .repo files, set enabled=0 to disable a repo)

## Crons / Cron jobs

  - Jobs which run periodically

  - There’s a format which specifies how regularly they run

  - Eg Might contain an asterisk which is a wildcard

  - Cmd: **crontab -l** – gives you a list of cron jobs for current user

  - Cmd: **sudo** **crontab -l** – lists all cron jobs for root

## Find default .bashrc in Ubuntu

It's here: `/etc/skel/.bashrc`

