---
layout: page
location: pages/coding/infra/o11y/leaf
permalink: /pages/coding/infra/o11y/Graphite-and-Grafana
---
## Graphite

  - See Eritrea:
    <https://docs.google.com/document/d/1ydXrsZX_g9uyvgMoZUovT0G8L5OcrXxRQDSWzw3ULDo/edit>

## Grafana 

### Data Sources

  - To see the data source used for a graph:
    
      - Click on the graph title
    
      - Click Edit
    
      - On the Metrics tab you’ll see data source at the top
    
      - For “default” data source see below

  - To see the config for all the data sources:
    
      - Login to grafana - use the “Sign in” button bottom left - you
        won’t be logged in by default - use LDAP (acmecorp.com in
        Dashlane)
    
      - Once you’re logged in, the configuration cog appears on the
        left. Select data sources - you can see all the data sources
        configured

  - Disabling data sources:
    
      - Follow instructions above for seeing config
    
      - You can’t actually disable them, just change the url on a data
        source to one that doesn’t exist

  - “default” data source
    
      - Is the graphiterenderers
    
      - ...which is all the data on graphite.acmecorp.com served through
        a standalone web rendering layer that is backed by memcached
        with a ttl of 1m
        
          - (graphite.acmecorp.com goes to graphite01.ab2.acme.com,
            graphite02.ab2.acme.com)
    
      - we put it up to deal with dashboards performance
    
      - but we suspect it may not be necessary anymore

### Creating a new graph

  - Select the window icon top left, select new dashboard on the right

  - Click on the title of the new graph and select Edit

  - Select a data source

  - Next to Series, click select metric

  - Now you’ll get a series of nested things you can select, eg data
    source of Ganglia and then
    ny\*|rrds|Logstash|logstash\*|disk\_free|sum
    
      - As yu select each thing, another “select metric” thing appears
        to the right
