---
layout: page
location: pages/coding/webdev/tools/leaf
permalink: /pages/coding/webdev/tools/Firefox
---
## Seeing loaded js

  - Firebug: Net tab

## Firefox Proxy Settings

  - If you see this error: “Firefox can't establish a connection to the
    server”
  - In Firefox, go Settings | Options | Advanced | Network
  - Click the Settings button in the “Connection” section
  - Select the Manual proxy configuration radio button
  - Set the http proxy and port:
      - Search for Network Proxy Settings in Windows
      - Under Manual Proxy Setup, you will see an IP address and port
        number – these are the ones you want
  - Under “No proxy for” enter the following exceptions:
      - localhost, \[a bunch of other stuff – will depend on your circs
        - see [Samba for Samba-specific
        stuff](https://github.com/claresudbery/clare-tech/blob/master/notes/clients/samba/useful-samba-links.md#proxy-settings)\]
      - Also check your NO\_PROXY environment variable, which should
        contain the same values
