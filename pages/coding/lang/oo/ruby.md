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
- [Ruby version stuff](https://clare-wiki.herokuapp.com/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#ruby-version-stuff)

## Tutorials

- [TDD and OOP and Ruby from Sandi Metz](https://www.sandimetz.com/99bottles/sample)
- [Learn TDD in Ruby](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)
- [Getting started wiuth Ruby on Rails](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)

## Miscellaenous

  - [Ruby cheatsheet](https://github.com/ThibaultJanBeyer/cheatsheets/blob/master/Ruby-Cheatsheet.md)
  - Symbols do hold strings of characters, they are just immutable
    
      - This means that when you reference a symbol in string
        interpolation, what is printed out will be the name of the
        symbol
    
      - So **\#{:node}** will give **node** as the output

  - A variable that has a string as its value will be mutable, but a
    symbol is immutable, and stored in a single place in memory

  - Return values in Ruby functions are the last thing that was assigned
    - the **return** statement is often not used

  - IRB is the standard Ruby repl (run `irb` on command line, then type `exit` to leave)

  - The **puts** statement is how you can output to console - useful for
    quick-and-dirty debug logging.
    
      - If you want to get the output from something in a Ruby script
        onto the command line and into a pipe: Use the **puts** keyword
        in the Ruby script
    
      - If Chef, you can use **knife exec** and then pipe the output to
        other commands
    
      - Otherwise just run the script with the script name, and pipe
        straight to something else
  
  - Boolean methods should be suffixed with a question mark. [More here](https://medium.com/@sologoubalex/boolean-methods-in-ruby-94a2e907e5ea). However this is a convention and is not enforced. It's possible to write a function suffixed with a question mark that doesn't return a bool. In fact it's really used to indicate that the function is asking a question - the answer might not be a bool in practice. [More here](https://stackoverflow.com/questions/23209391/are-there-any-exceptions-to-ruby-convention-of-boolean-methods-having-a-question).

  - Methods that end in `!` indicate that the method will modify the object it's called on. Ruby calls these "dangerous methods" because they change state that someone else might have a reference to.

  - Require, gems, loading file:
    [<span class="underline">https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0</span>](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0)
    
- If you get the error “cannot load such file” you need to check
  your load path by running **irb** on command line and then
  typing **$LOAD\_PATH**

  - If you get “cannot load such file -- bundler/setup (LoadError)” then
    you might need to run **bundle install** or vendor install or both
    
      - If you get “command not found: bundle” then you might need to
        install Bundler: **sudo gem install bundler**
        
          - \!\! The password it wants is your laptop password

  - Calling javascript code from Ruby:
    [<span class="underline">https://github.com/sstephenson/execjs</span>](https://github.com/sstephenson/execjs)
  
  - [Static methods and the `self` keyword](https://airbrake.io/blog/ruby/self-ruby-overview)
  - Debugging Ruby [with breakpoints in VS Code](https://stackify.com/ruby-debugger-using-visual-studio-code/)

## Hashes

- when hashes have string keys, [those strings are frozen](https://tenderlovemaking.com/2015/02/11/weird-stuff-with-hashes.html)
- Ruby [documentation on hashes](https://docs.ruby-lang.org/en/2.0.0/Hash.html) (it's pretty good documentation)

## Frozen values

- [Frozen strings](https://freelancing-gods.com/2017/07/27/an-introduction-to-frozen-string-literals.html#:~:text=The%20term%20'frozen'%20is%20Ruby's,an%20exception%20will%20be%20raised.)

## Arrays

  - Negative indices:
    
      - To get last array element, use negative index: \[-1\]
    
      - The second-to-last element has index -2, and so on.

## Strings

  - **gsub**: Find and replace

## String interpolation 

  - Do it like this: **"search/\#{type}”,** where **type** is a variable
    - !! It only works in double quotes!
    - In fact it's not recommended to use ' in ruby. Use " instead.

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

### Rspec

- Using Rspec for Testing: [Intro to Rspec](https://www.rubyguides.com/2018/07/rspec-tutorial/)

- [Getting started with Ruby and TDD (using rspec)](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)

- [Rspec style guide](https://rspec.rubystyle.guide/)

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





