---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/Bash-Scripts
---
## Misc

  - if statement - the spaces matter\! **if \[\[ $NumDifferences \!= 0
    \]\]; then ... fi**

  - Bash scripts:

<!-- end list -->

  - **set -x** - also works on the command line - outputs every command
    that’s run to the command shell - include nested commands - useful
    for debugging (output all)
    
      - **set -e** - stops running on any error (also works on the
        command line)

## Bash variables

  - Lack of spaces is important when assigning to variables\!
    
      - Like this: **File=$1**

  - From find-changed-chef-nagios-nodes.sh (in observability-toolbox):
    
      - Take a command line result and put it into a Bash variable
        (gives you an int): **OldNodes=\`wc -l \<
        old-chef-results.txt\`**
        
          - You need the -l because otherwise you get text, not a number
        
          - Another way of doing the same - gives you a string but I
            don't know if that's the difference (from
            find-changed-single-chef-node.sh):
            
              - **new\_data=$(echo $chef\_search\_result | grep -o -P
                '.datacenter.{0,78}')**
    
      - Assign vars and do maths in Bash: **let
        NodeDiff=$NewNodes-$OldNodes**
    
      - Building a file name with timestamp: Lines 38 onwards in
        find-changed-chef-nagios-nodes.sh (in observability-toolbox)

  - From find-changed-single-chef-node.sh:
    
      - Turn parameter into a file name: **file="$1"**
    
      - Echo a variable to the command line: **echo -n $(date) | tee -a
        changed-single-node.txt**
        
          - I think **-n** is important but I can’t remember why

## variable expansion syntax

  - If you type
    
      - **clare/{big,small}/thing**
    
      - it will be converted to
    
      - **clare/big/thing clare/small/thing**

  - Useful use case:
    
      - **git mv** **clare/{big,small}/thing**
    
      - will translate to
    
      - **git mv** **clare/big/thing clare/small/thing**

  - Also you can do this:
    
      - **git mv clare/thing.txt{,.erb}**
    
      - will be converted to
    
      - **git mv clare/thing.txt clare/thing.txt.erb**
