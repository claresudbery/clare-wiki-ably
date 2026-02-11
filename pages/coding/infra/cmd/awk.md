

  - There are a couple of other `awk` examples in amongst the other stuff in [[misc-terminal-commands]]
  - Michael Rocke from AutoTrader is also a fan of `awk` - did a presentation on it at a Core showcase, 4/2/25
	  - It has quite sophisticated syntax, with a lot of logic available - can write C-like syntax
	  - You can run shell commands from within awk!
	  - Gnu awk - known as `gawk` (`brew install gawk`) 
		  - Can be useful for parsing files, eg csv files and fixed-width files
	  - The AWK Programming Language - book by Aho, Kernighan and Weinberger (the language is named after the first initials of their surnames)
	  - Been around since the 70s!
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
