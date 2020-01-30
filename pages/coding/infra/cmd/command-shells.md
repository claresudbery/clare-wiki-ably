---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/Command-Shells
---
## Zsh

  - File colours / red files
    
      - When you see file names listed in ls that are coloured red, this
        is (probably) because they are executables.
    
      - To find out what the colours mean:
        
          - Cmd: **man ls**
            
              - Scroll down to where LSCOLORS is explained
        
          - Cmd: **echo $LSCOLORS**
            
              - Tells you the current value of LSCOLORS
            
              - When I did this I got **Gxfxcxdxbxegedabagacad**
                
                  - The important bit is **bx** in the 9<sup>th</sup>
                    and 10<sup>th</sup> chars - we can see from **man
                    ls** this means that executable files are coloured
                    red.
