---
layout: page
location: pages/coding/infra/security/leaf
permalink: /pages/coding/infra/security/SSL
---
## SSL Certificates

  - See also “Handling HTTPS requests and SSL certificates” on the Nginx
    page in this wiki.
  - SSL certificates are needed for HTTPS
      - The idea is that if a request comes into your server as https,
        then the requester will not get the requested page unless your
        server has a valid SSL certificate
      - The requester’s browser will check the certificate of the target
        server and check that it is valid
      - SSL certificates can expire
      - Once the browser has verified the SSL certificate, all
        communication between browser and server will be encrypted
      - More info here:
        [<span class="underline">https://www.digicert.com/ssl.htm</span>](https://www.digicert.com/ssl.htm)
      - Also here: What is an SSL certificate (also public/private
        keys):
        [<span class="underline">https://www.globalsign.com/en/ssl-information-center/what-is-an-ssl-certificate/</span>](https://www.globalsign.com/en/ssl-information-center/what-is-an-ssl-certificate/)
      - Stuff about SSL and TLS - written by
        Raimund: [<span class="underline">https://dinosaurdeveloper.blogspot.co.uk/2017/03/ssltls-for-dummies-including-myself.html</span>](https://dinosaurdeveloper.blogspot.co.uk/2017/03/ssltls-for-dummies-including-myself.html)
  - You might need SSL certificates in your load balancer:
      - EBS load balancer, if you redirect from a forwarding server
          - NB: I originally thought that we needed it here in order to
            set up encrypted communication, but actually that wouldn’t
            be necessary if we were only proxying into here, because the
            encryption would be taken care of at the source of the
            proxying.
          - So, certificates were not needed at EBS until we changed the
            static nginx config (later replaced by a forwarding server)
            to do redirecting instead of proxying.
  - Summary: The change/update of  Ssl certificate has to be done by
    uploading the certificate file:
      - This should be done 2-3 days before the certificate expires.
      - SSL certificates first have to be acquired from certificate
        provider – this will involve at least one actual file (possibly
        two? One for the certificate and one for the encryption key?)
          - From here
            ([<span class="underline">https://docs.aws.amazon.com/acm/latest/userguide/import-reimport.html</span>](https://docs.aws.amazon.com/acm/latest/userguide/import-reimport.html)),
            it looks like we will need **Certificate
            body** and **Certificate private key.** 
      - “Certificate Manager” service of AWS. Click on “Re Import
        certificate” and import the new certificate corresponding to
        “wildcard.caferouge.com” entry.
          - You can do this in advance of the certificate expiry.
          - First you will need details of the new certificate from your
            provider. You need to know **Certificate
            body** and **Certificate private key**
              - More here:
                [<span class="underline">https://docs.aws.amazon.com/acm/latest/userguide/import-reimport.html</span>](https://docs.aws.amazon.com/acm/latest/userguide/import-reimport.html)
          - The certificate is then imported by the load balancer (this
            is a once-only thing, does not need checking every time). To
            see these settings:
          - Select an environment in EBS
          - Select Configuration on the left
          - Load Balancing: click the cog, then check SSL certificate ID

## An example of an https issue

- At Samba,	iShare (just the maps part?) was hosted on an http url, not https
  -	iShare was owned by a third party
-	It would have been possible to change it to https, but that would affect other clients
-	So instead, we used a reverse proxy to change all incoming https requests into http requests
  -	A Reverse proxy is one which proxies inbound requests, rather than outbound requests
	- A reverse proxy is closer to the server, whereas a proxy is closer to the client. They still need to intercept both the request and the response.
-	There were some pieces of javascript which came from iShare which we hosted on our pages
  -	These contained links going back into iShare 
  -	These links were also http, not https
  -	This means that we got errors about mixed content
