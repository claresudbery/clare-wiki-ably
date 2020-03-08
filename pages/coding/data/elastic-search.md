---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Elastic-Search
---
## General

  - To find out which version of ES: just log into that node and do
    **curl localhost:9200**

  - **For more detail, see**
    
      - **closed indices:**
        <https://docs.google.com/document/d/1eeEXpBgsuWIIt_teRYAIbYxY9Zf7sdQNC6BKlw9BPVg/edit#heading=h.gjdgxs>
    
      - **Eritrea:**
        <https://docs.google.com/document/d/1ydXrsZX_g9uyvgMoZUovT0G8L5OcrXxRQDSWzw3ULDo/edit>

## Disable ELK on a server

  - Temporarily disable Elastic Search, Logstash and Kibana (set
    enabled=0 in the repo files you find here: /etc/yum.repos.d)
    
      - **cd /etc/yum.repos.d**
    
      - **sudo vi kibana.repo**
    
      - **sudo vi elastic.repo**
    
      - (In those .repo files, set enabled=0)

## Querying ES

  - This command: **curl
    "thingelk.acmecorp.com:9200/thingelk-2019.02.05/\_search?sort=\\@timestamp:desc"
    -s -n | jq "." | less**
    
      - What it’s doing:
    
      - 1\. Hitting the \_search endpoint on the API
    
      - 2\. Sorting based on the timestamp field, in descending order
        
          - \! Results will be paginated (ie you only get one page of
            results at a time), so if for instance you wanted to know
            what date range was covered in this index, you could sort in
            ascending order first (the default), then sort again in
            descending order
    
      - 3\. The -s switch means something like “silent” and means that
        you won’t get the meta data at the top of the results, which can
        create distracting noise.
    
      - 4\. The -n switch means “use my netrc file (net resources) for
        permissions”
        
          - If you look at **vim /Users/csudbery/.netrc** you’ll see
            that we set a username and password for
            thingelk.acmecorp.com - this is on my laptop, I don’t have
            it set up on my VM
        
          - The alternative is to use the -u flag to specify the user,
            like this: **curl -u csudbery
            "http://thingelk01.ab5.acme.com:9200/\_cluster/health?pretty"**
            
              - ... and then you will be prompted for a password
        
          - ...because thingelk needs credentials for access
    
      - 5\. Pipe the ES search results to jq, which gives pretty-print
        for json output
        
          - The “.” argument means start at the root node of the json
    
      - 6\. Pipe the prettified output to a less console so we can
        navigate as though it were a file

