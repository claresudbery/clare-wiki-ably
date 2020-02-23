---
layout: page
location: pages/coding/infra/servers/leaf
permalink: /pages/coding/infra/servers/Chef
---
## Misc

  - It’s a configuration management tool
    
      - Other examples: Puppet, ansible
    
      - A way of describing how you want your infrastructure to be, then
        the tool will get the infrastructure into that state
    
      - Things like users, packages, firewall rules
    
      - Terraform is an infrastructure definition tool whereas Chef
        (etc) are configuration management tools

  - Has its own repo

  - Maintains files and config across all nodes managed by chef

  - So for instance if you want config files across all hosts, it’s
    configured in chef

  - Might have a thingelk role in chef, then all the thingelk hosts have
    that role, then you can maintain files and configs for those
    particular hosts

## Nodes

  - A thing configured by chef

  - In 99% of cases a node will be a host (cd by physical or virtual)

  - Eg: **knife node edit**

## Cookbooks and Recipes

  - Chef like using metaphors, eg cookbook
    
      - Config split into different chunks/places
    
      - Cookbooks are a logical grouping of recipes
    
      - Recipes are low level scripts
        
          - Written in kind of Ruby – a DSL written in Ruby
        
          - Every recipe contains resources
        
          - Eg:
            
              - package “nrpe” do
                
                  - Action :install
            
              - End
        
          - This is installing a piece of software called nrpe
        
          - Package is a keyword in chef – it’s a particular type of
            resource
        
          - Another type of resource is a template
            
              - A generic template is used, with parameters passed in,
                to create a concrete file
            
              - These look slightly confusing – the first line actually
                defines the OUTPUT, ie the concrete file that is created
                using the template
            
              - The template used to create the file is specified under
                “source”
            
              - See ticket 1952 for an example of using templates
    
      - Cookbooks are collections of recipes
    
      - Might have a cookbook to do with nginx, apache, elastic search
    
      - The cookbook is a directory, contains recipes, files, templates,
        attribute files

## Syntax

  - Documentation:
    [<span class="underline">https://docs.chef.io/resource\_common.html</span>](https://docs.chef.io/resource_common.html)

  - Chef Guards:
    
      - You can use “not\_if” to guard against something happening twice
        and make your code idempotent - eg don’t create a drive that
        already exists
    
      - More here:
        [<span class="underline">https://docs.chef.io/resource\_common.html</span>](https://docs.chef.io/resource_common.html)

## Roles

  - Roles are how you map cookbooks and recipes to a host

  - Role
    
      - Specified in json
    
      - Contains Runlist – list of cookbooks and recipes
        
          - When chef runs on the host that has that role, it’ll go
            through the runlist and execute it in order
        
          - Refers to cookbooks/recipes: eg Nagios::thingy means
            cookbook called Nagios and recipe called thingy
    
      - There is a base role (base.json) which everything should inherit
        from
        
          - Although it has to be explicit – should be the first thing
            in each runlist
        
          - \!\! Don’t forget to look in base.json, partic for stuff
            that might be common to all \!\!

## Role Attributes

  - Role attributes
    
      - Node attributes:
    
      - You can specify attributes on Chef nodes
    
      - Node = machine, instance, box, server
    
      - Each node has a unique set of attributes, these are called node
        attributes
    
      - The places you can set them:
        
          - 1\) Cookbook attributes file
            
              - Eg monitoring/attributes/nrpe.rb
            
              - The name of the attributes file doesn’t have to respond
                to anything – all files in the dir will get run
            
              - Convention is to have default.rb in the attributes dir –
                if you use default.rb in the recipes dir and you don’t
                specify a recipe in the run list, then default.rb recips
                is the one that’s loaded – but in attributes, calling it
                defalt.rb doesn’t have the same meaning (?) cos
                everything is loaded?
            
              - It’s possible to use node.override when specifying an
                attribute – not totally sure what effect that will have
        
          - 2\) Edit node attributes directly on chef server, using
            knife
            
              - This will be preserved on the server whenever Chef runs
            
              - You can also query it to find that value using knife
                
                  - Cmd: **knife node edit** \[node name\]
            
              - BUT it won’t be in source control
            
              - The chef server is like a master – not same as editing
                individual server/host
            
              - Cmd: **knife node edit** \[host name\] – this would be
                for one host
            
              - Most common use case for this is to set a nonagios flag
                on a node we know is bad, so we don’t get alerts for
                that host
            
              - You can edit multiple nodes at once using **knife
                exec**:
                [<span class="underline">http://devopsblues.com/knife-exec-mass-operations-on-chef-node-run\_list-and-attributes/</span>](http://devopsblues.com/knife-exec-mass-operations-on-chef-node-run_list-and-attributes/)
        
          - 3\) set attributes on a role
            
              - Eg roles/thingelk.json
        
          - 4\) ohai – a tool
            
              - Ships with chef
            
              - Used to populate attributes that are derived from things
                we know about the host – like IP address, host name,
                cpu, memory
            
              - You can write your own plugins
            
              - Common use case is if you have an attribute you want to
                expose in chef code, eg EC2 metadata service, returns
                different info depending on which host is calling it, so
                you can ask for things like availability zone – so there
                might be a plugin that calls out to get that data and
                then expose it as attributes in Chef
            
              - Similarly if you had a way of finding out what data
                centre you’re in, you could write a plugin to get that
                info and expose it as an attribute – so for instance use
                different data servers depending what data centre you’re
                in

