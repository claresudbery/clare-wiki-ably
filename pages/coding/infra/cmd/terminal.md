---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/Misc-Terminal-Commands
---
## Very Useful Book

  - Don’t forget a lot of this stuff is in the Data Science at the
    Command Line book:
    [<span class="underline">https://www.datascienceatthecommandline.com/</span>](https://www.datascienceatthecommandline.com/)

## Pbpaste

  - Like alt click in text editors – if you wanted to select a column of
    text

  - Cmd: **pbpaste | awk '{print $1}' | pbcopychef log**

  - Pastes what’s in clipboard, selects up to the first whitespace ($1)
    or could do $5 for the fifth field (separated by whitespace)

  - For more complex tasks, might use something like grep or sed

## Unix sort

  - Eg curl in terminal – “**curl
    logs.acmecorp.com:9200/\_cat/indices?v**” yellow status means some
    missing replicas

  - To sort the results of that command: **curl
    logs.acmecorp.com:9200/\_cat/indices?v | sort -k3**

  - To sort by file size: **curl localhost:9200/\_cat/indices | tr
    '\[kmg\]b' '\[KMG\] ' | sort -k9hb**
    
      - (**sort** needs to see “Kb” instead of “kb”, then ignore leading
        spaces with **-b**, choose 9<sup>th</sup> column with **-k9**
        and sort by human-readable file size with **-h**)
    
      - ...or transform sizes from human readable to bytes within the
        api call and then it’s easier to sort with sort -nk: **curl -s
        http://testelk.acmecorp.com:9200/\_cat/indices?bytes=b | sort
        -nk9**

  - Sorts using the 3<sup>rd</sup> column of data

  - To find out more about the sort command: **man sort**

## Htop

  - Cmd: **htop**

  - Numbers at the top are system stuff: The actual listed numbers are
    CPUs – 4 on my VM, typically about 20 on prod servers – gives you
    utilisation of each CPU

  - The mem section shows you how much memory is being used – the
    coloured bars represent different types of usage
    
      - If green is all the way to the right, that’s probably bad

  - Swp = “swap” – if kernel needs to allocate more memory than is
    available in RAM, it’ll start using swap = memory flushed to disk.

  - The main list in the screen is all the currently running tasks – see
    top right to see how many.
    
      - It’s basically task manager
    
      - It keeps changing cos it’s sorting by CPU usage
    
      - Shift + h = remove the green ones
    
      - The green ones are threads, the right ones are processes
    
      - F6 to change sort order (see legend at bottom of screen)

## Rsync

  - used to copy data between servers

  - Use **rsync** to propagate terraform code from one environment to
    another - see **tfsync** zsh script (should also work in bash) that
    Joe wrote that gives you a shortcut for the rsync - I have a copy in
    google Drive/Cients/Acme/Scripts/tfsync
    
      - Usage: **tfsync sandbox dev acme-livelk-sandbox
        acme-logging-dev**

## Less

  - if you want to see new data coming in to a log file – like tail but
    better because you also see historic data

  - Use **Shift+f** whilst in a file, or use the flag +F when opening
    the file: **less +F \[file details\]**

  - **To get into vim:** v

  - When scrolling in Less: if you see ”skipping” you’re doing the wrong
    type of scrolling - use arrow keys or scroll wheel

## Grep

  - Search for a string: **grep**
    
      - To recursively search the current location for “pinkerton”:
        **grep -ri pinkerton .**
        
          - (Remember “.” Means current location - you could replace
            this with another file path)
        
          - **i** means case insensitive
        
          - **r** means recursive (I presume)
    
      - If you don’t want to recurse into sub-folders then you can’t
        just do **grep -i pinkerton .** because you’ll get a lot of “is
        a folder” errors
        
          - Do this instead: **grep -s "string" \* .\***
            
              - > That will do current directory
            
              - For another location: **grep -s "string"
                /path/to/dir/{\*,.\*}**
        
          - **-s** means suppress errors
        
          - **\*** means all files
        
          - **.\*** means all hidden files
        
          - You have to specify file name pattern, otherwise it thinks
            you just mean folder
    
      - To search a particular file for “poppleton”: **grep poppleton
        ./clare.txt**

  - Do a grep on a zipped file: **zgrep**
    
      - (It’s actually a little script that unzips and then runs grep on
        the result)

  - Pipe to grep
    
      - You can put the results of any command through grep to search
        for only what you are interested in
    
      - Use the pipe symbol
    
      - Example: **curl thingelk.acmecorp.com:9200/\_cat/shards -n |
        grep START**
        
          - This takes all the shard lines and looks for those that
            contain the string “START”

  - Get stuff that DOESN’T match your criteria (Invert match)
    
      - Use the **-v** switch: “Selected lines are those not matching
        any of the specified patterns.”

  - Look at the last 500 characters of a file:
    
      - This: **grep -E -o '.{500}$' /var/log/logstash/logstash.log**
    
      - Note that this is using regex (**-E**)
    
      - It is also saying “only return the text that matches the regex”
        (**-o** = ‘only’)

  - Count the number of occurrences of
    “node\_not\_connected\_exception”:
    
      - This: **grep -c node\_not\_connected\_exception
        /var/log/logstash/logstash.log**
    
      - The **-c** switch specifies count

  - Look for errors that look like
    “**\[logdb164.ab5.acme.com1\]\[10.100.48.50:9300\] Node not
    connected**”, but with wildcards inserted so we will get all logdb
    hosts on all data centres
    
      - This: **grep -E -o
        '"reason"=\>"\\\[logdb...\\.ny.\\.acme\\.com1\\\]\\\[.\*\\\]
        Node not connected' /var/log/logstash/logstash.log**

  - Create a list of all the logdb hosts that appear in errors that look
    like “**\[logdb164.ab5.acme.com1\]\[10.100.48.50:9300\] Node not
    connected**”
    
      - This: **grep -E -o
        '"reason"=\>"\\\[logdb...\\.ny.\\.acme\\.com1\\\]\\\[.\*\\\]
        Node not connected' /var/log/logstash/logstash.log | sort | uniq
        -c**
    
      - Note that we pipe the results of the above grep to the sort
        function and then to the uniq function, which is a bit like
        doing SELECT DISTINCT in SQL

  - Get 5 characters before the search string and 13 characters after:
    **grep -o -P '.{0,5}search-string.{0,13}'**

  - Get 3 lines before the search string and 2 lines after: **grep -B 3
    -A 2 foo README.txt**

  - To return file names only (not actual text matches): **grep -l**

  - Search for a string in any sub-folder (or folder below that) called
    recipes
    
      - This: **grep -r "datacenter" ./\*\*\*/recipes**

  - Search for a string in any nested folder structured ./\*/\*/recipes
    
      - This: **grep -r "datacenter" ./\*/\*/recipes**

  - Match a string with some wildcards in the middle - here we are
    looking for anything that matches the pattern dn0\*\*\*.pug:
    
      - This: **grep "dn0...\\.pug"**

## Compressed files

  - To extract:
    
      - You can install unpack
        
          - It will identify the file extension and then use the
            appropriate command
        
          - Installation: See Appendix A, Data Science at the Command
            Line)
    
      - Or...
        
          - For .tar.gz: **tar -xzvf \[filename\]**
        
          - For .gz: **gunzip \[filename\]**
        
          - For .rar: **unrar \[filename\]**
        
          - For .zip: **unzip \[filename\]**
        
          - For .xz: **unxz**

