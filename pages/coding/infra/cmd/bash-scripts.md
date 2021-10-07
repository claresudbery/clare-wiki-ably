---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/Bash-Scripts
---
## Misc

- There are lots of scripts in my [infra-scripts repo](https://github.com/claresudbery/Infra-Scripts) (only available to Clare).
  - Note that this also contains a file called `useful-aliases.txt` - if I want the most up to date versions of these functions (eg `wp`), I need to copy its contents into `~/.bashrc`.
  - But they were all written for Windows, so you'll need to do a search and replace on file paths for both Clare home and the development directory.
- Sample bash script: Dropbox\IT Training\Misc\sample.bashrc
- if statement - the spaces matter\! **if \[\[ $NumDifferences \!= 0
    \]\]; then ... fi**
- Bash scripts:
  - **set -x** - also works on the command line - outputs every command
    that’s run to the command shell - include nested commands - useful
    for debugging (output all)
      - **set -e** - stops running on any error (also works on the
        command line)
  - If you include this line at the top of your script, it means you
    don’t have to use the “sh” command when you run the script on the
    command line:
      - This: **\#\!/bin/bash**
      - You also have to do this: **chmod +x /path/to/script**
  - You don’t have to give your script an extension
      - So for instance if you just call it winpath instead of
        winpath.sh, and you have it in your path, then you can run it as
        a **winpath** command from anywhere.
      - This is preferable to adding functions to your bashrc file.
      - If you want to run your script from anywhere on your system, see [Installing scripts](/pages/coding/infra/cmd/Misc-Terminal-Commands#installing-scripts)
- There are more useful Bash links in my Chrome bookmarks: Useful - Coding Languages and Tech - Bash Scripts

## Bash variables

  - Lack of spaces is important when assigning to variables\!
    
      - Like this: **File=$1**
      - You get a "command not found" error when you have spaces between the variable declaration and the = sign. [More on that here](https://stackoverflow.com/questions/1714603/shell-script-variables-command-not-found).
      - [Using variables](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html)

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

