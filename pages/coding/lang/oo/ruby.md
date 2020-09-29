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
- [Bowling kata](https://github.com/claresudbery/bowling-kata-ruby) - bowling kata implemented in Ruby
- [bowling kata as a Ruby gem](https://github.com/claresudbery/csud-bowl-kata) (`csud-bowl-kata`) - bowling kata designed to be released as a Ruby gem (might not actually be on RubyGems.org yet)
- [tic-tac-toe kata](https://github.com/claresudbery/tic-tac-toe-kata) - tic-tac-toe kata implemented in Ruby
- [wordwrap kata](https://github.com/claresudbery/wordwrap-kata-ruby) - wordwrap kata implemented in Ruby
- [Sample gov uk front end rails app from Csaba](https://github.com/C-gyorfi/govuk-front-end-rails-app)
- See [Sinatra](#sinatra) below for various Sinatra repos.

## Tutorials and Guides

- [Ruby cheatsheet](https://github.com/ThibaultJanBeyer/cheatsheets/blob/master/Ruby-Cheatsheet.md)
- [Learn Enough Ruby to be Dangerous](https://www.learnenough.com/course/ruby/hello_world?start_course=true)
- [TDD and OOP and Ruby from Sandi Metz](https://www.sandimetz.com/99bottles/sample)
- [Learn TDD in Ruby](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)
- [Getting started with Ruby on Rails](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)
- [Gem Packaging Tutorial](https://learn.madetech.com/guides/06-Gem-Packaging/)
- [Your first Sinatra app](http://webapps-for-beginners.rubymonstas.org/sinatra/hello_world.html)
- [Writing a command-line application in Ruby](https://flatironschool.com/blog/building-your-first-command-line-application-in-ruby)
  - More detailed [documentation for `OptionParser`](https://ruby-doc.org/stdlib-2.6.3/libdoc/optparse/rdoc/OptionParser.html#class-OptionParser-label-Minimal+example)
- Tons of Ruby-related stuff in the [Jekyll Troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting) on this site.
- [Ruby version stuff](https://clare-wiki.herokuapp.com/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#ruby-version-stuff) - my notes (written frequently in a state of confusion - quite chaotic)

## Sinatra

- [Your first Sinatra app](http://webapps-for-beginners.rubymonstas.org/sinatra/hello_world.html)
- [Skeleton Sinatra app](https://github.com/claresudbery/sinatra-skeleton-app)
- [This commit](https://github.com/claresudbery/tic-tac-toe-kata/tree/a83d917993009f065caba0a3f74b7a2fb6a0d254) on the tic tac toe repo is a simple hello world Sinatra app.
- [Very simple Sinatra testing guide](http://sinatrarb.com/testing.html) - less friction than the one below.
- [Sample Sinatra app from rubymonsters/testing-for-beginners](https://github.com/rubymonsters/testing-for-beginners/tree/main/code/sinatra)
  - For a tutorial that uses this repo to demo testing, see [here](http://testing-for-beginners.rubymonstas.org/rack_test/sinatra.html).
  - I got a bundler version error when I tried to run it using `rackup -I .` - notes [here](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#bundler-version-error) on how I fixed it.
- [Handy Sinatra documentation](http://sinatrarb.com/intro.html)

## Debugging

### Debugging on command line

- [Pry and various other tools described briefly here](https://stackify.com/ruby-debugger-using-visual-studio-code/) 

### Debugging in VS Code using Ruby extension and ruby-debug-ide

- [Another article on the same thing](https://stackify.com/ruby-debugger-using-visual-studio-code/) (scroll down to where it talks about VS Code)
- Original article here Debugging Ruby [with breakpoints in VS Code](https://stackify.com/ruby-debugger-using-visual-studio-code/)
  - !! Note that when it says to add a launch.json and "open the debugging tab", you need to [follow the instructions here](/pages/coding/tools/Visual-Studio-Code#debugging) (I suspect the UI has changed a little since that article was written)
  - Then when you are told to add a configuration, you need to select Ruby and then select `Listen for rdebug-ide`. This will have the effect of adding a new entry into the `"configurations"` section of your `launch.json` that looks something like this: 

```
      {
          "name": "Listen for rdebug-ide",
          "type": "Ruby",
          "request": "attach",
          "remoteHost": "127.0.0.1",
          "remotePort": "1234",
          "remoteWorkspaceRoot": "${workspaceRoot}"
      } 
```

  - Note that you can do the same for Rspec by selecting Add configuration and adding in configs for `"RSpec - active spec file only"` and `"RSpec - all"`
  - Also note that if you get any errors, you might have to restart the debug server with `rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 /path/to/file.rb`
  - I got an `ECONNREFUSED` error on Windows but I think this was either because I hadn't restarted all instances of VS Code or because I was passing the wrong file name to the `rdebug-ide` command
  - I also had another problem that I started debugging and it seemed like ith hung, but this was because I was running code that was asking for command line input, which I wasn't providing.
  - I haven't managed to work out how to pass command line arguments to code that you're debugging.
- Other useful links:
  - [VS Code Debugging]()

### Debugging in VS Code using ruby-debug extension

- [Article here](https://blog.rmcd.io/blog/debugging-ruby-locally)
- I didn't get this working on Windows or Mac, but didn't spend so long in Mac

## Gems, packaging, versioning

- [Gem Packaging Tutorial](https://learn.madetech.com/guides/06-Gem-Packaging/)
- [bowling kata as a Ruby gem](https://github.com/claresudbery/csud-bowl-kata) (`csud-bowl-kata`) - bowling kata designed to be released as a Ruby gem (might not actually be on RubyGems.org yet)
- Require, gems, loading files: 
  [Understanding ruby load, require, gems, bundler and rails autoloading from the bottom up](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0)
- [Ruby version stuff](https://clare-wiki.herokuapp.com/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#ruby-version-stuff) - my notes (written frequently in a state of confusion - quite chaotic)
 
- If you get the error “cannot load such file” you need to check
  your load path by running **irb** on command line and then
  typing **$LOAD\_PATH**

  - If you get “cannot load such file -- bundler/setup (LoadError)” then
    you might need to run **bundle install** or vendor install or both
    
      - If you get “command not found: bundle” then you might need to
        install Bundler: **sudo gem install bundler**
        
          - \!\! The password it wants is your laptop password

## Testing

- Overview of unit testing:
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

- [Rspec stubs](https://www.tutorialspoint.com/rspec/rspec_stubs.htm#:~:text=In%20RSpec%2C%20a%20stub%20is,doesn't%20even%20exist%20yet.&text=In%20our%20example%2C%20the%20allow,to%20test%20the%20ClassRoom%20class.) 

### Rspec

- Using Rspec for Testing: [Intro to Rspec](https://www.rubyguides.com/2018/07/rspec-tutorial/)

- [Getting started with Ruby and TDD (using rspec)](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)

- [Rspec style guide](https://rspec.rubystyle.guide/)

- [All the different types of rspec expect statements](https://relishapp.com/rspec/rspec-expectations/v/3-8/docs/built-in-matchers/include-matcher)

## Language Features

### Misc Language Stuff

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

- Calling javascript code from Ruby:
  [<span class="underline">https://github.com/sstephenson/execjs</span>](https://github.com/sstephenson/execjs)

- [Static methods and the `self` keyword](https://airbrake.io/blog/ruby/self-ruby-overview)

- **yield keyword**: `yield` is a keyword in Ruby that calls a block that was given to a method. Whenever you pass a block to a method (such as each, collect, select, and so on) this method can then call the block by using the keyword yield. So, in a `Sinatra` layout template, <%= yield %> marks the place where the other template (the one that is being wrapped) is supposed to be inserted. Example [here](https://github.com/claresudbery/sinatra-skeleton-app/blob/bb21e6dfa271f135b620876b9a21344edf7a6eab/monstas.rb#L31).

- Frozen values: [Frozen strings](https://freelancing-gods.com/2017/07/27/an-introduction-to-frozen-string-literals.html#:~:text=The%20term%20'frozen'%20is%20Ruby's,an%20exception%20will%20be%20raised.)

- Calling javascript code from Ruby:
  [<span class="underline">https://github.com/sstephenson/execjs</span>](https://github.com/sstephenson/execjs)

### Collections

#### Hashes

- when hashes have string keys, [those strings are frozen](https://tenderlovemaking.com/2015/02/11/weird-stuff-with-hashes.html)
- Ruby [documentation on hashes](https://docs.ruby-lang.org/en/2.0.0/Hash.html) (it's pretty good documentation)

#### Arrays

- Negative indices:
  
    - To get last array element, use negative index: \[-1\]
  
    - The second-to-last element has index -2, and so on.

### Strings

- **gsub**: Find and replace
- [Frozen strings](https://freelancing-gods.com/2017/07/27/an-introduction-to-frozen-string-literals.html#:~:text=The%20term%20'frozen'%20is%20Ruby's,an%20exception%20will%20be%20raised.)

- **String interpolation**. Do it like this: **"search/\#{type}”,** where **type** is a variable
  - !! It only works in double quotes!
  - In fact it's not recommended to use ' in ruby. Use " instead.
  - It doesn’t seem to work in a Ruby script run via knife exec -
  instead, you can do this:
    - This: **query="fqdn:"+ARGV\[2\]**
  - See below for how to do string interpolation with symbols

### Symbols

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

### Command Line Input

- you can use `gets` and `puts` [like this](https://ruby-doc.org/docs/ruby-doc-bundle/Tutorial/part_02/user_input.html) (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_interact.rb))
- or you can use `$stdin` - see [article here](https://www.honeybadger.io/blog/writing-command-line-apps-in-ruby/)
- both `gets` and `$stdin` can be used to pipe input directly from other sources (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_cli.rb)) (more [here](http://zetcode.com/lang/rubytutorial/io/#:~:text=The%20%24stdin%20is%20a%20global,read%20input%20from%20the%20console.&text=In%20the%20above%20code%2C%20we,read%20input%20from%20the%20console.&text=The%20read%20method%20reads%20data,the%20end%20of%20the%20file.))
- or you can create a CLI and pass data in via command line parameters [like this using `OptionParser`](https://flatironschool.com/blog/building-your-first-command-line-application-in-ruby) (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_cli.rb)) (More detailed [documentation for `OptionParser`](https://ruby-doc.org/stdlib-2.6.3/libdoc/optparse/rdoc/OptionParser.html#class-OptionParser-label-Minimal+example))
- be aware that sometimes your input is requested before your output is output - you fix that by using `$stdout.sync = true` (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_interact.rb)) (more [here](https://stackoverflow.com/questions/61333685/ruby-issue-my-gets-function-executes-before-my-puts-statement).)

## Questions

- If RSpec is a Gem, why is it never required in your spec files? How do they get the code they need? And what does the `--` mean in front of `require spec_helper` in the `.rspec` file?


