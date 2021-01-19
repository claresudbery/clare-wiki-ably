---
layout: page
location: pages/coding/infra/servers/leaf
permalink: /pages/coding/infra/servers/DNS-And-Routing
---
## Diagrams

  - See elsewhere in this doc for useful diagrams from Cadogan

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

- Cadogan Simple DNS Diagram (PRIVATE) `Simple DNS Diagram.jpg` here: https://drive.google.com/drive/folders/1Jbbb7dMx1OWGrB3cWOeTcCSKlUHV4Vnj


## Detailed DNS Diagram

- Cadogan DNS diagram - More Detail (PRIVATE): `More Detail.jpg` here: https://drive.google.com/drive/folders/1Jbbb7dMx1OWGrB3cWOeTcCSKlUHV4Vnj


## F5 and DNS

- More on DNS stuff under F5 load balancer: /pages/coding/infra/cloud/F5-Load-Balancer

## Node, proxies and IP addresses

- See [here](/pages/coding/webdev/js/Node-JS#node-proxies-and-ip-addresses).
