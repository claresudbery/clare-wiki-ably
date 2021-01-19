---
layout: page
location: pages/coding/infra/o11y/leaf
permalink: /pages/coding/infra/o11y/Kibana
---
## User guide

  - \! Date/Times are displayed in Kibana in UTC
    
      - Headline dates in Nagios alerts are not in UTC, but if you drill
        down into the alert you’ll see a UTC date/time
        
          - 
  - On-prem Livelk:
    [<span class="underline">https://logs.acmecorp.com</span>](https://logs.acmecorp.com)
    
      - This query gets you all documents with a field called type that
        has a value of logstash\_server\_log:
        **type:logstash\_server\_log**
    
      - You are only entering the fields you want to search on, not the
        index
        
          - The index is selected on the left
        
          - defaults to \[logstash-\]YYYY.MM.DD, which means it will
            search all logstash indices that match that \[attern - to
            get the last two days use the time period top right
        
          - You can select a different index - use the dropdown top left
        
          - This is actually going to search everything on the selected
            index
    
      - Default search term is wildcard (\*) which will return all data
        on the selected index (or range of indices)
    
      - You can change what data is shown in your results -
        
          - the default is two columns, one for timestamp and one for
            message
        
          - to change this, on the left click Add for different fields
        
          - By default as soon as you add a new column, you lose the
            “message” column - but you can add it back in again in the
            same way on the left
        
          - You can get the same effect by expanding a result and
            clicking the little grid next to the field
    
      - You can filter for particular values
        
          - Note that with a starting point of
            **type:logstash\_server\_log,** you are already filtering
            for values of type = logstash\_server\_log
        
          - For instance if you ran the **type:logstash\_server\_log**
            query, but then wanted to only see documents with
            beat.hostname = logstash24.ab5.acme.com, you can expand an
            individual result that has that value, and click the little
            plus sign in a magnifying glass
        
          - If you want to filter for a value not currently visible to
            you, you can do the same but then click the resulting green
            losenge (top left), and edit the value
    
      - You can just select documents which have a particular data
        field.
        
          - This query will return all documents which have a
            kafka\_consumer\_group field:
            **\_exists\_:kafka.consumer\_group**
    
      - You can change the time range of your results - click on the
        time value top right
        
          - \!Watch out\! If, for instance, you go from last 15 minutes
            to last hour, the x axis will change from “@timestamp per 30
            seconds” to “@timestamp per minute” which means your bars
            will go twice as high up he y axis and it will look like you
            have twice as much data\!
        
          - > For custom ranges, click Relative over on the left
    
      - Viewing / tweaking full queries:
        
          - The url allows you to see what your current full query is
    
      - For aggregations (for instance, for all
        type:logstash\_server\_log results, tell me how many of each are
        from each host - see thingelk below for an example of an
        aggregation):
        
          - To start a new aggregation after you already have an
            existing one:
            
              - 
          - For a simple aggregation
            
              - Click Visualisation at the top of the screen
            
              - Select “From a new search”
            
              - Select a visualisation type - the obvious one being
                Vertical bar chart (at the bottom)
            
              - Select your index pattern (eg
                **\[logstash-\]YYYY.MM.DD**) - this is just the set of
                indices that contain the data you’re looking for.
            
              - Select what type of aggregation you want in the Y-Axis
                section - the most common being count, because it allows
                you to graph the *number* of things that fulfil your
                criteria
                
                  - Count will be selected by default anyway - you only
                    see it if you expand the Y-Axis section
                
                  - Other options are things like Average, Sum, Min or
                    Max
            
              - Select X-Axis
                
                  - This will give you a separate bar along the x-axis
                    for each group of results
                
                  - Alternatively, select Split Bars and this will give
                    you bars that are split into sections, one section
                    for each group of results
            
              - Select Aggregation: Terms
            
              - Select field: beat.hostname (no need for scrolling, just
                type quickly and press Enter even if you don’t see the
                thing you just typed in)
            
              - The default Order By of metric:count is normally the one
                you want
            
              - \!\! Watch out: The default Size is 5 - what this
                actually means is that you’ll only the 5 most frequent
                results. If you want more than that, increase this
                number. \!\!
            
              - Type your query in the main entry field at the top
                (contains \* by default) - eg **type:mobile\_info\_log**
            
              - Click the green play button (top left)
            
              - Remember you won’t see a time axis because there is no
                time dimension after you have aggregated
                
                  - But you can add a time dimension by changing the
                    aggregation type from Terms to Date histogram or
                    Date Range and then adjusting the Interval - and it
                    will group results by time range (eg a separate
                    group of results for every minute).
                
                  - I think if you want time you can also start again
                    with an Area Chart and have two dimensions - one for
                    hostname and one for timestamp (not sure how though
                    - I did achieve this but then forgot how\!)
            
              - If you want to group by 2 things:
                
                  - Eg if you want to group results by gcp\_node = true
                    and gcp\_node = false, then for each of those
                    groups, break them down by hostname - so that you
                    can see which are the top hosts for both gcp\_node =
                    true and gcp\_node = false.
                
                  - Do the same as above, but instead of selecting
                    field: beat.hostname, select field:gcp\_node - and
                    instead of selecting X-Axis, select Split Bars
                
                  - This should give you a giant block which looks like
                    it’s all made of gcp\_node = true, but if you look
                    carefully you’ll see a thin strip representing
                    gcp\_node=true.
                
                  - Now you can click add sub-bucket and give the
                    following info:
                    
                      - Select X-Axis
                    
                      - Sub Aggregation: Terms
                    
                      - Field: beat.hostname
                    
                      - You’ll now see two sets of bars: one for
                        gcp+node = true, and one for gcp\_node=false.
                        Each bar will represent a hostname.
                    
                      - Note that because each host only deals with logs
                        that are either gcp\_node=true or
                        gcp\_node=false, you don’t see any split bars.
                        But if you had hosts that dealt with both
                        boolean values, you would see split bars
                        
                          - (one way of seeing this in practice is to
                            use field:beat.hostname for your first
                            bucket and field:kafa.topic for your
                            sub-bucket - it also helps in this case to
                            increase the overall time period for the
                            query (top right))
        
          - For a two-dimensional aggregation,
            
              - For visualisation type click Area Chart
            
              - This example will work: for search source, click “from a
                new search” with index pattern
                **\[logstash-\]YYYY.MM.DD**
            
              - Bucket type X-Axis, Aggregation = Date Histogram
            
              - Add sub-bucket: Split Area, Aggregation = Terms
            
              - Field = kafka.consumer\_group
                
                  - Warning\! You have to type super fast\!\!
    
      - Extra ways of building queries:
        
          - We used **logstash\_router:logstash\*ab5\*** in Kibana to
            find stuff coming from AB5
        
          - We used **NOT from\_kafka:true** in Kibana to rule out stuff
            that was coming from kafka
    
      - Using AND in Kibana queries:
        
          - AND needs to be in caps
        
          - You need brackets around the whole thing if it has an AND in
            it

  - Thingelk
    
      - This query gets you all documents with a field called type that
        has a value of check\_auditd: **type:check\_auditd**
    
      - This query gets you the same as above, but this time we are
        aggregating across the host field, which means that we will get
        one result for each unique host, with a count:
        **type:check\_auditd | agg:terms field:host**
        
          - (Scroll down past the empty graph to see results)
        
          - So, for instance, if there were 12 results to the original
            query, with 6 for each of two hosts, we’ll just get two
            results - one for each host - with a count of 6 for each
        
          - In this case, the graph will be empty
            
              - This is because the graph is always showing you events
                over time, and now that we’ve aggregated over hosts we
                no longer have a time element available
    
      - You can filter results by time and individual field values, and
        change what data is displayed in your results in a very similar
        way to livelk (see above)

## Jmxtrans is a translator

  - ...between kafka and graphite

  - Kafka has its own internal mettrics which go via JVM in a
    standridesed JVM eay

  - JMXTRans taps into that Kafka data and converts it into a format
    that Graphte can understand, then Grafana reads from Graphite

  - So when you click on title in Grafana

  - You then click on Metrics and see a list of things, they add up to
    the Graphite path

  - If you see $environment that tells you there is a variable - then
    ify ou look top left you’ll see a dropdown with different values for
    that variable (eg acme-logging-prod)

## Use json to access Kibana API

  - Instead of using the Kibana UI, you can query the Kibana API
    directly

  - POST to logs.acmecorp.com:9200/logstash-YYYY.MM.DD (you’ll have to
    fill in the day)
    
      - So for instance if you want to download the data that’s being
        returned for a particular Kibana search
    
      - say your search is **Payments\_EPMandate AND "would have"**
    
      - Post this json (untested):
        
          - {  
             "query": {  
               "filtered": {  
                 "query": {  
                   "query\_string": {  
                     "analyze\_wildcard": true,  
                     "query": "Payments\_EPMandate AND \\"would
            have\\""  
                   }  
                 }  
             }  
            }
        
          - 
      - You could also download the results of a visualisation (in the
        UI) as a csv
