---
layout: page
location: "pages/coding/lang/oo/ruby/leaf"
permalink: /pages/coding/lang/oo/ruby/Ruby
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
- [Mars Rover kata](https://github.com/claresudbery/mars-rover-kata-ruby)
- [Academy mob code base](https://github.com/madetech/academy_2020_mob)
- My [Cards Against Humanity answer generator](https://github.com/claresudbery/cah-answer-generator) was written in Sinatra and Ruby.
- [Sample gov uk front end rails app from Csaba](https://github.com/C-gyorfi/govuk-front-end-rails-app)
- [Learn Enough Ruby](https://github.com/claresudbery/learn_enough_ruby) - My code following along with examples in the book.
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
- [Skeleton Sinatra app](https://github.com/claresudbery/sinatra-skeleton-app) created using [this tutorial]
(http://webapps-for-beginners.rubymonstas.org/sinatra/hello_world.html)
- [This commit](https://github.com/claresudbery/tic-tac-toe-kata/tree/a83d917993009f065caba0a3f74b7a2fb6a0d254) on the tic tac toe repo is a much simpler hello world Sinatra app, with just one `/` root route and no data storage.
- [Very simple Sinatra testing guide](http://sinatrarb.com/testing.html) - less friction than the one below.
- [Sample Sinatra app from rubymonsters/testing-for-beginners](https://github.com/rubymonsters/testing-for-beginners/tree/main/code/sinatra)
  - For a tutorial that uses this repo to demo testing, see [here](http://testing-for-beginners.rubymonstas.org/rack_test/sinatra.html).
  - I got a bundler version error when I tried to run it using `rackup -I .` - notes [here](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#bundler-version-error) on how I fixed it.
- [Handy Sinatra documentation](http://sinatrarb.com/intro.html)
- [Dockerising a Sinatra app](https://www.codewithjason.com/dockerize-sinatra-application/)
  - [Deploying a Docker container to Heroku](https://devcenter.heroku.com/articles/container-registry-and-runtime)
  - See [my sinatra-docker repo](https://github.com/claresudbery/sinatra-docker) for an example created following the above two tutorials. It's deployed on Heroku [here](https://sinatra-docker.herokuapp.com/).
  - See [my tic-tac-toe repo](https://github.com/claresudbery/tic-tac-toe-kata) for another example of a Dockerised Sinatra app. It's deployed on Heroku [here](https://tic-tac-toe-docker.herokuapp.com/tictactoe).
  - Views are held in *.erb template files (same is true of Rails) - `erb` stands for embedded ruby

## Deployment with Heroku

- [Deploying ruby using heroku](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#deploying-ruby-using-heroku)
- [Ruby version problems when deploying with Heroku](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#ruby-version-problems-when-deploying-with-heroku)

## Debugging

### Debugging on command line

- [Pry and various other tools described briefly here](https://stackify.com/ruby-debugger-using-visual-studio-code/) 

### Debugging in VS Code using Ruby extension and ruby-debug-ide

#### Step by step guide to get started

- First, on the command line:
- `sudo gem install debase`
- `gem install ruby-debug-ide`
- Now, in the same folder:
- `rdebug-ide app.rb` (If necessary, replace `app.rb` with the appropriate path and file name to start up the code you want to debug).
- Open up VS Code.
- Click the Play button with a bug icon over on the left, then click "Create a launch.son file" (if you don't already have one):
![Run Debug button](/resources/images/VS-code-run-debug.png)
- When it asks you to Select Environment, select Ruby.
- Select "Listen for rdebug-ide".
- Set a breakpoint in one of your files, eg in your default '/' route in app.rb for a Sinatra web app.
- Click the green run triangle next to the dropdown top left.
- If what you're running is a webapp, visit the app in the browser (eg http://localhost:4567 for a Sinatra app where you put your breakpoint in the '/' route).
- You should now hit your breakpoint.

#### Once you're up and running - an example

- I currently have this working in my [bowling-kata-ruby repo](https://github.com/claresudbery/bowling-kata-ruby): 
  - Checkout [this commit](https://github.com/claresudbery/bowling-kata-ruby/commit/91d4c5c7021a95c07c7247950d9f55c0f85cdf8b) 
  - Run `rdebug-ide src/bowling_cli.rb` on the command line
  - Select "Listen for rdebug-ide" in the dropdown top left
  - Set a breakpoint, for instance in `bowling_cli.rb`
  - Click the green run triangle next to the dropdown top left

#### Debugging rspec tests

- If you want to debug Rspec tests, follow the guide above, then when click the Run Debug button, select Add configuration from the dropdown and add configs for `"RSpec - active spec file only"` and `"RSpec - all"`

#### More info

- Original article here: [Debugging Ruby with breakpoints in VS Code](https://stackify.com/ruby-debugger-using-visual-studio-code/) (scroll down to where it talks about VS Code)
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
  - I also had another problem that I started debugging and it seemed like it hung, but this was because I was running code that was asking for command line input, which I wasn't providing.
  - I haven't managed to work out how to pass command line arguments to code that you're debugging.

### Debugging in VS Code using ruby-debug extension

- [Article here](https://blog.rmcd.io/blog/debugging-ruby-locally)
- I didn't get this working on Windows or Mac, but didn't spend so long on Mac.

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

- For Rspec [see below](#rspec)
- Overview of unit testing using Test::Unit:
  [<span class="underline">https://en.wikibooks.org/wiki/Ruby\_Programming/Unit\_testing</span>](https://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing)
- Running a single test in Rails:
  [<span class="underline">https://stackoverflow.com/questions/1506780/how-to-run-a-single-test-from-a-rails-test-suite/38079221</span>](https://stackoverflow.com/questions/1506780/how-to-run-a-single-test-from-a-rails-test-suite/38079221)  
    - I didn’t manage to get this working, but that was probably
      something to do with how my ruby gems were installed -
      something to do with bundles and vendor and stuff
- Mocking in Ruby using Minitest:
  [<span class="underline">https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest</span>](https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest)  
- Mocking stuff that is in a module instead of a class, using RR:
      [<span class="underline">https://github.com/btakita/rr/issues/98</span>](https://github.com/btakita/rr/issues/98)

### Rspec

- Using Rspec for Testing: [Intro to Rspec](https://www.rubyguides.com/2018/07/rspec-tutorial/)
- [Getting started with Ruby and TDD (using rspec)](https://medium.com/@micosmin/learn-tdd-in-ruby-in-5-easy-steps-3ab28014fec4)
- [Rspec style guide](https://rspec.rubystyle.guide/)
- [All the different types of rspec expect statements](https://relishapp.com/rspec/rspec-expectations/v/3-8/docs/built-in-matchers/include-matcher)
- [Rspec mocking (stubs and doubles)](https://www.tutorialspoint.com/rspec/rspec_test_doubles.htm) 
- Using rspec to do front end testing on html and css (has loads of useful examples in the readme): [rspec-html-matchers](https://github.com/kucaahbe/rspec-html-matchers). DON'T FORGET TO ADD the following to `spec_helper.rb`:

```ruby
require "rspec-html-matchers"

RSpec.configure do |config|
  config.include RSpecHtmlMatchers
```

#### Test cases in rspec

You can handle test cases in rspec in the way shown below - and there are more examples [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/23b24cf36e2e1be443f1d35bc9e40443564cf814/spec/wordwrap_spec.rb). Below we use a `hash` to map inputs ("rolls") to outputs "scores", and then use an `each` statement to loop through the list of elements in the hash.

```
expected_scores_with_a_strike_in_the_tenth_frame = {
        "44 44 44 44 44 44 44 44 44 X 32" => (9*8) + (10+3+2),
        "44 44 44 44 44 44 44 44 44 X X-" => (9*8) + (10+10+0),
        "44 44 44 44 44 44 44 44 44 X -X" => (9*8) + (10+0+10),
        "44 44 44 44 44 44 44 44 44 X XX" => (9*8) + (10+10+10),
        "44 44 44 44 44 44 44 44 44 X 46" => (9*8) + (10+4+6),
        "44 44 44 44 44 44 44 44 44 X 6-" => (9*8) + (10+6+0),
        "44 44 44 44 44 44 44 44 44 X -3" => (9*8) + (10+0+3),
        "44 44 44 44 44 44 44 44 44 X --" => (9*8) + (10+0+0),
        "44 44 44 44 44 44 44 44 44 X 2-" => (9*8) + (10+2+0),
        "44 44 44 44 44 44 44 44 44 X -5" => (9*8) + (10+0+5)
    }

    expected_scores_with_a_strike_in_the_tenth_frame.each do |rolls, score|
        it "adds the final two rolls to the score twice, when a strike is rolled in the final frame: '#{rolls}'" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end
```

#### Testing command-line inputs and outputs (stdin, stdout, stderr)

You can stub command-line inputs using standard rspec stubbing functionality and the fact that `gets` and `puts` are functions inherited from `Object` by all classes. Note that you can also mimic several repeated inputs by giving a comma-separated list:

```ruby
allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, "f", "r", "f", "f", "l", "b", "") 
```

You can test whether what you expected got sent to `stdout` or `stderr` using the `to output` functionality:

```ruby
expect{@mars_rover_app.start}.to output(a_string_ending_with(MarsRoverApp::BAD_INPUT_ERROR)).to_stdout
```

Note that you can use matchers such as `a_string_ending_with`, `a_string_starting_with`, and `a_string_including` so that you are only checking a subset of the output rather than everything that has been sent to `stdout`. [More matchers listed here](https://gist.github.com/JunichiIto/f603d3fbfcf99b914f86).

More examples of `stdin` and `stdout` testing in [this file here](https://github.com/madetech/academy_2020_mob/blob/3fb53826252525a52550fdbdb40337da211870e2/mars-rover/spec/marsroverapp_spec.rb).

## Language Features

### Misc Language Stuff

- Return values in Ruby functions are the last thing that was assigned
  - the **return** statement is often not used

- IRB is the standard Ruby repl (run `irb` on command line)
  - If you run it using `irb -rpp`, you'll get pretty-printing (passing `-r` to `irb` will automatically require a library when irb is loaded - in this case the `pretty_print` library).
  - Enter `exit` to leave)
  - Enter `load './myfile.rb'` to load a Ruby file called `myfile.rb` in the current folder (`./`)
    - To reload, just enter `load './myfile.rb'` again.

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

- Frozen values: [Frozen strings](https://freelancing-gods.com/2017/07/27/an-introduction-to-frozen-string-literals.html#:~:text=The%20term%20'frozen'%20is%20Ruby's,an%20exception%20will%20be%20raised.)

- Calling javascript code from Ruby:
  [<span class="underline">https://github.com/sstephenson/execjs</span>](https://github.com/sstephenson/execjs)

- **Calling an API or a url** - notes summarised from [here](learn.co/lessons/sinatra-using-apis)
  - You'll need to require `json` and `net/http`. The `Net::HTTP` Ruby library will give you some methods to help you send an HTTP request and the `JSON` library will help you to parse any JSON data that comes back
  - Use the following code to make a request to an API and parse the JSON that is returned. Note that `endpoint` will contain the url of the API, as a string:  

```ruby
uri = URI.parse(URI.encode(endpoint))
api_response = Net::HTTP.get(uri)
JSON.parse(api_response)
```

- **HEREDOC**
  - You can use `HEREDOC` for multi-line string literals, instead of concatenating individual lines.
  - Instead of this...

```ruby
            populated_grid = 
            "-------------\n" +
            "|     | 360 |\n" +
            "|     | ^^^ |\n" +
            "|     | TST |\n" +
            "-------------\n"
```

  - ... you can do this:

```ruby
            populated_grid = 
            <<~HEREDOC
            -------------
            |     | 360 |
            |     | ^^^ |
            |     | TST |
            -------------
            HEREDOC
```

### Blocks / anonymous functions, and the yield keyword

- **Blocks** of code, aka `anonymous` or `unnamed functions`
  - `{ |i| puts 2**i }` is equivalent to `do |i| puts 2**i end`
  - ie `do` and `end` take the place of the opening and closing braces in defining a block of code.
  - Therefore `(1..5).each { |i| puts 2**i }` is equivalent to    
  
```ruby
(1..5).each do |i|
   puts 2**i
end
```
  - What we're seeing in this example is that `each` is a method that takes a `block` of code as a parameter.
  - What's not quite so obvious is that in this case, the block of code is an anonymous function that *takes a parameter*. The parameter is named `i` and is indicated by surrounding it with pipes: `|i|`
  - See `yield` below for more on blocks, and blocks that take parameters.  

- **yield keyword**: `yield` is a keyword in Ruby that calls a block that was given to a method. 
  - Whenever you pass a block to a method (such as `each`, `collect`, `select`, and so on) this method can then call the block by using the keyword yield. 
  - There are a couple of examples of its usage in my Mars Rover app code base, including [this one](https://github.com/claresudbery/mars-rover-kata-ruby/blob/bc07ff1a93e9fcae32281277e503c101c3cf21d3/webapp.rb#L37). 
    - I did previously have a [nested yield here](https://github.com/claresudbery/mars-rover-kata-ruby/blob/9cdc6c3b24d3e15c95389d071cce52fbf27bbe36/webapp.rb#L36) (the `handle_exceptions` method uses `yield` to forward a block to `AppHelper.handle_mars_rover_exceptions`, which also uses `yield`), but I [refactored it out here](https://github.com/claresudbery/mars-rover-kata-ruby/commit/52baf271c2ed2859fe596861dbb0abaddd50461b) because it represented unnecessary complexity. 
  - So, in a `Sinatra` layout template, <%= yield %> marks the place where the other template (the one that is being wrapped) is supposed to be inserted. Example [here](https://github.com/claresudbery/sinatra-skeleton-app/blob/bb21e6dfa271f135b620876b9a21344edf7a6eab/monstas.rb#L31).
  - Every Ruby method can take a `block` as a parameter
    - We can invoke that block using the `yield` keyword. 
      - The block won't get evaluated until the `yield` keyword appears.
    - So, in the following example, although we don't explicitly declare that the `sandwich` function takes a `block` as a parameter, we see that it *can* because of its use of the `yield` keyword. First we define the `sandwich` function and then we call it and pass a `do .. end` block to it. The output is also shown.  

```ruby
# blocks.rb
def sandwich
    puts "top bread"
    yield
    puts "bottom bread"
end

sandwich do
    puts "mutton, lettuce, and tomato"
end
```
![ruby yield](/resources/images/ruby_yield.png)

- So what about yielding a block with a parameter? Remember we can define a block with a param like this:

```ruby
do |markup|
  puts markup
end
```

- The code above defines a block that takes a parameter called `markup`, then just outputs that markup to the command line.
- So let's define a function that can take that block of code as a parameter and then call it using `yield`:

```ruby
def tag(tagname, text)
  html = "<#{tagname}>#{text}</#{tagname}>"
  yield html
end
```

- The above code takes a tagname and text and uses string interpolation to turn it into a chunk of html. Then the statement `yield html` is saying "Call the block of code that has been passed in, and pass `html` to it as an argument."
- So finally we can call the `tag` function and pass in our original block of code so that the `tag` function can * call* our original block:

```ruby
tag("p", "Lorem ipsum dolor sit amet") do |markup|
  puts markup
end
```

- The result of the above call to `tag` will be the following being output to the command line: 
  - gcam "`<p>Lorem ipsum dolor sit amet</p>`

### Collections

#### Hashes

- Also known as *associative arrays*.
- Some examples of hashes:  
```
my_hash = Hash.new
my_hash["one"] = "First element"
my_hash2 = {}
my_hash2[:one] = "First element"
my_hash3 = { "first_name" => "Pippi", "last_name" => "Longstocking" }
my_hash4 = { :first_name => "Pippi", :last_name => "Longstocking" }
# this is equivalent to the above:
my_hash4 = { first_name: "Pippi", last_name: "Longstocking" }
```
- `:name` is a **symbol** (see [below](#symbols))
- The `=>` operator is called a "hashrocket".
- when hashes have string keys, [those strings are frozen](https://tenderlovemaking.com/2015/02/11/weird-stuff-with-hashes.html)
- Ruby [documentation on hashes](https://docs.ruby-lang.org/en/2.0.0/Hash.html) (it's pretty good documentation)
- [Using an array as a key in your hash](https://softwareengineering.stackexchange.com/questions/197982/why-would-you-want-to-use-an-array-or-hash-as-hash-key-in-ruby)
  - we thought about creating an example in our wordwrap academy kata, but instead we used a [nested hash as a key](https://github.com/madetech/academy_2020_mob/commit/2a4d40ea0401d01a8b88d57f202289138ff9fa63)

#### Arrays

- Negative indices:  
    - To get last array element, use negative index: \[-1\]  
    - The second-to-last element has index -2, and so on.
- Square brackets are `built-in constructors`, but you can also use the `new` keyword if you want: `a = Array.new` is equivalent to `a = []`
- Adding elements to arrays can be done in two ways:
  - `a[0] = "A"`
  - `a << "A"`

### Strings

- **gsub**: Find and replace
- [Frozen strings](https://freelancing-gods.com/2017/07/27/an-introduction-to-frozen-string-literals.html#:~:text=The%20term%20'frozen'%20is%20Ruby's,an%20exception%20will%20be%20raised.)
- **String interpolation**. Do it like this: **"search/\#{type}”,** where **type** is a variable
  - !! It only works in double quotes!
  - In fact it's not recommended to use ' in ruby. Use " instead.
  - It doesn’t seem to work in a Ruby script run via knife exec -
  instead, you can do this:
    - This: **query="fqdn:"+ARGV\[2\]**
  - See [below](#symbols) for how to do string interpolation with symbols
- **Single-quoted strings**
  - Single-quoted strings are literal strings. You can't do interpolation with them but you can include special characters without having to escape them - so they can be useful for that. [More here](https://blog.appsignal.com/2016/12/21/ruby-magic-escaping-in-ruby.html).
- `?h` is the same as `"h"`
- Double and single quotes are `built-in constructors`, but you can also use the `new` keyword if you want: `s = String.new("A man, a plan, a canal—Panama!")`

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

### Dates and Times

- `Time` is a built-in class
  - you have to use `require 'time'`
- `now = Time.new` will give you the current time
  - `now = Time.now` is equivalent
- or you can initialise: `moon_landing = Time.new(1969, 7, 20, 20, 17, 40)` (= 1969-07-20 20:17:40)
- By default, Time uses the local time zone, but this introduces weird location-dependence to the operations, so it's a good practice to use UTC instead: `moon_landing = Time.utc(1969, 7, 20, 20, 17, 40)`
- Other useful `Time` methods:
  - `now.year` (= 2020)
  - `now.month` (= 12)
  - `now.day` (= 31)
  - `now.hour` (= 19)
  - `now = Time.now.utc` ()
  - `now.wday` (= 0 for Sunday)
  - `Date::DAYNAMES[Time.now.wday]` (= SUNDAY)
    - you have to use `require 'date'` 
  - `Date.parse("10/10/2010")`
  - `Date.parse("September 3")`
    - More on date parsing [here](https://www.rubyguides.com/2015/12/ruby-time/)

### Functions

- Functions are not attached to objects

### Methods

- Methods are functions attached to objects
- This notation - `String#include?` indicates a method called `include?` which is a `String` instance method.

### Methods and functions

- You don't need brackets when passing arguments to methods and functions (they're optional) - you can use spaces instead.

### Command Line Input

- you can use `gets` and `puts` [like this](https://ruby-doc.org/docs/ruby-doc-bundle/Tutorial/part_02/user_input.html) (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_interact.rb))
- or you can use `$stdin` - see [article here](https://www.honeybadger.io/blog/writing-command-line-apps-in-ruby/)
- both `gets` and `$stdin` can be used to pipe input directly from other sources (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_cli.rb)) (more [here](http://zetcode.com/lang/rubytutorial/io/#:~:text=The%20%24stdin%20is%20a%20global,read%20input%20from%20the%20console.&text=In%20the%20above%20code%2C%20we,read%20input%20from%20the%20console.&text=The%20read%20method%20reads%20data,the%20end%20of%20the%20file.))
- or you can create a CLI and pass data in via command line parameters [like this using `OptionParser`](https://flatironschool.com/blog/building-your-first-command-line-application-in-ruby) (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_cli.rb)) (More detailed [documentation for `OptionParser`](https://ruby-doc.org/stdlib-2.6.3/libdoc/optparse/rdoc/OptionParser.html#class-OptionParser-label-Minimal+example))
- be aware that sometimes your input is requested before your output is output - you fix that by using `$stdout.sync = true` (example [here](https://github.com/claresudbery/wordwrap-kata-ruby/blob/7a6b3b430f82ddc1824aed66afc4a37981d5c498/src/wordwrap_interact.rb)) (more [here](https://stackoverflow.com/questions/61333685/ruby-issue-my-gets-function-executes-before-my-puts-statement).)

### Inheritance

- [great article here](http://rubylearning.com/satishtalim/ruby_inheritance.html) on inheritance in Ruby - includes an explanation of why instance variables are not defined by classes and are therefore also not inherited by subclasses. 

### Division and other Maths

- By default, the `/` operator does integer division - so 2/3 = 0
  - If you want floating point division, add `.0` to one of your integers: `2/3.0`
- To get "to the power of", use `**` instead of `^`
  - `2**3 = 8`
- More complex Maths operations are available via the [`Math` module](https://ruby-doc.org/core-2.5.0/Math.html)
  - `Math.log10(10)` means "10 to the power *what* equals 10?" and the answer is "1".
  - `Maths.log(10)` is used for `ln` or the natural logarithm (log to the base e) 
  - `Math::E` is used for `e`
  - `Math::PI` is `pi` and is an example of a module constant
  - Also available:
    - `Math.sqrt(4)` (answer = 2)
    - `Math.cos(2*Math::PI)` (answer = 1)

## Questions

- If RSpec is a Gem, why is it never required in your spec files? How do they get the code they need? And what does the `--` mean in front of `require spec_helper` in the `.rspec` file?