## Installing scripts
  - Copy script into \~/scripts folder
  - Edit PATH env var to include scripts folder
      - Put something like this into something like \~/.bashrc or
        \~/.zshrc: **export PATH=$PATH:/Users/your-user-name/scripts**
      - (see section on env vars below for more details)
  - If you include this line at the top of your script, it means you
    don’t have to use the “sh” command when you run the script on the
    command line:
      - This: **\#\!/bin/bash**
      - You also have to do this: **chmod +x /path/to/script**
  - Don’t give your script an extension, just add to path and it will
    become a command
      - (see section on bash scripts)

## Env vars

  - To look at the existing value of an env var: **echo $PATH**

<!-- end list -->

  - To set the value of an env var (temporary):
    **PATH=$PATH:\[additional-path\]**

  - If you just set an env var at cmd prompt, it will be local and not
    exposed to child processes
    
      - Like this: **EDITOR=vim**
    
      - In fact this is NOT an env var, it’s just a var
    
      - For it to become an env var, you need to export: **export
        EDITOR=vim**
    
      - This will still only be available in this shell and this
        instance
    
      - To set it permanently, set it in a config file, eg zsh profile:
        
          - Cmd: **vim \~/.zshrc**
        
          - Type **export EDITOR=vim** as a line in the file
        
          - (Exit and save the file)
        
          - Cmd: **source \~/.zshrc**
        
          - Add stuff to your PATH and make it stick:
            
              - This: **export PATH=$PATH:\[additional-path\]**
            
              - Note that paths are separated by colons, so here is an
                example: **export PATH=$PATH:/Users/csudbery/scripts**

