---
layout: page
location: pages/coding/infra/servers/leaf
permalink: /pages/coding/infra/servers/DNS-And-Routing
---
## Diagrams

  - See below for links to useful diagrams from Cadogan

## DNS Records

  - [www.your-domain.co.uk](http://www.your-domain.co.uk) might be a
    CNAME
    of [<span class="underline">your-domain.co.uk</span>](http://iguanas.co.uk/)
      - (See section below for explanation of CNAMEs)
      - This means that
        [www.your-domain.co.uk](http://www.your-domain.co.uk) is an
        alias for your-domain.co.uk, and is therefore equivalent
      - your-domain.co.uk is an A record rather than a CNAME
      - An A record is a DNS record that routes straight to an IP
        address
      - A CNAME is a DNS record that aliases to either another CNAME or
        an A record
      - We had to have A records for our non-www root domains, because
        they all had corresponding MX records (mail servers), and if we
        didn’t use an A record, it mucked up the mail server
      - Explanations:
          - <span class="underline">here:
            <https://serverfault.com/questions/91712/dns-using-cnames-breaks-mx-records></span>
          - …and here:
            [<span class="underline">https://support.dnsmadeeasy.com/index.php?/Knowledgebase/Article/View/14/0/why-cant-i-create-a-cname-record-for-the-root-record</span>](https://support.dnsmadeeasy.com/index.php?/Knowledgebase/Article/View/14/0/why-cant-i-create-a-cname-record-for-the-root-record)
      - A records have to map to IP addresses. You won’t have consistent
        IP addresses for your EBS instances, because the IP addresses
        change regularly.
      - We used a forwarding server to handle this.

## DNS articles:

  - DNS management and DNS Record
    types: [<span class="underline">https://pressable.com/blog/2014/12/23/dns-record-types-explained/</span>](https://pressable.com/blog/2014/12/23/dns-record-types-explained/)
  - DNS records and
    sub-domains: [<span class="underline">https://serverfault.com/questions/275982/what-type-of-dns-record-is-needed-to-make-a-subdomain</span>](https://serverfault.com/questions/275982/what-type-of-dns-record-is-needed-to-make-a-subdomain)
  - Round-robin DNS (two DNS records for one
    domain): [<span class="underline">https://en.m.wikipedia.org/wiki/Round-robin\_DNS</span>](https://en.m.wikipedia.org/wiki/Round-robin_DNS)
  - The TTL setting on DNS
    records: [<span class="underline">http://searchnetworking.techtarget.com/definition/time-to-live</span>](http://searchnetworking.techtarget.com/definition/time-to-live)

## CNAMEs

  - **CNAME** stands for Canonical Name. CNAME records can be used to
    alias one name to another.
  - For example, if you have a server where you keep all of your
    documents online, it might normally be accessed
    through docs.example.com. You may also want to access it
    through documents.example.com. One way to make this possible is to
    add a CNAME record that
    points documents.example.com to docs.example.com. When someone
    visits documents.example.com they will see the exact same content
    as docs.example.com.


## Simple DNS Diagram

- Cadogan Simple DNS Diagram (PRIVATE) `Simple DNS Diagram.jpg` [here](https://drive.google.com/drive/folders/1Jbbb7dMx1OWGrB3cWOeTcCSKlUHV4Vnj)


## Detailed DNS Diagram

- Cadogan DNS diagram - More Detail (PRIVATE): `More Detail.jpg` [here](https://drive.google.com/drive/folders/1Jbbb7dMx1OWGrB3cWOeTcCSKlUHV4Vnj)


## F5 and DNS

- More on DNS stuff under F5 load balancer: /pages/coding/infra/cloud/F5-Load-Balancer

## Node, proxies and IP addresses

- See [here](/pages/coding/webdev/js/Node-JS#node-proxies-and-ip-addresses).


### Node, proxies, hosts file etc: An explanation of how everything hung together in one example node.js deployment (at Samba)

  - Type a url into the browser
  - First step is hosts file. Hosts file is effectively your local DNS
    server – will convert url into IP address
      - This matters because otherwise samba and samba.local will go
        unrecognised
      - Also we need to make sure they both go to localhost, because the
        node proxy is listening to localhost on port 5555
      - This also matters because in Windows 10, the docker machine is
        in fact localhost, rather than a separate thing with its own IP
        address. So you don’t need separate entries in your hosts file
        for samba as well as samba.local, because in fact you will
        always be using samba.local in the browser, whether you are
        running in Visual Studio or not. This is also why in Windows 10
        you get conflicts if you have code running in both docker AND
        Visual Studio – because they are both running on localhost.
      - Hosts file is all about TCP protocol rather than http requests.
        Http headers are left intact with the original host, even though
        it is converted into an IP address for TCP purposes
  - If url is not in hosts file it moves onto next step, which is list
    of proxy exceptions
      - This is a list configured at browser level
      - But it is also configured via the NO-PROXY env var, which is
        used by Docker?
  - If url is not in proxy exceptions, it will go to Samba proxy – which
    will check external site for dodginess and will also check your AD
    permissions for what you are allowed to do.
  - Node proxy:
      - If url is in proxy exceptions, and in hosts file, and on port
        5555, and hosts file routes it to localhost, then it will hit
        the node proxy.
      - To see the code for this, see index.js (visible in VS in webapp
        under solution items)
      - The node proxy listens to localhost port 5555 and converts all
        urls to the docker url (which is the url of the docker machine
        on Windows 8), unless they have “.local” appended, in which case
        it sends them off to 127.0.0.1
      - It also checks the host in the request header, and converts this
        into business id (ie samba or healthysamba)
      - Because it is checking the original request header, it doesn’t
        matter that this host has since been converted by the hosts file
        into an IP address
      - When running nightwatch tests, you set a BUSINESS\_ID env var
        (only available to that console session?) which is then
        (somehow?) used to set the correct header for the virtual
        browser on which the tests are running.
  - To debug: Look at the console output for node proxy and also (if
    relevant) for the consoles where you did make build run for the
    docker instances.

## Reverse Proxies

- A Reverse proxy is one which proxies inbound requests, rather than outbound requests
-	A reverse proxy is closer to the server, whereas a proxy is closer to the client. They still need to intercept both the request and the response.
- We used a reverse proxy at Samba to change all incoming https requests into http requests.
  - More info [here](/pages/coding/infra/security/SSL#an-example-of-an-https-issue).
- Reverse DNS = mapping IP address to a host name instead of vice versa

## Useful DNS commands

- `ns lookup` -	Looks up a DNS entry
- Check DNS: http://Dnscheck.pingdom.com
  -	Also try whatsmydns: https://www.whatsmydns.net/
  - Or command `dig +trace @8.8.8.8 prod-dts.clarevilletest.com com` (will change to `.clarevilledigital.net`)
    -	If you remove `+trace`, you don’t get the full trace details
    -	The `@8.8.8.8` is routing the request via Google name servers – the reason for that is to make sure you are exiting the Clareville domain and avoiding any internal caches