## Knife search

  - (other knife commands are below)

  - Looking for an individual host? Use **knife search**
    
      - Need to be in VM
    
      - You can search on any attribute, eg nonagios:true
    
      - The switch -i means you only get host name in your results,
        instead of all the host info

  - Examples:
    
      - List servers in a particular role: **knife search -i
        'roles:SecThing'**
        
          - This also works (I don't know the diff between role and
            roles in this context): **knife search -i 'role:SecThing'**
    
      - List servers matching a particular fqdn pattern: **knife search
        -i "fqdn:nagios\*"**
    
      - Get node/server info for a particular server: **knife search
        “fqdn:xxx.ab2.acme.com”**
        
          - This is equivalent: **knife search node xxx.ab2.acme.com**
        
          - This is also equivalent: **knife node show
            xxx.ab2.acme.com**
        
          - To see all attributes, add the **-l** flag: **knife node
            show -l NODE\_NAME**

  - Use knife command to search chef server
    
      - Search for hosts with the role SecThing: **knife search -i
        'roles:SecThing'**
        
          - To find role names, you can go to the chef repo and see the
            roles in the roles folder
        
          - To sort, add | sort to the end
        
          - To search on domain names, use fqdn (fully qualified domain
            name), eg: **“fqsn:thingelk\*”** instead of
            **“roles:thingelk”**
        
          - FQDNs are nearly always lower case, and the command is case
            sensitive

  - Handy

## Chef Shell

  - To run a chef script outside of chef server:
    
      - In VM: **sudo chef-shell -z**
    
      - When writing Chef scripts, you need pychef installed: **sudo
        pip3 install pychef**

## Other Knife Commands

  - See separate section in this doc for **knife ssh**

  - Useful commands:
    
      - See ALL attribute info for a node: **knife node show -l
        NODE\_NAME**
    
      - See normal attribute info for a node: **knife node show -m
        NODE\_NAME**
    
      - See a particular attribute (in this example the nonagios
        attribute) for a node: **knife node show -a nonagios
        NODE\_NAME**
        
          - Docs:
            [<span class="underline">https://docs.chef.io/knife\_node.html</span>](https://docs.chef.io/knife_node.html)
    
      - To get multiple attributes:
        [<span class="underline">https://stackoverflow.com/questions/16843301/knife-obtaining-two-or-more-attributes-in-one-go</span>](https://stackoverflow.com/questions/16843301/knife-obtaining-two-or-more-attributes-in-one-go)

  - knife exec is useful for many things, including editing multiple
    nodes at once:
    [<span class="underline">http://devopsblues.com/knife-exec-mass-operations-on-chef-node-run\_list-and-attributes/</span>](http://devopsblues.com/knife-exec-mass-operations-on-chef-node-run_list-and-attributes/)

  - Official knife documentation:
    [<span class="underline">https://docs.chef.io/knife.html</span>](https://docs.chef.io/knife.html)

## Testing

  - via Kitchen test recipes, in learn.chef.io?

## Deployment

  - If you push to git, your changes will automatically get deployed
    within 15 minutes
    
      - This is because chef runs every 15 minutes

  - Test your Chef:
    
      - These two commands:
        
          - This: **sudo chef-client --why-run --local-mode --once
            --override-runlist \[cookbook\]::\[recipe\]**
        
          - This: **sudo chef-client --local-mode --once
            --override-runlist \[cookbook\]::\[recipe\]**

  - To deploy Chef:
    
      - Lots of **knife spork** stuff – see
        <https://docs.google.com/document/d/1ydXrsZX_g9uyvgMoZUovT0G8L5OcrXxRQDSWzw3ULDo/edit>

  - Force chef to run on a server you’re logged into: **sudo chef-client
    --once**

## Knife ssh

  - Like ssh but you give it a param of a chef search instead of a host
    name, then give it a command and it means it will ssh into all the
    servers in the list of search results, 3 at a time

<!-- end list -->

  - An example: **knife ssh role:Logstash “sudo bash -c ‘\>
    /var/log/logstash/logstash.log’” -P -C 3**
    
      - We are ssh-ing into all log files for hosts with the Logstash
        role
    
      - Once we get there we are running a command in the bash prompt
        (**bash -c**). The command that we run is **\> \[path to
        file\]**, which will empty the specified file - ie bring it down
        to zero bytes
    
      - The -P switch asks you for your password once only
    
      - The -C specifies concurrency, so this will run three
        concurrently
    
    <!-- end list -->
    
      - 3 is always a good concurrency number to get a good balance
        between speed and saturation

<!-- end list -->

  - Another example of the same command:
    
      - This: **knife ssh --concurrency 3 'fqdn:thingelk\*.ab2.acme.com'
        'df -h /' -P**

      - This ssh-es into all specified hosts, runs a **df** command on the root to see percentage disk usage, with the **-P** command to enter password automatically, and concurrency of 3 so it can do 3 hosts at a time.
    
      - Note that --concurrency is equivalent to -C (double hyphen, not
        single)
    
      - In this case the flag can go before the positional argument, but
        this isn’t
    
      - 
## Chef logs

  - Chef logs
    
      - Check on host: **less /var/log/chef/**
