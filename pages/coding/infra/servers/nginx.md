---
layout: page
location: pages/coding/infra/servers/leaf
permalink: /pages/coding/infra/servers/Nginx
---
  - Creating an nginx web server in K8s:
    [<span class="underline">https://canviz.com/hands-on-creating-a-simple-web-server-in-kubernetes/</span>](https://canviz.com/hands-on-creating-a-simple-web-server-in-kubernetes/)
## Nginx config

  - Note that these notes were written in 2018 and are about one
    specific nginx config that I worked with – [visible here (Clare
    only)](https://github.com/claresudbery/Cadogan/tree/master/prerender/scripts)
  - If you want to view the nginx config currently deployed to live:
      - Ssh into Ip address of live frontend EC2 instance,
      - Use this command: **cat /etc/nginx/sites-available/default**
          - (NB: **default** is the name of the file, not the name of a
            folder)
  - The magic part:
      - Location @prerender
      - Checks for search engine agents
      - \_escaped\_fragment is Google
      - if ($http\_user\_agent \~ “Prerender”)
          - \~ means = (it’s actually doing pattern matching, so it’s
            more sophisticated than straightforward = , and in fact \~
            is case-insensitive, whereas = is not)
          - this would happen when prerender is running
      - it goes to cloudfront to fetch the content, loads the
        javascript, runs the javascript to create static html, then
        returns
      - the line which starts “rewrite .\*” is actually appending that
        bit to the prerender IP address
          - this is nginx’s own proprietary syntax / language
              - it’s not javascript\!
              - It might be based on C++?
          - nginx.org/en/docs is a good place for documentation
          - or just google
  - First line of this config file (/etc/nginx/conf.d/production.conf)
    is where file is placed on server
      - To find nginx config from prerender code base in EC2 instance:
          - ssh into instance
          - Go here: **cd /etc/nginx/conf.d/**
          - Then this: **cat production.conf**
  - Config automatically loaded as part of nginx deployment
  - We also have http =\> https config here too
      - Call goes to load balancer then converted to EC2 instance
      - Can‘t execute https at that point, so https forwarding has to
        happen at a later point
      - This is normal when using nginx in this way – ie hosting our own
        nginx
      - Traffic not coming direct to EC2, it’s coming via load balancer,
        hence the need for this

## Overview of the example I worked with

  - These notes were originally written 2018
  - See diagrams in this doc
  - The config for the prerender I had sight of is visible [here (Clare
    only)](https://github.com/claresudbery/Cadogan/tree/master/prerender/scripts)
      - In Scripts folder
      - This contains nginx config
      - \! Although this was prerender code base, this was actually also
        the nginx config, ie this is the first thing that a request hits
        to ultimately decide whether to execute prerender or redirect to
        cloudFront
  - It had two jobs:
      - 1\. Convert HTTP into HTTPS (see below)
      - 2\. Use the prerender utility to render HTML for search engines
        (instead of returning javascript) (see below)
  - Middleware
      - Intercepts the call from the user’s browser
      - If it’s from search engine, calls prerender. Otherwise calls
        CloudFront to serve full index.html with js scripts, which will
        automatically be loaded by browser
  - User hits one of the frontend EC2 instances, this takes them to our
    Nginx which in turn sends them to either prerender or CloudFront
  - Some nginx links:
      - [<span class="underline">http://linuxplayer.org/2013/06/nginx-try-files-on-multiple-named-location-or-server</span>](http://linuxplayer.org/2013/06/nginx-try-files-on-multiple-named-location-or-server)
      - [<span class="underline">http://nginx.org/en/docs/http/ngx\_http\_core\_module.html\#location</span>](http://nginx.org/en/docs/http/ngx_http_core_module.html#location)
      - [<span class="underline">http://nginx.org/en/docs/beginners\_guide.html</span>](http://nginx.org/en/docs/beginners_guide.html)
      - [<span class="underline">http://nginx.org/en/docs/http/ngx\_http\_core\_module.html\#try\_files</span>](http://nginx.org/en/docs/http/ngx_http_core_module.html#try_files)

## Troubleshooting with Nginx commands on live running server

  - You can SSH into one of the frontend EC2 instances and run nginx
    commands:
      - An issue was seen with nginx on 24/12/17, which was fixed this
        way:
      - “Nginx was running but its process was not responding. We could
        tell this because when we ran **sudo service nginx status** on
        the command line, we got “Active: failed”
      - Because of this, '**sudo service nginx restart | stop**'
        commands were not working.
      - To fix this, we had to kill the Nginx process and then start
        Nginx using '**sudo service nginx start**' command.”
  - Failed forwarding:
      - Looking through the logs on the web servers: On one occasion,
        the forwarding service of NGINX on a single server failed,
        whereby it was unable to connect to the Amazon Elastic Beanstalk
        web instance. Rebooting this server restarted the service, which
        then brought the website back online.

## Handling HTTPS requests and SSL certificates

  - See also SSL Certificates section in the AWS notes
  - SSL certificates are handled differently here. Three steps are
    required:
      - 1\. Load an SSL certificate into EBS (see instructions in the
        AWS doc for the AWS Certificate Manager)
      - 2\. Change the listener setting on the load balancer so that
        everything (HTTP and HTTPS) is routed from ports 443 and 80
        through to port 80
      - 3\. In the nginx, we listen on port 80 and change all HTTP
        requests into HTTPS
          - This is something to do with how EBS works. Explanation /
            details
            here: [<span class="underline">https://codyparker.com/force-entire-site-ssl-nginx-behind-aws-load-balancer/</span>](https://codyparker.com/force-entire-site-ssl-nginx-behind-aws-load-balancer/)
          - \!\! When he shows a screenshot in the link above, it is of
            an AWS Load Balancer. To see this view, go to the EC2
            dashboard and then scroll down to Load Balancers on the left
            hand side
              - \!\! Matching up load balancers with EC2 instances is
                non-trivial\!
              - For each load balancer, if you select it and go to the
                Instances tab, you can check whether it’s the load
                balancer you want
          - (basically you set up the listeners on the load balancer to
            configure both port 80 and 443 to send traffic to each
            instance through port 80)
## Nginx config

  - Note that these notes were written in 2018 and are about one
    specific nginx config that I worked with – [visible here (Clare
    only)](https://github.com/claresudbery/Cadogan/tree/master/prerender/scripts)
  - If you want to view the nginx config currently deployed to live:
      - Ssh into Ip address of live frontend EC2 instance,
      - Use this command: **cat /etc/nginx/sites-available/default**
          - (NB: **default** is the name of the file, not the name of a
            folder)
  - The magic part:
      - Location @prerender
      - Checks for search engine agents
      - \_escaped\_fragment is Google
      - if ($http\_user\_agent \~ “Prerender”)
          - \~ means = (it’s actually doing pattern matching, so it’s
            more sophisticated than straightforward = , and in fact \~
            is case-insensitive, whereas = is not)
          - this would happen when prerender is running
      - it goes to cloudfront to fetch the content, loads the
        javascript, runs the javascript to create static html, then
        returns
      - the line which starts “rewrite .\*” is actually appending that
        bit to the prerender IP address
          - this is nginx’s own proprietary syntax / language
              - it’s not javascript\!
              - It might be based on C++?
          - nginx.org/en/docs is a good place for documentation
          - or just google
  - First line of this config file (/etc/nginx/conf.d/production.conf)
    is where file is placed on server
      - To find nginx config from prerender code base in EC2 instance:
          - ssh into instance
          - Go here: **cd /etc/nginx/conf.d/**
          - Then this: **cat production.conf**
  - Config automatically loaded as part of nginx deployment
  - We also have http =\> https config here too
      - Call goes to load balancer then converted to EC2 instance
      - Can‘t execute https at that point, so https forwarding has to
        happen at a later point
      - This is normal when using nginx in this way – ie hosting our own
        nginx
      - Traffic not coming direct to EC2, it’s coming via load balancer,
        hence the need for this

## Overview of the example I worked with

  - These notes were originally written 2018
  - See diagrams in this doc
  - The config for the prerender I had sight of is visible [here (Clare
    only)](https://github.com/claresudbery/Cadogan/tree/master/prerender/scripts)
      - In Scripts folder
      - This contains nginx config
      - \! Although this was prerender code base, this was actually also
        the nginx config, ie this is the first thing that a request hits
        to ultimately decide whether to execute prerender or redirect to
        cloudFront
  - It had two jobs:
      - 1\. Convert HTTP into HTTPS (see below)
      - 2\. Use the prerender utility to render HTML for search engines
        (instead of returning javascript) (see below)
  - Middleware
      - Intercepts the call from the user’s browser
      - If it’s from search engine, calls prerender. Otherwise calls
        CloudFront to serve full index.html with js scripts, which will
        automatically be loaded by browser
  - User hits one of the frontend EC2 instances, this takes them to our
    Nginx which in turn sends them to either prerender or CloudFront
  - Some nginx links:
      - [<span class="underline">http://linuxplayer.org/2013/06/nginx-try-files-on-multiple-named-location-or-server</span>](http://linuxplayer.org/2013/06/nginx-try-files-on-multiple-named-location-or-server)
      - [<span class="underline">http://nginx.org/en/docs/http/ngx\_http\_core\_module.html\#location</span>](http://nginx.org/en/docs/http/ngx_http_core_module.html#location)
      - [<span class="underline">http://nginx.org/en/docs/beginners\_guide.html</span>](http://nginx.org/en/docs/beginners_guide.html)
      - [<span class="underline">http://nginx.org/en/docs/http/ngx\_http\_core\_module.html\#try\_files</span>](http://nginx.org/en/docs/http/ngx_http_core_module.html#try_files)

## Troubleshooting with Nginx commands on live running server

  - You can SSH into one of the frontend EC2 instances and run nginx
    commands:
      - An issue was seen with nginx on 24/12/17, which was fixed this
        way:
      - “Nginx was running but its process was not responding. We could
        tell this because when we ran **sudo service nginx status** on
        the command line, we got “Active: failed”
      - Because of this, '**sudo service nginx restart | stop**'
        commands were not working.
      - To fix this, we had to kill the Nginx process and then start
        Nginx using '**sudo service nginx start**' command.”
  - Failed forwarding:
      - Looking through the logs on the web servers: On one occasion,
        the forwarding service of NGINX on a single server failed,
        whereby it was unable to connect to the Amazon Elastic Beanstalk
        web instance. Rebooting this server restarted the service, which
        then brought the website back online.

## Handling HTTPS requests and SSL certificates

  - See also SSL Certificates section in the AWS notes
  - SSL certificates are handled differently here. Three steps are
    required:
      - 1\. Load an SSL certificate into EBS (see instructions in the
        AWS doc for the AWS Certificate Manager)
      - 2\. Change the listener setting on the load balancer so that
        everything (HTTP and HTTPS) is routed from ports 443 and 80
        through to port 80
      - 3\. In the nginx, we listen on port 80 and change all HTTP
        requests into HTTPS
          - This is something to do with how EBS works. Explanation /
            details
            here: [<span class="underline">https://codyparker.com/force-entire-site-ssl-nginx-behind-aws-load-balancer/</span>](https://codyparker.com/force-entire-site-ssl-nginx-behind-aws-load-balancer/)
          - \!\! When he shows a screenshot in the link above, it is of
            an AWS Load Balancer. To see this view, go to the EC2
            dashboard and then scroll down to Load Balancers on the left
            hand side
              - \!\! Matching up load balancers with EC2 instances is
                non-trivial\!
              - For each load balancer, if you select it and go to the
                Instances tab, you can check whether it’s the load
                balancer you want
          - (basically you set up the listeners on the load balancer to
            configure both port 80 and 443 to send traffic to each
            instance through port 80)


## Detailed Nginx Diagram

- Cadogan Nginx Diagram (PRIVATE): `Nginx Diagram.JPG` here: https://drive.google.com/drive/folders/1Jbbb7dMx1OWGrB3cWOeTcCSKlUHV4Vnj


## Simpler Nginx Diagram

- Cadogan Nginx Diagram (simpler) (PRIVATE): `Nginx Diagram simpler.jpg` here: https://drive.google.com/drive/folders/1Jbbb7dMx1OWGrB3cWOeTcCSKlUHV4Vnj