## Suggested Terminal Tools

  - top tools
    
      - \- neovim
    
      - \- ripgrep
    
      - \- mosh
    
      - \- nmap
    
      - \- fish (okay but don’t)
    
      - I reeeaaally like having a git-aware shell prompt, if you don’t
        have one already
        [<span class="underline">https://github.com/arialdomartini/oh-my-git</span>](https://github.com/arialdomartini/oh-my-git)
        (edited)
    
      - oh-my-git actually looks super agressive
    
      - oh this is the one I used to use in bash\!\!
        [<span class="underline">https://github.com/magicmonty/bash-git-prompt</span>](https://github.com/magicmonty/bash-git-prompt)
    
      - ncm2 - pluggable tab-complete for neovim:
        [<span class="underline">https://github.com/ncm2/ncm2</span>](https://github.com/ncm2/ncm2)
    
      - vim-surround (for screwing with quotes and parens and stuff):
        [<span class="underline">https://github.com/tpope/vim-surround</span>](https://github.com/tpope/vim-surround)

  - “I really love my tmux + vim configuration”
    
      - Put this in your \~/.bashrc, it does wonders:
        
          - This:
        
          - **\# bash-completion linux**
        
          - **\[ -f /usr/share/bash-completion/bash\_completion \] &&
            \\**
        
          - **source /usr/share/bash-completion/bash\_completion**

  - More command-line recommendations:
    
      - **spark** - creates graphs on the command line
    
      - **gnuplot** - makes sin waves ‘n’ stuff - clever ASCII graphs -
        but has a more complicated API

  - David’s zshrc:
    
      - David’s zshrc sources several other files, for instance a bash
        function for cd that runs bin/activate whenever you cd into a
        directory that has a Python venv in it:
        
          - function cd() {  
             if \[\[ -d ./venv \]\] ; then  
               deactivate  
             fi  
              
             builtin cd $1  
              
             if \[\[ -d ./venv \]\] ; then  
               . ./venv/bin/activate  
             fi  
            }

## Pipes, stdin and stdout

  - When you use the pipe symbol, you are creating a pipeline which has
    data flowing through constantly
    
      - \!\! When you pipe stuff, you are literally creating a pipe\!
        It’s basically a buffer, so when the output of one part
        beceoms the input of the next part, it is doing a bit at a time,
        not all at once. So if you pipe four commands, all four commands
        will be executed simultaneously, with little bits of data being
        passed from one part to the next

  - Individual pieces of data will be passed on to the next command in
    the pipeline before the first command has processed all its data

  - Everything which comes into each command in the pipeline is coming
    in via stdin

  - Everything which comes out is coming out via stdout

  - The pipe takes stdout and converts it to stdin

  - If you use the **echo** command, you are directing output to stdout
    
      - If you then follow it with a pipe, it goes back into stdin
    
      - This is how you can take any input and direct it to stdin - by
        using echo
    
      - So for instance, I want to send some data to **nc** (netcat) so
        I can send it direct to the graphite port: **echo "clare.test 12
        $(date +%s)" | nc graphite.acmecorp.com 2003**

## Terminal navigation

  - Don’t forget a lot of this stuff is in the Data Science at the
    Command Line book:
    [<span class="underline">https://www.datascienceatthecommandline.com/</span>](https://www.datascienceatthecommandline.com/)

  - \> will redirect output to a file, and \< will take input from a
    file
    
      - \>\> will append, instead of replacing file contents
    
      - For \< the name of the file goes AFTER the symbol, not before
        (because it is an argument)
    
      - \< is actually passing the contents of the file to stdin
    
      - \> is redirecting stdout to a file
    
      - Use the **\<(** syntax to create a temp file which doesn’t exist
        on hard disk but is created temporarily so that it can be passed
        as an argument to a function that requires a file as an input.

  - \!\! will insert previous command

  - **ls -lah** - list everything in current folder
    
      - the h flag is for human-readable file sizes
    
      - if you want in date order, use -t
    
      - **ls -lahSr** - List files in size order (**S**), reverse
        order(**r**) so biggest ones come last

  - Ctrl + a – start of line

  - Ctrl + e – end of line

  - Cmd + D – new tiled window (vertical)

  - Cmd + Shift + D – new tiled window (horizontal)

  - Cmd + \[ and \] – move between tiled windows

  - Cmd + Shift + Enter – expand or unexpand pane

  - Cmd + Enter – maximise whole window or return to previous state

  - Cmd + w – close pane (this will work in any app on the Mac)

  - Cmd + t – new tab

  - Cmd + N – new terminal

  - Cmd + w - close tab

  - Ctrl + r – search the command history
    
      - Keep pressing Ctrl+R to get other matches for your search term
    
      - Ctrl + C to clear if it’s searching current text instead of
        whole history
    
      - More:
        [<span class="underline">https://lornajane.net/posts/2011/navigating-bash-history-with-ctrlr</span>](https://lornajane.net/posts/2011/navigating-bash-history-with-ctrlr)

  - **history** - list out all the command history

  - Copy text – just highlight

  - Paste text – Cmd V

  - Vim + space + cmd + v – paste clipboard

  - **cd –** (the hyphen is part of the command) - back to wherever you
    were previously

  - reset – When an iTerm session goes weird (text appearing on top of
    text)

  - Ctrl + d – exit out of an ssh (or just type **exit**)

  - **Ctrl+z** (go to background) - come out of Vim to shell, then
    **fg** (shell command, takes you back again, is also a shell
    command) to go back to Vim again - allows you to switch between Vim
    and command line

  - sudo\!\! Repeat the previous command but with sudo in front

  - **hostname** - When you don’t know which machine you are on (eg
    local vs VM)
    
      - VM looks like this: **csudbery.vm.ab2.acme.com**
    
      - Local machine looks like this: **csudbery.prodvpn.acme.com**

  - Cmd + Alt/Option + F – password manager - allows you to access
    password for Acme stuff
    
      - To configure: all you need is iTerm2. Then the key combination
        is Cmd + Alt + f, and first time in you click a Plus button to
        add your password.

  - chmod : change permissions
    
      - Cmd: **chmod -R 777 ./var**
    
      - Changes permissions on everything in the var folder,
        recursively, using the 777 mask

  - Find the docker environment variable: **env | grep DOCKER**

  - **find**:
    
      - (Or you can use **fd** instead of find (via Alex) -
        https://github.com/sharkdp/fd - A simple, fast and user-friendly
        alternative to 'find')
    
      - Look for a particular file type: **find . -name "\*.jar"**
        
          - \! It won’t work without the quotes\!
        
          - The **.** represents current folder - it will also recurse
            all sub-folders
    
      - Look for a folder / find folder: **find \[path to search\] -type
        d -name \[folder name\]**
    
      - Find all files greater than 2gb: **find / -xdev -type f -size
        +2G -exec ls -lsh {} \\; 2\>/dev/null**
        
          - \-xdev use only the parent file system, don’t recurse down
        
          - \-type f files only, not folders
        
          - **exec ls -lsh {} \\;**
            
              - Execute the **ls** command for each result
            
              - The empty braces mean we are not passing in any
                individual files
            
              - The semi-colon defines where the command should stop,
                but you have to escape that character, hence the
                back-slash

  - Get into a sudo root shell: **sudo -s**
    
      - (search terms, sudo prompt, root user, su -s)

  - Find out who last logged into this server: **last**
    
      - \! If there have been any log problems, this won’t be accurate -
        because last gets its info from a log file - usually
        var/log/wtmp

  - **“zsh: no matches found”**
    
      - When you see this, it might just be that you haven’t escaped a
        character and zsh is trying to interpret it as a special command
    
      - Either use backslash to escape characters or just enclose
        arguments in quotes
    
      - Remember it’s just the argument you’re enclosing in quotes, not
        the whole command
    
      - For instance, **jq .\[\].target | sort** would become **jq
        ".\[\].target" | sort**

  - **Creating aliases in Bash:**
    
      - Put them in \~/.bashrc or \~/.zshrc (depending on your shell),
        then put references to \~/.bashrc or \~/.zshrc in \~/.profile
        and/or \~/.bash\_profile, like this:
        
          - **. \~/.bash\_profile**
        
          - **. \~/.bashrc**
        
          - **. \~/.zshrc**
    
      - More info:
        [<span class="underline">https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc</span>](https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc)

  - Use the bang to access previous commands
    
      - Type **\!\!** to substitute your previous command
        
          - So for instance **sudo \!\!** is the previous command with
            sudo in front
    
      - Also you can access other previous commands
        
          - For instance **\!cat** will repeat your most recent cat
            command
        
          - And **\!cat:p** will display the most recent cat command
            without running it
        
          - After that, you have now replaced what’s in **\!\!** with
            whatever you got for **\!cat:p**, so you can just type
            **\!\!** to execute that **cat** command.
    
      - Also **\!$** is your previous arguments
        
          - So after **mkdir new/folder**, you can just type **cd \!$**

## Other Terminal / Unix commands

### Small ones

  - Copying things from VM to laptop: **pbcopy**

  - Search for a string: **grep**
    
      - See dedicated section on grep in this doc

  - Get a link to a file, for sharing / to share file: **gist
    \[file-path\]**

  - Copy folder: Create a copy of a folder and all sub-folders: **cp -r
    /home/files/\* /home/files-backup**

  - Get the full path of a file: **readlink -f filename.ext**

  - **wc -l \[path to file\]** - word count, but the -l switch turns it
    into a line count

  - **head -5 \[path to file\]** - look at the first 5 lines of the file

  - **tail \[path to file\]** - get new entries in log file appearing on
    command line
    
      - Get just the last 100 lines: **tail \[path to file\] -100**
    
      - Tail the file, only show new lines and keep showing new lines:
        **tail -f \[file-name\]**
        
          - \*\* After this, pause the console scrolling with Ctrl + s,
            then resume with ctrl + q
    
      - Note that you can pipe the results to grep so that you can only
        output the stuff you are interested in
    
      - Like this: **tail -f /var/log/logstash/logstash.log | grep -E -o
        '"reason"=\>"\\\[logdb...\\.ny.\\.acme\\.com1\\\]\\\[.\*\\\]
        Node not connected'**
        
          - The above command has the -f flag to mean “follow” - same as
            shift+f in less - so that output is constantly updated
        
          - See grep section in this doc to explain the grep part of the
            command

  - Sorting: use the **sort** command
    
      - To sort the results of another command: **curl
        logs.acmecorp.com:9200/\_cat/indices?v | sort -k3**
    
      - The **-k3** parameter means that we will sort on the third
        column of the output (k stands for key)
    
      - (But remember that this will be an alphabetical sort so if you
        want a numerical sort add the **-g** switch)
    
      - (and if you want to sort human-readable file sizes, use **-h**)
        
          - But this will only work if you have the latest gnu tools
        
          - This: install gnu tools
        
          - Might need to install
    
      - To sort by file size: **curl localhost:9200/\_cat/indices | tr
        '\[kmg\]b' '\[KMG\] ' | sort -k9hb**
        
          - (**sort** needs to see “Kb” instead of “kb”, then ignore
            leading spaces with **-b**, choose 9<sup>th</sup> column
            with **-k9** and sort by human-readable file size with
            **-h**)
        
          - ...or transform sizes from human readable to bytes within
            the api call and then it’s easier to sort with sort -nk:
            **curl -s
            http://testelk.acmecorp.com:9200/\_cat/indices?bytes=b |
            sort -nk9**

  - **sed**: Can do find and replace, using regex. This replaces “ AND ”
    with “\_AND\_”: **sed -i 's/ AND /\_AND\_/g' 2.list**
    
      - Or this changes all characters g, m and k with upper case
        replacements: **sed 's/\[0-9\]\[mgk\]/\\U&/g'**
    
      - See also **tr** below, for more straightforward find/replace.

  - **tr** - simple find/replace: eg **echo "clare" | tr "clare"
    "angus"**
    
      - Or do this to replace all characters g, m and k with upper case
        replacements: **tr '\[kmg\]b' '\[KMG\] '**
    
      - Used this to get ES indices sorted in size order (because
        Elastic Search uses “kb” but sort needs to see “K” to sort y
        human readable file size): **curl localhost:9200/\_cat/indices |
        tr '\[kmg\]b' '\[KMG\] ' | sort -k9hb**
    
      - ...but it’s a bit odd because the two strings have to be of the
        same length\!

  - **pbpaste** : You can use it to sort on a particular column
    
      - Like this: **pbpaste | sort -k 6**
    
      - (sorts on the 6<sup>th</sup> column)

  - On VM do this to get **pbcopy** & **pbpaste** available for Linux:
    
      - This: sudo yum install -y xclip
    
      - This: alias pbcopy="xclip -sel clip"
    
      - This: alias pbpaste="xclip -sel clip -o"
    
      - This doesn’t actually work though - I get the following error
        when I then do **pbcopy \< \~/.ssh/id\_rsa.pub**: “Error: Can't
        open display: (null)”. Explanations here:
        [<span class="underline">https://stackoverflow.com/questions/18695934/error-cant-open-display-null-when-using-xclip-to-copy-ssh-public-key</span>](https://stackoverflow.com/questions/18695934/error-cant-open-display-null-when-using-xclip-to-copy-ssh-public-key)

  - **egrep**: Like grep but using regular expressions

  - Use this website to convert epoch time to readable time:
    [<span class="underline">https://www.epochconverter.com/</span>](https://www.epochconverter.com/)

  - Compress: **xz -9 -T 0 /var/log/httpd/access\_log**

  - **jq:** Pretty-print json and fetch particular elements within json
    
      - See below

  - **nc**: This is the netcat command. Netcat is a simple Unix utility
    that reads and writes data across network connections, using the TCP
    or UDP protocol

  - **date**: This gets you the epoch date format. **date +%s** gets you
    the current date/time.
    
      - Convert epoch to human-readable: **date -d @1552306691**
    
      - Convert readable date to epoch: **date --date="11-MAR-19" +%s**
    
      - Also this utility does epoch conversion:
        [<span class="underline">https://www.epochconverter.com/</span>](https://www.epochconverter.com/)

  - You can use **zless** to look in zipped files

  - Use **tee** to output something to the command line AND write/append
    it to a file: **cat my-file | grep fqdn | tee -a my-dest**
    
      - The **-a** flag tells it to append rather than replace (default
        is replace)

  - Get a distinct unique list (remove duplicates): **uniq**
    
      - \!\! You have to sort first \!\! It only removes duplicates that
        are adjacent to one another

  - **lsof** : “list open files” - all open files and the processes that
    opened them
    
      - On thingelk10.ab2, ran the following: **lsof -i -n -P -a -p
        17145 | grep -i listen**

  - **ipcalc \[IP address\]**: Get info on masks and stuff for an IP
    address
    
      - Also **sipcalc** \[CIDR address\] gets you info on the CIDR
        range of IP addresses
    
      - More here:
        [<span class="underline">http://3.bp.blogspot.com/-brKOpfgJ5WQ/UbAikz4TGeI/AAAAAAAABQE/cZgub7FxmT0/s1600/ipcalc+and+sipcalc.png</span>](http://3.bp.blogspot.com/-brKOpfgJ5WQ/UbAikz4TGeI/AAAAAAAABQE/cZgub7FxmT0/s1600/ipcalc+and+sipcalc.png)
    
      - See also CIDR section in these notes

### awk

  - **awk**: Helps to do text formatting
    
      - One really useful thing is to use it to pull out one field from
        a list of data, where the space characters is used as separator
        
          - For instance when looking at ES slowlog data:
        
          - This: **ssh logdb163.ab5.acme.com**
        
          - This: **cd /var/log/elasticsearch1/**
        
          - This: **head -n 20 elasticsearch\_index\_search\_slowlog.log
            \> 1.list**
        
          - This: **cat 1.list | jq | head -n 1**
        
          - This: **cat 1.list | awk '{print $11}' | head -n 1**
            
              - ($11 refers to the 11<sup>th</sup> field of data in the
                line, using space char as a separator)
    
      - Can also add text to the string you are formatting (see below
        for full context): **awk '{print "minutes:", $1/6e+10,
        "nanoseconds:", $1}'**
    
      - If you want to take a number - like wordcount - and then add
        text to it when outputting: **| wc -l | awk '{print "Num
        previous nodes: ", $1}'**
    
      - Can format a date into your string: **awk -v date="$(date)"
        '{print $1, date}'**
    
      - This will take a substring from the 7<sup>th</sup> char of each
        line, removing the last char of each line: awk **'{print
        substr($0, 7, length($0)-8)}'**
    
      - For instance the equivalent of using Alt drag in a text editor:
        
          - Copy the text, then **pbpaste | awk '{print $1}' | pbcopy**
            will paste just column 1 ($1) into a clipboard and copy it
            back out again
    
      - Can also be used to do arithmetic in line:
        
          - This: **echo "1 2 3 4 5" | xargs -n1 | awk '{print $1\*\*2}'
            | xargs**
            
              - This takes the input 1 2 3 4 5 and outputs each number
                to the power of 2 (ie squared)
        
          - This converts values in nanoseconds to values in minutes (by
            dividing by 6e+10): **curl -s
            "http://logdbmaster.acmecorp.com:9200/\_tasks?actions=indices:data/read/search\&pretty"
            | jq '.nodes\[\].tasks\[\].running\_time\_in\_nanos' | awk
            '{print "minutes:", $1/6e+10, "nanoseconds:", $1}'**

### ag

  - The “silver searcher”

  - Like grep

### pv

  - **pv** shows the progress of a pipe (how long everything is taking)
    
      - Eg: **knife search -i "nonagios:true" | pv -N knifesearch**
        
          - This runs a knife search and pipes the result to pv, which
            means that pv will track progress for you
        
          - We have called the progress tracker knifesearch (using the
            -N flag)
    
      - Eg: **knife search -i "nonagios:true" | pv -N knifesearch \>
        clare.txt**
        
          - This runs a knife search and pipes the result to a file, but
            with pv in the middle of the pipe so it can track progress
        
          - Note that unless it comes at the beginning, the pv command
            always has its own part of the pipe, so for instance we
            could have piped the result to grep: **knife search -i
            "nonagios:true" | pv -N knifesearch | grep thingelk**
    
      - Eg: **pv -cN unzip filename.txt | gunzip -c -**
        
          - This creates a progress-tracker called “unzip”
        
          - ...which will cat the contents of the file to the following
            command (gunzip), and then track the progress of the piping
    
      - Big command with four pvs in it: **pv -cN unzip
        elasticsearch\_index\_search\_slowlog1.log-20190224.gz | gunzip
        -c - | pv -cN sed | sed 's/.\* source\\\[\\(.\*\\)\\\],
        extra\_source.\*/\\1/' | pv -cN jq | jq -f \~/jq-script -c | pv
        -cN sort | sort | uniq -c | sort -g | tee
        \~/queries-20190224.json**
        
          - Script: (see the **\~/jq-script** bit in the middle)
        
          - **\# Apply f to composite entities recursively, and to
            atoms**
        
          - **def walk(f):**
        
          - **. as $in**
        
          - **| if type == "object" then**
        
          - **reduce keys\[\] as $key**
        
          - **( {}; . + { ($key): ($in\[$key\] | walk(f)) } ) | f**
        
          - **elif type == "array" then map( walk(f) ) | f**
        
          - **else f**
        
          - **end;**
        
          - 
          - **walk(if type == "object" then del(."@timestamp",
            .date\_range, .date\_histogram) else . end)**
    
      - Pv has been inserted at every stage of the pipe, which means
        that the output will contain four lines, one for each pv, each
        with its own name - and you will be able to see all elements of
        the pipe simultaneously

## Stuff from Data Science at the Command Line

  - Online version of the book:
    [<span class="underline">https://www.datascienceatthecommandline.com/</span>](https://www.datascienceatthecommandline.com/)

### General stuff

  - Cmd: **curl**
    
      - Good description of what curl is plus different options
        available, p35
    
      - Most common options are
        
          - \-s to suppress progress meter,
        
          - \-u to specify user name / password, eg for FTP,
        
          - \-L to automatically follow redirects (eg for bit.ly urls)

  - Cmd: **curlicue**
    
      - Used to handle OAuth for Web APIs - will call curl with the
        correct headers - see p39

### Vagrant machine management

  - See also notes in front of my copy of the book

  - On my Acme laptop:
    
      - Getting started:
        
          - Cmd: **dst**
        
          - Cmd: **vagrant ssh**
    
      - Leaving:
        
          - Cmd: **exit**
        
          - Cmd: **vagrant halt**
    
      - Check status:
        
          - Cmd: **vagrant status**

  - Copying files to vagrant VM:
    
      - Install vagrant-scp plugin: **vagrant plugin install
        vagrant-scp**
    
      - Get yourself into the folder containing your vagrant vm (on my
        Acme laptop: /Users/csudbery/development/MyDataScienceToolbox)
    
      - Then use this command: **vagrant scp \[file-path\]
        default:/home/vagrant/my-data**
        
          - Note “**default**” is the name of your VM (probably)
        
          - To find vagrant machine name: **vagrant status**
    
      - More here:
        [<span class="underline">https://stackoverflow.com/questions/16704059/easiest-way-to-copy-a-single-file-from-host-to-vagrant-guest</span>](https://stackoverflow.com/questions/16704059/easiest-way-to-copy-a-single-file-from-host-to-vagrant-guest)

### Cmd:cut

  - Cmd: **cut** (see also **csvcut** below)
    
      - Cmd: **cut -c1-80**
        
          - trim lines longer than 80 chars
    
      - Cmd: **cut -d, -f 5,1,3**
        
          - show the 5<sup>th</sup>, 1<sup>st</sup> and 3<sup>rd</sup>
            fields using the default field separator of comma
        
          - Note the fields won’t be shown in the order 5,1,3 - they
            will stay in the original order (1,3,5)
        
          - See p73
    
      - Cmd: **cut -dT -f1**
        
          - cut the date info in the first field to leave out time /
            time zone info
        
          - (? using tab as the field separator, hence **-dT ?**)
    
      - Cmd: **cut -d' ' -f3-**
        
          - Use space as a field separator, and print all fields from
            the 3<sup>rd</sup> one to the last one.

### Spreadsheets / csvs

  - Spreadsheets / csvs:
    
      - Use **csvkit** - see p34
    
      - (see **vagrant scp** for copying spreadsheet data to VM)
    
      - Cmd: **in2csv \[spreadsheet name and path\] \> \[new csv file
        name and path\]**
        
          - Convert spreadsheet to csv
        
          - If you have multiple sheets in your spreadsheet, use
            **--sheet** to specify sheet name
            
              - The default is supposed to be the first sheet but based
                on my tests with a new spreadsheet, it’s actually the
                most recently created sheet.
    
      - **csvcut**: Cmd: **in2csv \[file name\] | csvcut -c ‘Wk ends
        Sunday’,Title,Year,Rating**
        
          - If you have headers named ‘Wk ends Sunday’, Title, Year and
            Rating it cuts out only those columns
    
      - Pipe to **csvlook** to get a nice easy-to-read tabulated format
        for csv data

## Jq json format check and pretty-print json formatter

  - To check that your json is well formatted

  - Cmd: **jq ‘.’ \[file\]**
    
      - The “.” argument means start at the root node of the json

  - You can also pipe the results of a call to jq
    
      - For instance, the ES search returns json, so pipe the results to
        jq to get pretty-print / json formatting
    
    <!-- end list -->
    
      - Like this: **curl
        "thingelk.acmecorp.com:9200/thingelk-%%\\{index\_timestamp\\}/\_search?sort=@timestamp:desc"
        -s -n | jq "."**
    
    <!-- end list -->
    
      - The “.” argument means start at the root node of the json

  - Tutorial:
    [<span class="underline">https://stedolan.github.io/jq/tutorial/</span>](https://stedolan.github.io/jq/tutorial/)

  - Jq manual:
    [<span class="underline">https://stedolan.github.io/jq/manual/</span>](https://stedolan.github.io/jq/manual/)

  - Get rid of null data: **curl -sS
    "http://devgraphite.acmecorp.com/render/?target=clare.test\&format=json\&from=-1min"
    | jq '.\[\].datapoints | del(.\[\]\[\] | select(. == null))'**
    
      - For any nested elements (**.\[\]\[\]**), delete anything
        (**del**) that has the value null (**select(. == null)**)

  - Get rid of anything that doesn’t match your object type (in this
    case we are looking for **query\_string** objects), and then get rid
    of null entries: **jq 'if type == "object" then .. | .query\_string?
    else . end | select(type \!= "null")' -c 1-queries.list**

  - If you want to have wildcards, for instance because some elements
    have names which are IDs:
    
      - **curl -s
        "http://logdbmaster.acmecorp.com:9200/\_tasks?actions=indices:data/read/search\&pretty"
        | jq '.nodes\[\].tasks\[\].running\_time\_in\_nanos' | awk
        '{print "minutes:", $1/6e+10, "nanoseconds:", $1}'**
    
      - This is to get running\_time\_in\_nanos from json which looks
        like this:
    
      - {
    
      - "nodes": {
    
      - "Ck-SXPaeQVq1IjQFfp3Glw": {
    
      - "name": "kibana01.ab5.acme.com1",
    
      - "tasks": {
    
      - "Ck-SXPaeQVq1IjQFfp3Glw:3452468": {
    
      - "running\_time\_in\_nanos": 7909529396
    
      - },
    
      - "Ck-SXPaeQVq1IjQFfp3Glw:3452466": {
    
      - "running\_time\_in\_nanos": 8054708481
    
      - }
    
      - }
    
      - },
    
      - "YMisF5\_xRzWOYZWQl9Kp-Q": {
    
      - "name": "logdbmaster01.ab5.acme.com1",
    
      - "tasks": {
    
      - "YMisF5\_xRzWOYZWQl9Kp-Q:415958243": {
    
      - "running\_time\_in\_nanos": 6511704831
    
      - }
    
      - }
    
      - }
    
      - }
    
      - }

##  “Teed writes”

  - > The command-line utility **tee** allows you to duplicate output to
    > both screen and file (or two other outputs)

  - > “teed writes” are when you are migrating to a new output and you
    > don’t want to have to do a backfill when you’re done, so for a
    > while you write to both the old destination and the new one, both
    > at once.

## Watch command
  - Use “watch” to make a command happen every n seconds
    - By default it will be every 2 seconds
    - ... or use -n interval to tell it how often: **watch -n 3 curl "http://10.266.8.66"**
  - Like this: **watch 'curl -s
    csudbery:\[password\]@xxx.Acmecorp.com:9200/\_cat/recovery | grep
    -v done'**
      - Or like this: **watch curl "http://10.266.8.66"**
      - Notice the first example needed quotes because it wasn’t just a
        simple command + argument, but the second works fine as it is.
      - That first example is doing the following: Curl the specified
        endpoint using creds because it’s extra locked down. Pipe the
        result to grep, where you are EXCLUDING entries marked done (-v
        means exclude). Keep curling every 2 seconds and watch the
        results - that way you can see the number of not-done-yet
        recovery items gradually subside.
  - You can also get it to show you differences between each execution
    by adding a -d switch, like this: **watch -d ‘curl \[rest of
    command\]’**

## Disk Space Issues

  - Check disk space: **df -h**
      - Lists disks in human readable format (with readable numbers)
      - Lets you know if any disks are full
      - \! The first column is partitions, NOT folders
      - Eg sda4 is the fourth partition of the first (“a”) SATA hard
        drive
  - Check the space occupied by every directory in current folder
      - This: **sudo** **du -h -d1 /var/log**
      - If that doesn’t work, try **du -h --max-depth=1 .**
      - (**.** denotes current directory)
      - (**d1** denotes depth of 1, so it doesn’t recurse all
        sub-directories)
  - cmd: **sudo ncdu -x /var/log** for a nice ncurses interface for
    navigating the drive by size
      - Don’t run this on the root - it will take forever\!
      - The **-x** flag just says “don’t look at other devices”.
        Sometimes you want it sometimes you don’t
      - Once the results are up, use the arrow keys and Enter to drill
        down into folders. Use the ../ at the top of each list to
        navigate back up the tree.
  - \!\! Don’t use **ls - lah** to check folder sizes, as it only gives
    the size of the actual folder - doesn’t recurse into content.
  - Check the space occupied by a particular directory:
      - **du -sh \[path to directory\]**
  - List files in size order (**S**), reverse order(**r**) so biggest
    ones come last:
      - **Cmd: ls -lahSr**
  - Find all the files that are a particular type and are above a
    particular size and over a particular age and not in a particular
    folder
      - This: **find . -size +50G -ctime +90 -iname '\*.gz' -not -path
        "./pathtofolder/\*" -exec ls -lsh {} \\;**
  - Find which files are growing the fastest
      - Follow the instructions here (note that you might need to do
        **sudo su** to become root user first):
        <https://aarvik.dk/how-to-find-growing-files-on-linux/index.html>
      - Or run this command that Tera built: **find /data/syslog/current
        -mtime -1 -type f -not -name '\*.gz' -not -path
        '/data/syslog/current/hosts/\*' -exec ls -l "{}" ";" | sort -k 5
        -n**
      - Or run this command of Alex’s that finds files that still have
        handles open: **lsof -nP +L1**
          - When they ran it when we ran out of disk space on one host,
            it only showed files that had been deleted - I don’t know if
            that was the context we were in or whether that’s baked into
            the command
          - On one host, we realised these not-actually-deleted files
            (because handles still open) were losing us disk space, and
            the solution was to restart syslog: **systemctl restart
            syslog** - that freed up the file handles and freed up the
            disk space occupied by those files.
  - Find file/directory usage: **find / -xdev -printf '%h\\n' | sort |
    uniq -c | sort -k 1 -n**
  - Find most open files per process: **lsof | perl -lane
    '$x{"$F\[0\]:$F\[1\]"}++;END { print "$x{$\_}\\t$\_" for sort
    {$x{$a}\<=\>$x{$b}} keys %x}'**
  - Increase disk space by compressing files:
      - Ideally aim to have same zipped format as what is already there
      - For a \*.xz result: **xz -9 -T 0 \[file-name\]**
          - (-T 0 means use as many threads as there are gcu cores)
          - \-9 is how much compression - 9 is theh ighest value - will
            give smallest result but take longest
      - For a \*.gz result: **tar -czvf file.tar.gz \[path to directory
        or file\]**
          - List the contents of a tar file: **tar -ztvf file.tar.gz**
          - Extract a tar file to a folder: **tar -xzvf file.tar.gz -C
            /folder-name/**
  - Find out which directories are mounted on which disks: **mount**
  - Look for big log files
      - Look for those which haven’t been updated for a while - they’re
        safer to compress or get rid of
      - \!\! Watch out for **lastlog** files \!\!
          - They are in a “sparse file” (sparsefile) format, which means
            that the **ls** command will give you false results for file
            size
          - To get the correct file size, add the --size flag to the
            **ls** command: **ls -lh --size lastlog**
              - This will have the effect of giving the correct file
                size at the start of the result (although it will still
                have the erroneous giant size towards the end of the
                line)
          - More here: <http://www.noah.org/wiki/Lastlog_is_gigantic>
  - Don’t just check the data disk/folder - it may well be at 98% but
    that can be normal in some circs
      - A knife command to truncate logs on all logstash hosts
          - Like this: **knife ssh role:Logstash “sudo bash -c ‘\>
            /var/log/logstash/logstash.log’” -P -C 3**
      - Alex’s command for saving space without worrying:
          - Cmd: **for FILE in \`find /var/log/problemfolder\* -not
            -iname "\*.xz" -not -iname "\*.gz" -not -iname "\*.log"
            -type f\`; do echo $FILE; truncate -s \`xz -T 0 -c $FILE |
            dd of=$FILE conv=notrunc 2\>&1 | sed -n '$ s/ .\*$// p'\`
            $FILE; mv -f $FILE $FILE.xz; done**
          - Alex’s decription for what it does:
          - Step one
          - **\`find /var/log/problemfolder\* -not -iname "\*.xz" -not
            -iname "\*.gz" -not -iname "\*.log" -type f\`** = list all
            the files within /var/log/problemfolder1 and
            /var/log/problemfolder2 that don’t end in “.xz” .gz or
            “.log”
          - Okay so I don’t remember how the truncate/notrunc thing
            works together any more
          - and rather than try to re-figure it out exactly, I can say
            that the basic idea for that part is this:
          - \- read the file into stdin and compress it as a stream of
            data out to stdout (\`xz\`)
          - \- calculate the size of this new compressed data and shove
            it back into the \*same file\* we read from.
          - \- truncate the file to the new calculated length
          - \- Rename the file to filename.xz ’cause we pushed it back
            into the same file and that’s just called
            \`problemfolder.log.1\` or something. We need to mv it to
            \`problemfolder.log.1.xz\`
  - Are deleted files being held onto?
      - **rsyslogd** might hold deleted log files ... On one occasion we
        restarted it and we went down to 29G ... but we also had
        **syslog-ng** holding some files
      - The command used to find them: **sudo lsof |grep syslog-ng|grep
        delete**
      - **lsof** : “list open files” - all open files and the processes
        that opened them
