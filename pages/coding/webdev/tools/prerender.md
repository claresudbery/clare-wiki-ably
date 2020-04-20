---
layout: page
location: pages/coding/webdev/tools/leaf
permalink: /pages/coding/webdev/tools/PreRender
---
## Historic Notes

  - These notes were originally written 2018

## Prerender Intro

  - There might be some useful sample code at [Cadogan
    (PRIVATE)](https://github.com/claresudbery/Cadogan), in the infra
    sub-folder.
  - Useful links:
      - 
      - [<span class="underline">https://github.com/prerender/prerender</span>](https://github.com/prerender/prerender)
      - [<span class="underline">https://nginx.org/en/docs/</span>](https://nginx.org/en/docs/)
      - [<span class="underline">https://prerender.io/</span>](https://prerender.io/)
  - Used
    for search engines
      - Normally index.html starts with js script
      - But search engines don’t execute the javascript – they get
        index.html, don’t execute the js, so effectively they get
        nothing, and nothing is indexed
  - You can use a free tool –
    [<span class="underline">https://prerender.io</span>](https://prerender.io)
      - They have two types of solution
          - Their cloud system – you have to pay for this
          - Or they provide their open source code, which you can build
            and deploy on your own system for free
  - It’s a nodejs app
  - On the server running prerender:
      - Localhost:4000/\[url\]
      - The original url gets passed onto the end of this new url
      - Will load the nodejs javascript, execute it, build the static
        html and return it
  - To test: **curl –A “twitterbot1” <https://your-url>**
      - Then you can see whether you just get index.html content or full
        static html
      - If you do this: **curl –A “twitterbot” your-url.co.uk**
      - If you do this: **curl –A “mozilla” your-url.co.uk**
      - This shows you the difference that prerender gives you – in the
        first instance you get static html, but in the second instance
        you only get index.html

## Prerender and Nginx

  - You can run prerender from within an nginx config
  - In every nginx config, you will see sections marked “server”
      - These are where nginx defines how that server will behave
      - It will start by defining a port it is listening on
      - It will then declare a server name, which is basically the
        domain name
      - …so, anything configured here is the behaviour that happens for
        all requests to that domain name on that port
  - Each server can have several locations
      - These are basically routes
      - **location /** is the default route
          - This is where rewrites might happen
              - These would be redirects
              - So, if the requested route ends with anything specified
                in a rewrite statement, the route will be rewritten as
                specified
          - The final statement in our nginx config is **try\_files $uri
            @prerender**
          - This means, see if you can retrieve files using the current
            url (which may have been rewritten to specify a particular
            file?)
          - If you are unsuccessful, reroute to the location called
            @prerender
      - **Location @prerender** is a named location which has been
        called prerender
          - It is referred to at the end of the default location
          - In here, we examine request headers to see if a request has
            come from a search engine
              - Some are named – “twitterbot” etc
              - But some search engines are identified simply because
                the args contain "\_escaped\_fragment\_"
          - We also check to see whether we are already prerendering
              - This would happen because prerender comes back in as a
                separate request while we render the HTML
          - If we decide it’s a search engine, we set a $prerender flag
            to 1 (= true)
              - Now we can redirect the request to CloudFront, but
                rather than hitting it directly, we proxy through to our
                running prerender instance, which is on localhost
              - …and the request to CloudFront goes through from there
              - Prerender then takes the result from CloudFront, renders
                it and returns it to the search engine as pure HTML
          - If it’s not a search engine, we just proxy straight through
            to CloudFront
          - It’s important that we are proxying rather than redirecting,
            because it means we don’t need to have SSL certificates set
            up in CloudFront.
          - We proxy to cloudfront using http: At the bottom of
            the nginx config for each brand, it has lines like this:
              - if ($prerender = 0) {  
                proxy\_pass
                [<span class="underline">http://d334mr322pfvcg.cloudfront.net</span>](http://d334mr322pfvcg.cloudfront.net/);  
                }
              - Note that it is using HTTP here, instead of HTTPS: “It's
                just the internal communication and not public facing,
                so not a security risk.”