## CAT API and other ES APIs

  - Accessed like this from anywhere (including your local machine):
    **curl logs.acmecorp.com:9200/\_cat/master**
    
      - (That command will give you the current ES master)
    
      - \! If you’re accessing a Thingelk cluster you need to add user
        credentials after the url like this: **-u csudbery** - and then
        enter your password
        
          - Cmd: **curl thingelk.acmecorp.com:9200/\_cat/indices -u
            csudbery**
    
      - The \_cat endpoint gives you info on the cluster

  - Include column headings in the output: **?v**
    
      - Like this: **curl logs.acmecorp.com:9200/\_cat/nodes?v**

  - Commands:
    
      - Cat API :
        
          - Documentation for version 2.4, which is what we’re using:
            [<span class="underline">https://www.elastic.co/guide/en/elasticsearch/reference/2.4/index.html</span>](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/index.html)
        
          - Generally useful stuff:
            
              - To get headings on columns, add **?v** after the
                endpoint, ie **\_cat/nodes\\?v**
            
              - \!\! in Zsh, you’ll have to escape the ? char, or just
                put whole url in quotes: **\_cat/nodes\\?v**
            
              - To get results in json: **curl
                "testelk01.ab5.acme.com:9200/\_cat/indices?format=json\&pretty"**
            
              - To get bytes instead of human-readable numbers: **curl
                "testelk01.ab5.acme.com:9200/\_cat/indices?bytes=b"**
        
          - API endpoints:
            
              - If you want to know what endpoints are available for
                \_cat, just hit the \_cat endpoint with nothing added,
                and you'll get a helpful list\!
            
              - cluster health status: **\_cat/health**
            
              - Get current ES master: **curl
                logs.acmecorp.com:9200/\_cat/master**
            
              - Get current ES nodes: **curl
                logs.acmecorp.com:9200/\_cat/nodes**
            
              - Get current ES indices: **curl
                logs.acmecorp.com:9200/\_cat/indices**
                
                  - To sort by file size: **curl
                    localhost:9200/\_cat/indices | tr '\[kmg\]b'
                    '\[KMG\] ' | sort -k9hb**
                
                  - ...or transform sizes from human readable to bytes
                    within the api call and then it’s easier to sort
                    with sort -nk: **curl -s
                    http://testelk.acmecorp.com:9200/\_cat/indices?bytes=b
                    | sort -nk9**
            
              - Allocation: **curl
                logs.acmecorp.com:9200/\_cat/allocation**
            
              - Shards: **curl logs.acmecorp.com:9200/\_cat/shards**
            
              - Get all the shards that are not starting, and show the
                following columns, sorted in a less console: **curl
                -XGET -n
                'logs.acmecorp.com:9200/\_cat/shards?h=index,shard,prirep,state,unassigned.reason,node'
                -s | grep -v START | sort | less**
            
              - Current logstash template (ie template for all indices
                named logstash-\*)**: curl
                logs.acmecorp.com:9200/\_template/logstash**
            
              - Settings (including some template info) for an
                individual index: **curl
                logs.acmecorp.com:9200/logstash-2019.03.07/\_settings**
    
      - Nodes API:
        
          - To get the memory used for each of the fielddata fields in
            the logstash index, grouped by hosts: **curl -n http://
            logs.acmecorp.com:9200/\_nodes/stats/indices/fielddata?fields=\***
    
      - Stats API (Indices stats):
        
          - Documentation:
            [<span class="underline">https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-stats.html</span>](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-stats.html)
        
          - Index stats: **curl logs.acmecorp.com:9200/\_stats**
    
      - Tasks API:
        
          - Documentation:
            [<span class="underline">https://www.elastic.co/guide/en/elasticsearch/reference/current/tasks.html</span>](https://www.elastic.co/guide/en/elasticsearch/reference/current/tasks.html)
        
          - To see status of any long-running searches: **curl -s**
            **"http://logdbmaster.acmecorp.com:9200/\_tasks?actions=indices:data/read/search\&pretty"
            | jq '.nodes\[\].tasks\[\].running\_time\_in\_nanos' | awk
            '{print "minutes:", $1/6e+10, "nanoseconds:", $1}'**

## Too few shards
  - (See also [Templates](#templates))
  - Happens when template deleted but not replaced
      - This is because when template changes are deployed the old one
        is deleted before the new one is deployed, so if there are any
        errors you just get no template
  - There should be 300 shards on our log master, not 5
      - 5 is the default which is how you know there is no template,
        because our template specifies 300
  - You will see an awful lot of colourful dots in the “thread pool -
    bulk queued” graph in Grafana
  - To see num shards,
      - run [diagnostics tool](https://github.com/claresudbery/Infra-Scripts/tree/master/observability-toolbox/elastictool)
          - Command to run from the elastictool folder:
            **bin/elastictool -H logyyy.xxx.com**
      - Check the value for “Pri” (Pri stands for primary shards)
      - You might also see strange things happening on fielddata, eg
        fielddata ending up on logdbarchive - this will also be because
        there is missing config which would have been in the template -
        it means there are shards on logdbarchive hosts, which is NOT
        where they should be
  - To look at the current template on log master
      - This: **ssh logyyy.xxx.com**
      - This: **cd template/logstash**
          - (I’m not sure what your starting path should be though)
      - If that folder is empty, the template is missing
  - Deploy template: **curl -s -XPUT
    http://localhost:9200/\_template/logstash?pretty -d
    @logstash-template.json**
      - That way you can see what the error is when it tries to deploy
        the template
  - If it’s a mapping error
      - in partials/logstash\_logdb\_mappings, you’ll find mappings for
        every log type
      - Different log types have to have consistent mappings
  - If you correct the error and redeploy the template:
      - You will have to delete the current index
      - This is because the new template is only picked up when index
        rolls over
      - It needs to be done, because not enough shards = slow searches
        (too much load on not enough shards) and inability to ingest
        enough new data
      - If it’s the end of the day just wait til the following day, but
        if it’s the beginning of the day you won’t lose much data
          - You DO lose data though
          
## Problems with ES, eg “Non-OK shard states”
  - See also Finding logs on nodes
  - Restart ES on the host: **sudo systemctl restart elasticsearch**
  - Check shard state: **curl -XGET -n
    'logs.xxx.com:9200/\_cat/shards?h=index,shard,prirep,state,unassigned.reason,node'
    -s | grep -v START | sort | less**
      - Shows you list of shards in the cluster, for each one shows you
        the index, the shard number, the state of the shard and why it’s
        in that state
  - Find out what the master is: **curl logs.xxx.com:9200/\_cat/master**
      - See “ES API” in this doc for more info
  - Look at logs on an ES host: **less
    /var/log/elasticsearch/elasticsearch.log**
  - Look at config on an ES host: **ls /etc/**
  - Check disk space: **df -h** or **du**
      - \! The first column in the results is partitions, NOT folders
      - Eg sda4 is the fourth partition of the first (“a”) SATA hard
        drive
  - Check cpu usage: **htop**

## Templates

  - (See also [“too few shards”](#too-few-shards))

  - The template defines how many shards you get amongst other things

  - ES has a separate concept of template not related to chef templates
    
      - We use chef templates to provision ES templates
    
      - Templates live in chef and get provisioned by chef

  - chef has to curl ES API to get the template into ES

  - To update a template you have to delete existing and replace with
    new one
    
      - \- well don’t have to, but this is how we have configured chef
        to do it

  - Indices are created daily. They’re created based on ES templates –
    at midnight UTC. So a changed template is not acted on til midnight
    AND if it’s missing you don’t notice til midnight.

  - So if you update a template you should query the ES API (**curl -s
    http://logdbmaster.acmecorp.com:9200/\_template/logstash | jq '.' |
    less**) to check it’s actually there\! In fact we should automate
    this.
    
      - If there’s no template for the index that’s been created, it
        just uses default settings
    
      - Many differences between our template and the default
        
          - We don’t enable dynamic mappings
        
          - Number of shards
        
          - 5 is default num of shards, but our template specifies 300
    
      - Fewer shards limits the amount of concurrent writes – many
        shards = faster writes.
    
      - 5 shards = more data per shard. All that data has to be held in
        memory when you’re querying ES – too much data per shard – hence
        the error above.
    
      - ES has measures in place to prevent using too much memory –
        hence you get a circuit breaker exception if there are [“too few shards”](#too-few-shards).
    
      - (See section on circuit breakers under Troubleshooting)

  - The problem is, you can’t edit an index once it’s been created. So
    if there is a template problem you have to revert the bad template
    change, then check that a template now exists

  - The thing that creates the indices is effectively logstash – if
    logstash tries to write logs with a non-existent index, the index
    will automatically be created.
    
      - To force this to happen, have to delete the existing logstash
        index for today.
        
          - Curl the ES API, do a delete request (**curl -XDELETE
            [<span class="underline">http://logdbmaster.acmecorp.com:9200/logstash-2019.01.16</span>](http://logdbmaster.etsycorp.com:9200/logstash-2019.01.16)**)
    
      - …which means losing data.

  - The problem here is the way we’re managing ES templates in Chef
    
      - Ie deleting and recreating
    
      - It’s not just a question of replacing a file, we’re actually
        updating ES
    
      - Even if were a question of replacing a file, we could check the
        syntax before doing it\! It’s a syntax error that’s causing this
        problem.

## Nodes and Indices and Shards

  - Regular nodes and archive nodes

  - Archive nodes have the older indices

  - When indices are archived they will get moved into an archive node

  - There’s a max number of indices that can be relocated, so you won’t
    see the number go above a certain limit in shard status. So if it
    stays at around 12, that doesn’t mean 12 were relocated. Just means
    no more than 12 at any one time.
    
      - You can see the health of indices with this ES API command: curl
        in terminal – **curl "logs.acmecorp.com:9200/\_cat/indices?v"**
        yellow status means some missing replicas
        
          - To sort the results of that command: **curl
            logs.acmecorp.com:9200/\_cat/indices?v | sort -k3**
        
          - To sort by file size: **curl localhost:9200/\_cat/indices |
            tr '\[kmg\]b' '\[KMG\] ' | sort -k9hb**
            
              - ...or transform sizes from human readable to bytes
                within the api call and then it’s easier to sort with
                sort -nk: **curl -s
                http://testelk.acmecorp.com:9200/\_cat/indices?bytes=b |
                sort -nk9**
    
    <!-- end list -->
    
      - Each index is split into a number of shards (pieces), which are
        distributed across nodes. Each shard, to ensure data redundancy,
        has a primary shard and a replica shard. Red (when listing
        indices – see above) means missing primaries. Means we can’t
        read/write to that index.
    
      - Cluster health will be red if there are some primary shards that
        are unassigned.
    
      - If they’re unassigned that means the shard is in an index but
        not associated with a node.
    
      - You want both the primary shard and the replica shard to be
        assigned.
    
      - If the primary shard is unasigned then the replica will
        automatically become the primary and a new replica will be
        created.
    
      - If a primary shard cannot be allocated then you can’t write
        anything to that index.
    
      - ES writes shard data to disk. If two nodes go down, one with
        primary shard and one replica shard
    
      - Three types of node: master, data, client/coordinating nodes.
        Client codes are part of cluster, can receive requests but don’t
        contain data and will never be master-eligible
        
          - If it is a master, it’s making decisions about what happens
        
          - If it’s eligible to be a master and a master goes down, an
            election will take place and a new master is elected. If
            it’s not a master you can still query it
        
          - Data is split across nodes via sharding. All nodes know how
            to split queries across nbodes and shards, knowing where
            indices live
        
          - To get a list of nodes: use a curl command to access the cat
            API:
            [<span class="underline">https://www.elastic.co/guide/en/elasticsearch/reference/2.4/cat.html</span>](https://www.google.com/url?q=https://www.elastic.co/guide/en/elasticsearch/reference/2.4/cat.html&sa=D&source=hangouts&ust=1546599148032000&usg=AFQjCNEtTecP1Pyyq2bro7qlBYs3ceVtlg)
    
      - ES – don’t use gui much, mostly use API on command line

  - Indices are broken up into shards

  - Shards are spread across nodes

  - Main logstash index is split into 300 shards

  - We have one copy of each of the shards

  - Cluster =\> indices =\> shards

  - If there is only one yellow shard, the cluster will be yellow

## Finding logs & analysing them

  - All logs are in /var/log

  - We have a slow query log on elastic search
    
      - This is how you find it on the relevant node (eg
        logdb163.ab5.acme.com) :
        **/var/log/elasticsearch1/elasticsearch\_index\_search\_slowlog.log**

  - Use a script Joe wrote to output num lines / bytes per hour in a log
    file, so you can see if you get a spike at a particular time
    
      - Here: observability-tools/log-analyse.py

  - To count lines in all slowlog files in feb, using a for loop: **for
    f in elasticsearch\_index\_search\_slowlog1.log-201902\*; do echo
    "$f: $(zcat $f | wc -l)"; done**

  - See below for what we did to compare lines from two slow-log files
    from different days

## Comparing two slow-log files

  - We extracted the top 35 queries for each Elastic-Search slow-log log
    file from 2 different days (so we could compare them and see what’s
    changed), and put them into files: We used Joe’s log-analyse.py
    script for this, I think (in observability-tools).

  - I can’t remember what the output of log-analyse.py was, but you can
    extract just the query\_string json from a slowlog file like this:
    
      - My way:
        
          - Hmm, I think Joe must have had a better way (see stuff with
            pv and walk below). Maybe use awk and substr to remove the
            first part of each line, if each line starts with the same
            num of chars before the query-string json?
        
          - Anyway I did this and it worked (but the output would be
            slightly different because in my example my originals didn’t
            contain counts for each query type):
        
          - This: **sed -i 's/ AND /\_AND\_/g' slowlog21-top.log**
        
          - This: **sed -i 's/From Load Testing
            Bot/From\_load\_testing\_bot/g' slowlog21-top.log**
        
          - This: **cat slowlog21-top.log | awk '{print $12}' | awk
            '{print substr($0, 7, length($0)-7)}'\> 21-queries.list**
    
      - **Was this Joe’s way?**
        
          - Big command with four pvs in it (see section on pv for
            explanation): **pv -cN unzip
            elasticsearch\_index\_search\_slowlog1.log-20190224.gz |
            gunzip -c - | pv -cN sed | sed 's/.\*
            source\\\[\\(.\*\\)\\\], extra\_source.\*/\\1/' | pv -cN jq
            | jq -f \~/jq-script -c | pv -cN sort | sort | uniq -c |
            sort -g | tee \~/queries-20190224.json**
            
              - Script: (see the **\~/jq-script** bit in the middle)
            
              - **\# Apply f to composite entities recursively, and to
                atoms**
            
              - **def walk(f):**
            
              - **. as $in**
            
              - **| if type == "object" then**
            
              - **reduce keys\[\] as $key**
            
              - **( {}; . + { ($key): ($in\[$key\] | walk(f)) } ) | f**
            
              - **elif type == "array" then map( walk(f) ) | f**
            
              - **else f**
            
              - **end;**
            
              - 
              - **walk(if type == "object" then del(."@timestamp",
                .date\_range, .date\_histogram) else . end)**

  - Then run this jq command on each of the resulting top-35 files, to
    remove any null entries: **jq 'if type == "object" then .. |
    .query\_string? else . end | select(type \!= "null")' -c
    21-queries.list**
    
      - Gave us two files containing more human-readable query\_string
        data, plus numbers
    
      - We then took the output of that (which had been put into 2
        files) and did this, to add “21” or “22” to each line so we knew
        which source file they came from and could merge them and
        compare them side by side:
        
          - This: **awk 'NR%2{printf "%s 22 ",$0;next;}1'
            22-queries.list \> 22-oneline.list**
        
          - This: **awk 'NR%2{printf "%s 21 ",$0;next;}1'
            21-queries.list \> 21-oneline.list**
        
          - This: **cat 21-oneline.list 22-oneline.list | sort \>
            both-oneline.txt**
        
          - We also tried this: **awk 'NR%2{printf "%s 22
            ",substr($0,1,75);next;}1' 22.list \> 22-oneline.list**
            
              - To truncate query strings into something more columnar
                (75 chars per query string) and easier to parse
            
              - But then used the untruncated version and stuck it in a
                spreadsheet, which worked much better
            
              - Used SUMIF to count duplicates: SUMIF(A2$2:A$100, D2,
                E2:E100)
            
              - ...where the query strings were in column A, then column
                D just contained the umber 1 for every entry, so we’re
                saying that in column E we will place a count of all the
                other rwos that have the same query string as the
                current row

## Shards

  - Check shard state: **curl -XGET -n
    'logs.acmecorp.com:9200/\_cat/shards?h=index,shard,prirep,state,unassigned.reason,node'
    -s | grep -v START | sort | less**
    
      - Shows you list of shards in the cluster, for each one shows you
        the index, the shard number, the state of the shard and why it’s
        in that state

## Unassigned shards

  - When shards are assigned, that means that ES knows which nodes to go
    to for both primary and replica for each shard.

  - But say for instance the nodes hosting both primary and replica go
    down, then that shard becomes unassigned.
    
      - So for instance when we saw shards getting unassigned one time,
        the error we saw was NODE\_LEFT
    
      - It was a in that case because we were losing a LOT of nodes. A
        handful of unassigned shards is less of an issue.

  - It’s also possible that an empty shard has been created but for
    whatever reason it has not been assigned to a node.

  - If a lot of shards are unassigned, that reduces the number of shards
    available to the cluster, which has an impact on the ability to
    ingest new data.

  - We can manually assign shards, which can mean that we lose the
    orphaned data on lost nodes, but it’s more important to get current
    data ingestion up and running than to be worried about trying to
    recover the lost data.

  - To sort out shards: **./assign\_shards.py --state NODE\_LEFT
    logstash-2019.02.27**
    
      - This will manually reassign shards
    
      - That assign\_shards script is in observability-tools (cloned to
        my laptop and VM):
        [<span class="underline">https://github.acmecorp.com/Observability/observability-toolbox.git</span>](https://github.etsycorp.com/Observability/observability-toolbox.git)

## Indices

  - When an index is closed, you can’t read / write and it doesn’t
    guarantee that it will keep a replica around

  - Masters don’t keep anything about it in memory

  - It’s done to optimise the cluster’s resources

  - It’s a manual process, might be done if too much memory being used

  - When you open an index, this will make the cluster health go orange
    / red in grafana (for instance in ELK investigation)
    
      - \! The cluster health graph is weird - the line at the bottom is
        the actual line of data - if it goes orange or red there will be
        a spike that goes up to the orange or red line. If you see
        straight orange or red lines this is fine.
    
      - After opening an index, you have to wait for the graphs to
        settle down before you can actually get sensible data from it
    
      - Orange means the primaries are fine but replicas are still being
        sorted out
    
      - The num shards will change while it’s still opening

  - Closing indices / opening indices / open closed index / close index:
    
      - Open index: **curl -XPOST 'localhost:9200/my\_index/\_open'**
        
          - On Thingelk: **curl
            thingelk.acmecorp.com:9200/index-name/\_open -u csudbery**
            
              - ...except that I don’t have Thingelk permissions top
                open a closed index. Instead I can use the permissions
                from the curator script on a Thingelk box.
                
                  - Like this:
                
                  - Login to a Thingelk box (eg Thingelk05.ab2.acme.com)
                
                  - Run this command: **egrep
                    'http\_auth|username=|password='
                    /usr/acme/bin/es\_index\_curation.sh**
                
                  - This will give you the creds you can use to open a
                    closed index
                
                  - Egrep is grep with regex - the above is looking for
                    anyn lines that contain **http\_auth** or
                    **username=** or **password=**
                
                  - In each case, the whole line will be returned.
        
          - On Livelk: **curl logs.acmecorp.com:9200/index-name/\_open**
    
      - Close index: **curl -XPOST 'localhost:9200/my\_index/\_close'**

## Deleting indices / yellow indices

  - We saw a lot of yellow indices in Testelk - just ended up deleting
    them.
    
      - Delete multiple indices from elastic search because there are
        several yellow indices which means replicas are not being
        created properly - we are guessing this is because of lack of
        disk space:
        
          - You have low watermark and high watermark, eg low watermark
            might be 20% and high watermark might be 10%. Low watermark
            is used to determine the definition of "full disk" for
            creating replicas (so it will fail earlier for replica
            creation) but high watermark is for index creation, so it
            won't fail so easily (due to disk space) for index creation.
        
          - This might be why the primary shards are fine but the
            replicas are not.
    
      - How old indexes over a certain age are deleted / archived:
        es\_index\_maintenance.rb and es\_index\_curation.sh - in
        /usr/acme/bin - called from cron jobs. The curation one relies
        on an archive server being available, which it isn't on testelk:
        If you look in the databag you'll see that some clusters have an
        "archive\_nodes" section - if there are archive nodes configured
        here then the archive part of the curation script will do
        something.
        
          - \! es\_index\_maintenance has now been replaced by
            es\_index\_curation\!
    
      - The maintenance script has the index name set somewhere - see
        Chef templates/default/es\_index\_maintenance.rb.erb - has
        delete\_age set in there which it gets from the role file (eg
        the role file Otherelk.json), so if it's not set in the role
        file that will fail. For instance you have to set
        index\_close\_ages in the databag, you'll also see a whoel
        section called es\_index\_maintenance in the databag. If we look
        in the elasticsearch config.json databag, in the testelk section
        look for es\_index\_maintenance.
    
      - If you run the ruby script (es\_index\_maintenance.rb) locally
        and debug you can see if it's erroring
        
          - \! es\_index\_maintenance has now been replaced by
            es\_index\_curation\!
    
      - Bulk deletion of indices
        
          - Like this: **curl -X DELETE
            'http://localhost:9200/logstash-2019.02.\*/'**
        
          - Will delete all logstash indices from Feb 2019 (because
            wildcard in "logstash-2019.02\*")
        
          - \- but be aware it can time out on a busy box and then
            nothing gets deleted, so close them first: **curl -X POST
            'localhost:9200/logstash-2019.02.\*/\_close'**
        
          - Then make a list stored in a file (pipe \_cat/indices to a
            file), so you can check the closed ones are the ones you
            intended to close (sorting will make all closed ones be at
            top of list): **curl localhost:9200/\_cat/indices | sort \>
            indices.txt**
    
      - After deleting indices, you would then expect to see messages in
        log file (var/log/elasticsearch1/testelk.log) about shifting
        shards around ("cluster.routing.allocation.decider"), and
        cluster health changing
    
      - You can also check the \_cat/indices endpoint to see which
        indices are being initalised and which are still yellow
    
      - Check teh yellow ones to see if the second-from-last column is
        growing in size for indiviaual indices (if they are yellow this
        is because the replicas are failing which often means the
        second-from-last column is not twice the last column, as it
        shuld be if replicas are ok (last col is index size,
        second-from-last is total data size)).

## Allocating Shards

  - \! Note that it is possible to have shards on disk that are not
    listed in \_cat/shards - this could be because they belong to closed
    indices. Be wary of deleting them\!

  - Normally if you relocate a shard from one node to another, it should
    delete the shard at the end of the process

  - If you want to check whether there are any problems with shards, you
    can check \_cat/indices to see whether the relevant index is green

  - See Unassigned Shards section

## Fielddata

  - More here:
    [<span class="underline">https://www.elastic.co/guide/en/elasticsearch/guide/current/\_limiting\_memory\_usage.html</span>](https://www.elastic.co/guide/en/elasticsearch/guide/current/_limiting_memory_usage.html)

  - It’s a way of doing aggregates and sorts on data

  - A query to show how much memory is being used by fielddata: **curl
    -s http://logdbmaster.acmecorp.com:9200/\_cat/fielddata/total?v
    |grep -v archive**

  - So, indexing is when you need to be able to take a value and see
    what documents it applies to, but for sorting and aggregating you
    need to be able to do the reverse - take a document and see what
    values it has - like an inverted index

  - It’s a really intense process so it builds a cache and keeps it in
    memory

  - But only does it for data that is “analyzed” strings, like full text
    strings.

  - IP address doesn’t need to be an analysed string, and in our
    template we explicitly say do not analyse this field

  - To get the memory used for each of the fielddata fields in the
    logstash index, grouped by hosts: **curl -n http://
    logs.acmecorp.com:9200/\_nodes/stats/indices/fielddata?fields=\***

  - we thought that lots of those things in fielddata shouldn't be in
    there because fielddata should only hold analyzed fields and things
    like \`logdata.ip\_addr\` shouldn't be analyzed
    
      - But we realised, it’s probably because of global ordinals. See
        section on this page:
        [<span class="underline">https://www.elastic.co/guide/en/elasticsearch/reference/2.4/fielddata.html</span>](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/fielddata.html)

## Snapshot repository

  - See **closed indices:**
    <https://docs.google.com/document/d/1eeEXpBgsuWIIt_teRYAIbYxY9Zf7sdQNC6BKlw9BPVg/edit#heading=h.gjdgxs>

## Rolling Restart

  - Needed if, for instance, there are config changes

  - There’s a ruby script in the Chef cookbook you use to interact with
    the process

  - Every time Chef runs, it checks whether there is a rolling restart
    for this cluster and whether it is this host’s turn to restart
    (restarts all the nodes on this host)

  - Also checks whether cluster is green and won’t restart unless it is

  - Troubleshooting: if things stall, is it because Chef not running on
    that machine?
