---
layout: page
location: pages/coding/infra/o11y/leaf
permalink: /pages/coding/infra/o11y/Other-Observability-Tools
---
## Kafster, burrow, Clarebot, honeycomb

  - See
    <https://docs.google.com/document/d/1ydXrsZX_g9uyvgMoZUovT0G8L5OcrXxRQDSWzw3ULDo/edit>

## Log sampling

  - I *think* this is when there are so many logs being generated that
    it is impractial to store / analyse all of them. So instead, just a
    random proportion are analysed
    
      - Like this (random sampling):
        [<span class="underline">https://www.rsyslog.com/doc/v8-stable/tutorials/random\_sampling.html</span>](https://www.rsyslog.com/doc/v8-stable/tutorials/random_sampling.html)
    
      - Like this (hash-based sampling):
        [<span class="underline">https://www.rsyslog.com/doc/v8-stable/tutorials/hash\_sampling.html</span>](https://www.rsyslog.com/doc/v8-stable/tutorials/hash_sampling.html)

## Kafka

  - Message queue / bus
  - Pub-sub model  
  - Various data sources publish to it, consumers reading that data
  - [This doc](https://docs.google.com/document/d/1BKEKz1indvtF2TSAGN88nHbEtKtvbehYwaqhWxseVV0/edit) (private to Clare) documents how Kafka was part of the logging solution at Eritrea.

## FileBeat / Lumberjack

  - Run on the hosts

  - Reading log files from disk, then passes data to logstash or kafka

  - Original software mostly writing their logs to disk

  - Config:
    
      - If you want to see which log files are getting their data
        written to an ELK cluster and where it’s being sent, check the
        filebeat config (in /etc/filebeat.d) or lumberjack config (eg
        /etc/lumberjack.conf) on the host
    
    <!-- end list -->
    
      - You can then for instance search for “thingelk” to find entries
        with dest:”thingelk” and see which log files are being sent to
        thingelk
    
      - Or just generally scroll down to see the “files” section, where
        each element has
        
          - Fields - how the data will be constructed in the
            destination?,
        
          - Paths - which log files are being sent
        
          - Dest - where data will end up

## Logrotate

  - logrotate used for Linux utilities, Java stuff like ES uses log4j

  - Config for httpd on thingelk hosts lives in
    /etc/logrotate\_httpd.conf

  - In config
    
      - if it says daily at the top, the number lower down refers to
        that (so it might be 4 days, not 4 weeks)
    
      - delaycompress - create a daily log which contains logs from
        previous 24 hours, but then wait another 24 hours before
        compressing
    
      - The values at the top are the defaults, then they are overridden
        for individual file types
    
      - So for instance it might say **rotate 4** at the top, then
        **rotate 3** in the type you care about
        
          - This is a bit unusual though - often the global / default
            stuff is in a separate file.

## StatsD

See
<https://docs.google.com/document/d/1ydXrsZX_g9uyvgMoZUovT0G8L5OcrXxRQDSWzw3ULDo/edit>

## Prometheus

  - More info here:
    <https://docs.google.com/document/d/1ydXrsZX_g9uyvgMoZUovT0G8L5OcrXxRQDSWzw3ULDo/edit>

  - Iike Graphite, Contains a time series data store

  - Julius Volz – original author

  - A pull model – actively scrapes data to store it

  - As well as providing a data store, also has an alert monitor

  - Can be queried to investigate the data

  - Prometheus can contain more info than Graphite
    
      - You can add arbitrary labels, but limited by cardinality of the
        values in the labels
    
      - More flexible, nor hierarchical, easier to slice things

  - Sliding window ephemeral store
