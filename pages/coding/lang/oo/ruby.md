---
layout: page
location: "pages/coding/lang/oo/leaf"
permalink: /pages/coding/lang/oo/Ruby
---

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [https://github.com/claresudbery/clare-wiki-ably](https://github.com/claresudbery/clare-wiki-ably)
    - The code for this site, which is built in Jekyll, which is built in Ruby.
- [https://github.com/claresudbery/clare-wiki-jekyll](https://github.com/claresudbery/Infra-Scripts)
    - Skeleton Jekyll site which I created before I started using the Ably template (Jekyll is built in Ruby).

## Other Links

- Tons of Ruby-related stuff in the [Jekyll Troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting) on this site.

## Tutorials

- [TDD and OOP and Ruby from Sandi Metz](https://www.sandimetz.com/99bottles/sample)
- [Learn TDD in Ruby](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)
- [Getting started wiuth Ruby on Rails](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)

## Miscellaenous

  - Symbols do hold strings of characters, they are just immutable
    
      - This means that when you reference a symbol in string
        interpolation, what is printed out will be the name of the
        symbol
    
      - So **\#{:node}** will give **node** as the output

  - A variable that has a string as its value will be mutable, but a
    symbol is immutable, and stored in a single place in memory

  - IRB is the standard Ruby repl

  - Python also has a repl

  - Return values in Ruby functions are the last thing that was assigned
    - the **return** statement is often not used

  - The **puts** statement is how you can output to console - useful for
    quick-and-dirty debug logging.

  - Return values in Ruby functions are the last thing that was assigned
    - the **return** statement is often not used

  - The **puts** statement is how you can output to console - useful for
    quick-and-dirty debug logging.

  - IRB is the standard Ruby repl (run **irb** on command line)

  - Python also has a repl

  - Return values in Ruby functions are the last thing that was assigned
    - the **return** statement is often not used

  - The **puts** statement is how you can output to console - useful for
    quick-and-dirty debug logging.
    
      - If you want to get the output from something in a Ruby script
        onto the command line and into a pipe: Use the **puts** keyword
        in the Ruby script
    
      - If Chef, you can use **knife exec** and then pipe the output to
        other commands
    
      - Otherwise just run the script with the script name, and pipe
        straight to something else

  - Require, gems, loading file:
    [<span class="underline">https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0</span>](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0)
    
      - If you get the error “cannot load such file” you need to check
        your load path by running **irb** on command line and then
        typing **$LOAD\_PATH**
    
      - You might have to do some kind of bundle install or vendor
        install or both

  - Calling javascript code from Ruby:
    [<span class="underline">https://github.com/sstephenson/execjs</span>](https://github.com/sstephenson/execjs)

  - If you get “cannot load such file -- bundler/setup (LoadError)” then
    you might need to run **bundle install**
    
      - If you get “command not found: bundle” then you might need to
        install Bundler: **sudo gem install bundler**
        
          - \!\! The password it wants is your laptop password

## Arrays

  - Negative indices:
    
      - To get last array element, use negative index: \[-1\]
    
      - The second-to-last element has index -2, and so on.

## Strings

  - **gsub**: Find and replace

## String interpolation 

  - Do it like this: **"search/\#{type}”,** where **type** is a variable

  - It doesn’t seem to work in a Ruby script run via knife exec -
    instead, you can do this:
    
      - This: **query="fqdn:"+ARGV\[2\]**

  - See below for how to do string interpolation with symbols

## Testing

  - Useful links I found:
    
      - Overview:
        [<span class="underline">https://en.wikibooks.org/wiki/Ruby\_Programming/Unit\_testing</span>](https://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing)
    
      - Running a single test:
        [<span class="underline">https://stackoverflow.com/questions/1506780/how-to-run-a-single-test-from-a-rails-test-suite/38079221</span>](https://stackoverflow.com/questions/1506780/how-to-run-a-single-test-from-a-rails-test-suite/38079221)
        
          - I didn’t manage to get this working, but that was probably
            something to do with how my ruby gems were installed -
            something to do with bundles and vendor and stuff
    
      - Mocking in Ruby:
        [<span class="underline">https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest</span>](https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest)
        
          - Mocking stuff that is in a module instead of a class:
            [<span class="underline">https://github.com/btakita/rr/issues/98</span>](https://github.com/btakita/rr/issues/98)
    
      - Calling javascript code from Ruby:
        [<span class="underline">https://github.com/sstephenson/execjs</span>](https://github.com/sstephenson/execjs)

      - Using Rspec for Testing: [Intro to Rspec](https://www.rubyguides.com/2018/07/rspec-tutorial/)

## Symbols

  - Symbols are things that look like this **:symbol**
    
      - The closest thing in C\# is an enum
    
      - The symbol itself is the value - they are not variables and you
        don’t assign to them
    
      - Symbols do hold strings of characters, they are just immutable
    
      - This means that when you reference a symbol in string
        interpolation, what is printed out will be the name of the
        symbol
    
      - So **\#{:node}** will give **node** as the output

  - A variable that has a string as its value will be mutable, but a
    symbol is immutable, and stored in a single place in memory





