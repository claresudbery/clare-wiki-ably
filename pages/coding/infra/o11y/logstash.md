---
layout: page
location: pages/coding/infra/o11y/leaf
permalink: /pages/coding/infra/o11y/Logstash
---
## Misc

  - To see how logstash works:
    
      - This: **sudo** **less /etc/logstash/logstash.conf**
        
          - You’ll see three stanzas :
        
          - input :
            
              - listeners
                
                  - They won’t necessarily be called “listener” - they
                    might just have a comment above that talks about
                    listening. For instance filebeat listeners may
                    actually be prefixed called /output**beats**
            
              - NB this is passive listening\!
                
                  - Logstash is a pipeline, just flowing data straight
                    through to ES
                
                  - a listener section represents something that we are
                    listening for (not something listening to us), but
                    this is not an action - we are passive listeners
                
                  - We are sitting and waiting for someone to knock on
                    the door and tell us stuff
            
              - It basically just means we have an open port which
                something else (eg filebeat) is sending data to
            
              - Like an API endpoint
            
              - Logstash is stateless - nothing is stored
        
          - filter :
        
          - output :
            
              - Logstash is a pipeline, just flowing data straight
                through to ES
            
              - Outputs are posting lines to ES
            
              - ES doesn’t know we are here, we are just effectively
                curling ES’s endpoints to send data to whichever index
    
      - To see ports and listeners: **sudo netstat -pultn**
        
          - Lists all the ports and listeners, as configured in the
            input section of logstash.conf (see above)
        
          - Then you can grab one of the pids (eg 26291) and run this:
            **ps aux | grep 26291**
            
              - Will show you all running processes plus users
    
      - Logstash rules:
        
          - This is called grokking - the business of translating
            unstructured data into structured message lines.
        
          - Logstash recipe in Chef repo
        
          - Templating code generates the logstash rule files
        
          - You will then see them on a logstash instance here: **ls
            /etc/logstash/conf.d**
        
          - Some people send structured logs, ie json - which makes the
            rules a lot simpler to code
