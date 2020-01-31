---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/Networking-Commands
---

## Docs and Blog Posts

- [My InSimpleTerms blog](https://insimpleterms.blog/category/networking) (Networking category)
- [A Simple explanation of the CIDR IP address scheme](https://insimpleterms.blog/a-simple-explanation-of-the-cidr-ip-address-scheme)

## Misc Terminal Stuff

  - Cmd: **dig \[IP or domain name\]** - tells you what that IP / domain
    name is pointing at
    
      - Cmd: **dig -x \[IP or domain name\]** is a reverse dig - it’ll
        tell you what domain names are pointing at a particular IP or
        domain name.
    
      - To install on CentOS: **sudo yum install bind-utils**

  - Cmds: nmap and netstat
    
      - (see below)
    
      - These are two sides of the same coin: **nmap** allows you to
        look at a server from externally and see its state, whereas
        **netstat** is one you run from *inside* the server to see
        what’s going on

  - Cmd: **nmap**
    
      - Tells you what state a host is in
    
      - Eg **nmap -P0 otherelkdata.acmecorp.com**
        
          - **-P0** does an “IP protocol ping”
        
          - \- Alex used this when wondering whether there was some
            problem with a vip (virtual IP - configured for load
            balancing in F5)

  - Cmd: **netstat**
    
      - Cmd: **netstat -pultn** lists all the open ports, their
        protocols and the listeners on those ports
    
      - Can tell you who’s connected to you right now
    
      - Great explanation of netstat here:
        [<span class="underline">https://linuxacademy.com/blog/linux/netstat-network-analysis-and-troubleshooting-explained/</span>](https://linuxacademy.com/blog/linux/netstat-network-analysis-and-troubleshooting-explained/)

  - Cmd: **nc** (netcat)
    
      - This is the netcat command. Netcat is a simple Unix utility that
        reads and writes data across network connections, using the TCP
        or UDP protocol
    
      - Our most common use case is for Graphite: **echo "clare.test 12
        $(date +%s)" | nc graphite.acmecorp.com 2003**
    
      - You can also use it to test a port: nc -nv localhost 5667, then
        do echo $?, you can check whether you see 1 (for error) rather
        than 0 (for success)

  - Cmd: **lsof**
    
      - List open files - report a list of all open files and the
        processes that opened them.
    
      - For instance: **sudo lsof -i -n -P**
        
          - \! Use **sudo** or you may get no results at all\!
    
      - You get very similar results from this that you do for **netstat
        -pultn**

## Tcpdump

  - You can use tcpdump to examine network traffic by capturing packets

  - See troubleshooting section for a useful tcpdump command that allows
    you to watch ES queries on an ES master

  - Install it like this: **yum install tcpdump**

  - Tcpdump examples:
    [<span class="underline">https://hackertarget.com/tcpdump-examples/</span>](https://hackertarget.com/tcpdump-examples/)

  - More on tcpdump:
    [<span class="underline">https://www.comparitech.com/net-admin/what-is-tcpdump/</span>](https://www.comparitech.com/net-admin/what-is-tcpdump/)

## IP addresses

### Subnets

  - A subnet is a range of IP addresses within a network

  - For instance, the third number in a four-number IP address might
    represent the subnet (but doesn’t necessarily? Depends on subnet
    mask?)

  - More here:
    [<span class="underline">https://en.wikipedia.org/wiki/Subnetwork</span>](https://en.wikipedia.org/wiki/Subnetwork)

  - This subnet calculator is also useful:
    [<span class="underline">https://www.calculator.net/ip-subnet-calculator.html</span>](https://www.calculator.net/ip-subnet-calculator.html)

  - See also CIDR addresses below

### CIDR

  - See also my blog post:
    <https://insimpleterms.blog/a-simple-explanation-of-the-cidr-ip-address-scheme>

  - With a CIDR address, you get something that looks like an IP address
    but then you get **/nn** at the end
    
      - Like this: **10.128.325.0/24**
    
      - If you want to decode a CIDR address, you can use this tool:
        [<span class="underline">https://www.ipaddressguide.com/cidr</span>](https://www.ipaddressguide.com/cidr)
        It will tell you the First IP, Last IP, Number of Hosts and
        more.
        
          - This subnet calculator is also useful:
            [<span class="underline">https://www.calculator.net/ip-subnet-calculator.html</span>](https://www.calculator.net/ip-subnet-calculator.html)
        
          - You can also use these Linux commands: **ipcalc** and
            **sipcalc** (see Terminal section)
    
      - The number at the end specifies how many bits of the IP address
        will be used for the network address. The rest of the bits will
        be used for host addresses.
        
          - There are always 32 bits available, because the highest IP
            address is 255.255.255.255. If those numbers were written in
            binary instead of decimal, each of the 255s would require 8
            bits (255 is 11111111).
        
          - In the example above, 24 bits are used for the network
            address and this leaves 8 bits (32 minus 24) for the host
            addresses.
        
          - The range of numbers you can create when you have 8 bits is
            256 (from 0000000 to 11111111), so if you have 8 bits
            available for host addresses, the number of host addresses
            is 256.
        
          - This means that in our example, the actual range of IP
            addresses described here is **10.128.325.0** to
            **10.128.325.255.**
        
          - The first three decimals (10.128.325) will use up 24 bits
            and the last decimal (0 to 255) uses up the last 8 bits.
    
      - You can use the table shown on this page
        (https://www.keycdn.com/support/what-is-cidr) to find out how
        many IP addresses are represented by the number after the
        forward slash.
        
          - In the table below, the “decimal” column is telling you how
            many IP addresses will be in the range.
        
          - The “class” refers to the old way of allocating IP
            addresses, where class A was a range of over 16 million
            addresses, class B was a range of 65,535 addresses and class
            C was a range of 254 addresses. More here:
            [<span class="underline">https://www.keycdn.com/support/what-is-cidr</span>](https://www.keycdn.com/support/what-is-cidr)
        
          - The “mask” refers to bit multiplication, which is a whole
            other topic.
