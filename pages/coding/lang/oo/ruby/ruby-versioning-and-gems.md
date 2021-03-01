---
layout: page
location: pages/coding/lang/oo/ruby/leaf
permalink: /pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems
---

## Important

- Try to avoid versioning problems by keeping Ruby and all your gems up to date. See [Staying up to date](#staying-up-to-date)

## Intro

Ruby is a great language in many ways, but the one thing that mars the experience of working with Ruby is the fact that you'll often find yourself having to halt development work while you fix confusing `Gemfile` errors such as "Your Ruby version is 2.6.3, but your Gemfile specified 2.6.5" or ."Could not find gem 'bundler (~> 1.1)', which is required by gem 'middleman-core (= 3.3.7)', in any of the sources." 

I can't decide whether I should be proud or ashamed of the fact that for a long time, my reaction to these errors was to google them and then blindly follow the advice I found until things were working again. Proud, because I was focused and pragmatic - I had a goal in mind and didn't want to be distracted by the rabbithole of researching exactly what was going on. Ashamed, because I was doing the equivalent of hitting it with a hammer until it worked - rather than getting a proper understanding and therefore the ability to find long term solutions and be confident that I wouldn't find myself back in the same situation at some unpredictable point in the future.

If you look at my [Jekyll troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#ruby-version-stuff), you'll see that I was simply recording error messages and solutions, with not much idea of what was actually going on or which actions were the ones that actually fixed my problems, and not much understanding of *why* things got fixed when they did.

So today I have put aside a whole day to dive in and get to grips once and for all with what the hell is going on with my `Gemfile`.

## Useful resources

- [Bundler documentation]()
- [Learn Tech guide on gem packaging](https://learn.madetech.com/guides/06-Gem-Packaging/) (from Made Tech)
- [Internal Made Tech workshop on Ruby versioning, bundling and managing gems](https://docs.google.com/presentation/d/1sYbNtN6Frbu-cucQL8hxPlgV-eaLqPwU9FMNhNE1YEc/edit#slide=id.ga070ffb2eb_0_138) (courtesy of George Schena)
- [Brief bundler tutorial from Learn Enough Ruby on Rails](https://www.learnenough.com/ruby-on-rails-6th-edition-tutorial/beginning#sec-bundler) (Learn Enough subscription might be needed, but at the time of writing (Jan 2021) this content was free).
- Article - [Understanding ruby load, require, gems, bundler and rails autoloading from the bottom up](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0)

## Overview of versioning problems that can happen with Ruby projects

There are two possible sources of version woes when working Ruby:  

1. Problems with versions of the gems (aka packages) your Ruby project is using.  
2. Problems with the version of Ruby your project is using.  

These can sometimes be related - eg your project may depend on a particular gem that itself is dependent on a particular version of Ruby.
Generally though, the two areas are handled by different means:  

1. You can simply have gems manually installed on your system, using `gem` commands. But most Ruby projects use [`bundler`](#bundler) to manage gem versions. This leads to the use of a file called `Gemfile`, which will itself specify your Ruby version (in different ways depending on [which Ruby version management system you're using](#different-versions-of-ruby)).
2. There are [various different tools available](#different-versions-of-ruby) to manage differing versions of Ruby between projects.

## What gems are / how gems work

You can use the `gem` command to use the [`RubyGems` software](https://guides.rubygems.org/) to find and install gems on your system. First you have to have `RubyGems` installed, but Ruby 1.9 and newer ships with `RubyGems` built-in. Every time you install a gem using `gem install`, it will download the gem from rubygems.org and install it on your system. It will also download and install any dependencies that the original gem relies on, and so on for any dependencies of dependencies.

A gem is a Ruby software package. Each gem contains a packaged Ruby application or library. More concretely, it’s a zip file containing a bunch of ruby files and/or dynamic library files that can be imported by your code, along with some metadata.

You can install gems using the `gem install` command, and there are lots of other useful `gem` commands (eg `gem list` to see what's installed - more [here](https://guides.rubygems.org/rubygems-basics/)) but this on its own does not allow you to control which gems are used by which projects. That's where [bundler](#bundler) comes in.

[More on gems here](https://guides.rubygems.org/rubygems-basics/)

## Staying up to date

- See also [Different versions of Ruby](#different-versions-of-ruby)
- NB: You should aim to always keep your Ruby version at the most stable version (in Jan 2021 this is 3.0.0). 
    - To find the latest stable version, go [here](https://www.ruby-lang.org/en/downloads/). 
- For advice on how to keep ALL your dependencies (ie gems as well as Ruby itself) up to date, see [this article](https://thoughtbot.com/blog/keep-your-gems-up-to-date) - which also gives advice on how to automate the process. GitHub's dependabot will also help with this.
- ...or follow this simple approach:
    - 1. Make sure all dependabot PRs are acted on ([instructions here](#updating-from-dependabot-branches))
    - 2. Make sure dependabot security alerts are also acted upon (not the same as PRs) (they happen when PRs are not possible - see [how dependabot works](#how-dependabot-works)) ([instructions here](#acting-on-dependabot-alerts))
    - 3. Run bundle-audit weekly or monthly and act on all recommendations ([instructions here](#acting-on-security-recommendations-with-bundle-audit))
    - 4. Make sure your main technologies are up to date (for this site, that's Ruby and Jekyll)

### Acting on security recommendations with bundle audit

- Install [bundle-audit](https://github.com/rubysec/bundler-audit) (if not done already)
    - `gem install bundle-audit` (or add to `Gemfile`) 
- Run `bundle-audit` on command line
- Act on recommendations ONE AT A TIME, with a separate commit for each one and testing as you go.
    - eg if `rack` is listed as a vulnerability, run `bundle update rack`
    - or if you are advised to remove a gem altogether:
        - Search the code for all references (and remove them)
        - Then remove the gem from `Gemfile`
        - See commits bcdd478 and ccac302 for an example

### Updating from dependabot branches

- See also [How dependabot works](#how-dependabot-works)
- Actions you can take:
    - If dependabot branches are failing in Travis:
        - Check / Google error messages in Travis
		- Switch locally to the dependabot branch 
			- eg `git checkout dependabot/bundler/activesupport-5.2.4.4` 
		- Make any changes designed to fix deployment errors 
			- eg see commit 15802e3
			- this was when I'd fixed some deployment problems in the main branch but they weren't in the dependabot branch, so I copied them to the dependabot branch for experimentation
		- Push the branch to the remote, and check the build log in Travis to see if it's fixed the problems
        - IMPORTANT: Test locally. Does the site still work?
		- If all is fine, merge the dependabot branch (in GitHub.com, visit Pull Requests at the top of the repo)
			- If GitHub says there are merge conflicts:
				- Merge the main branch into the dependabot branch locally (`git merge main` or `git merge master`) and fix conflicts there before merging
        - IMPORTANT: Test the deployed site too!
        - DON'T FORGET: If you merged the PR at GitHub.com, you won't have the updated main branch locally until you run `git pull` (or `git pull --rebase`)

### Acting on dependabot alerts

- See also [How dependabot works](#how-dependabot-works)
- Dependabot alerts live on the main front page in GitHub
- or visit Security | Dependabot alerts
- They require a little more attention - see details in GitHub
- You may have to remove a gem altogether:
    - Search the code for all references (and remove them)
    - Then remove the gem from `Gemfile`
    - See commits bcdd478 and ccac302 for an example

### How dependabot works

- See also [Updating from dependabot branches](#updating-from-dependabot-branches)
- Dependabot is a free service offered by GitHub - you can enable it there
- !! It does NOT necessarily catch all critical security updates. It's worth using [bundle-audit](https://github.com/rubysec/bundler-audit) as well 
    - `gem install bundle-audit` (or add to `Gemfile`) then run `bundle-audit`
    - although be aware that dependabot creates security alerts as a separate process to its main PRs - see below
- Dependabot identifies dependency updates and creates pull requests suggesting you update your dependencies.
	- If you don't merge the pull requests, they are not merged into your code base.
	- The PRs create new branches and automatically trigger Travis deploys (or whatever CI integration you're using). This is why you sometimes get failed builds that mention dependabot - it's because Travis is trying to build the PR branch.
    - It will actually trigger TWO Travis builds I think - one for what would happen if you built the dependabot branch as-is ("branch"), and one for if you built the branch merged into the main branch ("pull request")
        - If you click through to the PR in GitHub, you'll see something like "all checks have passed"
        - Then you can click "Show all checks" and you'll see see two Travis builds - one for "branch" and one for "pull request"
        - If you click Details on the right, it will take you through to Travis
	- I think maybe every time you push new changes, the PR branch is automatically updated and Travis runs another build? Or it just keeps re-running them at regular intervals?
	- Sometimes the PRs are closed automatically - for instance if you run a bundle update yourself and your dependencies are updated, so dependabot detects that the PR is no longer needed. Or because you make changes to your `Gemfile` so that the dependency that dependabot is trying to update is no longer even a dependency of your project.
- ALERTS:
    - As well as PRs, there are also dependabot alerts
    - These happen when PRs can't be created - for instance because conflicting dependencies prevent an update to a non-vulnerable version
    - These will live on the main front page in GitHub
    - or visit Security | Dependabot alerts

## Different versions of Ruby

### Mac (OSX) and Linux

The three main Ruby version management systems for Mac OSX and Linux (including WSL on Windows, but NOT [vanilla Windows via GitBash](#windows)) are:

- [chruby](https://github.com/postmodern/chruby)
    - This is what I'm currently using, via my Ubuntu system on Windows (NOT Ubuntu 16.04 (just because Ubuntu is the one I keep up to date and has everything in `~/.bashrc`))
    - To list Ruby versions currently installed, just enter `chruby` at the command prompt.
    - To switch to a new version of Ruby do the following:
        - If the new version not already installed:
            - Cmd: `ruby-install ruby 2.6.5` 
            - Restart your shell by typing `exit` and then restarting.
        - Then run cmd `chruby ruby-2.6.5` to switch to the new version. You can also put this command into your `~/.bashrc` to effectively make that version your default, but remember to edit it when you upgrade Ruby!
    - More on chruby [here](https://daqo.medium.com/using-chruby-as-the-default-ruby-version-manager-c11346e3cc) and [here](https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/managing-ruby-versions#:~:text=Managing%20Ruby%20Versions&text=Note%3A%20This%20lesson%20goes%20into,should%20use%20Ruby%20Version%20Manager.)
- [rvm](https://rvm.io/)
- [rbenv](https://github.com/rbenv/rbenv)

[Here is a brief discussion / comparison of all three](https://stackoverflow.com/questions/22153521/what-are-the-differences-between-rbenv-rvm-and-chruby).

No matter which system you use, the file `.ruby-version` can be used to specify your Ruby version. This is then referred to in `Gemfile` like this: `ruby File.read(File.expand_path("../.ruby-version", __FILE__)).strip`

### Windows

If you're coding Ruby in Windows, you'll be using RubyInstaller. [More here](stackify.com/install-ruby-on-windows-everything-you-need-to-get-going/). But that doesn't seem to allow you to switch between Ruby versions.

The solution is to either use WSL or WSL2 to run a Linux subsystem on your Windows machine, or use something like [pik](https://hibbard.eu/how-to-manage-multiple-versions-of-ruby-on-windows/) or [URU](https://myrailslearnings.wordpress.com/2018/09/28/switching-between-ruby-versions-on-windows/), which are separate Ruby version managers for Windows.

## Basic package management from RubyGems

- Even without `bundler` you get some package management - via `rubygems.rb`.
    - The basic `gem` command is defined by `RubyGems`
- Your `$LOAD_PATH` Ruby environment variable (only accessible to Ruby) holds the paths that Ruby searches when looking for gems (eg when executing `load` and `require` commands).
    - You can see all your Ruby environment variables by running `gem environment` on the command line.
    - NB When `rubygems.rb` is loaded, it replaces the default `require` with a new version that also searches installed gems as well as searching `$LOAD_PATH` - and updates `$LOAD_PATH` on the fly to add the directory/ies specified by the installed gem.
        - Actually I'm not sure it does update `$LOAD_PATH` any more. When I tested this with `irb` by running `puts $LOAD_PATH.grep(/json/)` and then `require('json')` and then `puts $LOAD_PATH.grep(/json/)` again, I didn't get the effect described in [this article](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0).
        - `rubygems.rb` gets loaded when you run `irb`. It also gets loaded when you run any `Ruby` program, as long as you are using Ruby v1.9 or later. Otherwise you have to specifically add it into your app using `require 'rubygems'`
    - Be aware that if you're building your own gem, there's a lot of good practice to make sure you don't cause problems with `$LOAD_PATH` [More on this here](https://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices/).
    - Gems are installed by running the `gem install` command  
        - You can see where they are installed by running `gem environment` and checking the setting for `INSTALLATION DIRECTORY`. 
        - Installing a gem means downloading its code from rubygems.org (if you have that configured as your gem source - you can check that via `gem environment`) and compiling any C code into dlls.
        - If you use `bundler` and have a `Gemfile` instead of using `gem install`, then when you run `bundle install` it does the same as `gem install`, and makes sure the specified version is installed. You could replicate this by manually running `gem install` for all the relevant gems and their versions (but probably wouldn't want to).
            - Installing a specific version of a gem means that its directories are added to $LOAD_PATH and its activation is recorded. You can't simultaneously activate two versions of the same gem.            
    - Questions:
        - Is the change to `$LOAD_PATH` made by `Rubygems require` temporary or permanent?
            - See above. I suspect it's not even true any more, but I'm pretty sure that when it was it was only temporary.
        - If you can't simultaneously activate two versions of the same gem, does this mean you can't simultaneously have two Ruby programs running that use different versions of the same gem?
            - I think the answer to that is yes - if you use a `bundle exec` command for each programme, then it just means `bundler` will load the correct version when starting the relevant piece of software. Once it's running, the correct version is loaded into memory and everything continues happily?
- When you use `require` to load a file, it will update the $LOADED_FEATURES  Ruby environment variable.
    - It will also execute all the code in required gem - which might involve requiring other gems, and will mean that various methods (and maybe some global variables) get defined.
- The difference with `require` (as opposed to `load`) is that it will not load the same code twice (it will return `false` instead).
    - Also, you can use `require_relative` to search in the same location as the file containing the `require` command (instead of searching `$LOAD_PATH`).
- You can test this via `irb` with the following series of commands (create a file `foo.rb` in the current directory):  

```
irb
require(`./foo.rb`)
puts $LOADED_FEATURES
```

- You might have to hunt through the long list of output, but `foo.rb` will be in there somewhere (quite likely at the end, in fact).

## Bundler

NB: Try to avoid versioning problems by keeping Ruby and all your gems up to date. See [Staying up to date](#staying-up-to-date).

- Run `bundle init` to create a brand new `Gemfile`.
- [bundler](https://bundler.io) is itself a gem, which has to be installed like other gems (`gem install bundler`).
- `bundler` is a gem package manager.
    - Interestingly `RubyGems` is also a package manager - the default one you're using if you don't have a `Gemfile` (and are therefore not using `bundler`), and you have Ruby v1.9 or higher... or you have `require 'rubygems'` in your project.
    - Most people use `bundler` though (which itself uses `rubygems`).
- Once you have it installed, you can use `Gemfile` to specify your dependencies and (if you want) make broad (or specific) specifications about their versions. 
    - Then when you run `bundle install`, bundler will install everything specified in your Gemfile AND all the dependencies of those gems, and their dependencies... all the way up the dependency tree. 
    - Once it's done, it creates `Gemfile.lock` which lists the exact version currently installed for every gem and every dependency.
    - You should check `Gemfile.lock` into source control so that you know exactly what versions of gems you are using for each commit. The exception to this is when you're building a library - in which case you only commit `Gemfile`. The reason for this is that your library could end up being just one link in a dependency chain, and other versions may be required of upstream or downstream dependencies (I think).
- In your Gemfile, this is the notation used to express version preferences:
    - `~> 1.1` means version `1.1` or later, but only if it's prefixed `1.1`. So `1.1.5` would be installed, but `1.2` would not.
        - Like this: `gem "redcarpet", "~> 3.4"`
    - `>= 1.1` would mean version `1.1` or later, including `1.2`, `1.3` and even `7.2`.
        - Like this: `gem "redcarpet", ">= 3.4"`
    - `1.1` specifies an exact version (not recommended)
        - Like this: `gem "redcarpet", "3.4"`
- If you use `bundler` and have a `Gemfile` instead of using `gem install`, then when you run `bundle install` it does the same as `gem install`, and makes sure the specified version is installed. You could replicate this by manually running `gem install` for all the relevant gems and their versions (but probably wouldn't want to).
- Putting `bundle exec` before a command, e.g. `bundle exec rspec`, ensures that `require` will load the version of a gem specified in your `Gemfile.lock` as opposed to the most recent version.
- If you're using `bundler`, then you should add these two lines to the first file your application loads:

```
require 'rubygems'
require 'bundler/setup'
```

- (If you're using Ruby 1.9 or later then you don't actually need the first line)
- What `bundler/setup` does is alter your `$LOAD_PATH` so that *only* the gems in your `Gemfile` are put into `$LOAD_PATH`. 
    - This is useful because if you had installed a gem on your machine using `gem install`, and then required it in your code, but hadn't added it to your `Gemfile`, then anybody else downloading your code would get errors. This way you will also get the same errors, and that will remind you to add the gem to your `Gemfile`.
    - [More here](brianstorti.com/understanding-bundler-setup-process/) and [here](https://bundler.io/rationale.html).
- You can use `Bundler.require(:default)` as shorthand to `require` everything in your `Gemfile`.
- Bundler will not update dependencies of dependencies if it means the resulting gem will be a version incompatible with another gem that also depends on it.

### Useful Bundler commands

- Update all gems: `bundle update` (exercise caution though)
- Update multiple gems: `bundle update gem1 gem2 gem3`
    - This can be very useful if you're trying to update one gem and keep getting errors about other related gems relying on different versions of each other - just update them all at once.
- Update one gem (and its dependencies): `bundle update gem-name`
    - To update it to a particular version, specify the version in `Gemfile` and then run `bundle install`
    - `~> 1.1` means version `1.1` or later, but only if it's prefixed `1.1`. So `1.1.5` would be installed, but `1.2` would not.
        - Like this: `gem "redcarpet", "~> 3.4"`
    - `>= 1.1` would mean version `1.1` or later, including `1.2`, `1.3` and even `7.2`.
        - Like this: `gem "redcarpet", ">= 3.4"`
    - `1.1` specifies an exact version (not recommended)
        - Like this: `gem "redcarpet", "3.4"`
- Find out which gems are outdated: `bundle outdated`
- Find out which gems have security vulnerabilities: Use [bundle-audit](https://github.com/rubysec/bundler-audit): `gem install bundle-audit` (or add to `Gemfile`) then run `bundle-audit`

## Errors / problems you might see

### "Your XXX version is a.b.c, but your Gemfile specified d.e.f"

(See also [Conflicting Ruby versions](#conflicting-ruby-versions) below.)

- **Example**: 
    - `Your Ruby version is 2.6.3, but your Gemfile specified 2.6.5`
- **Explanation**
    - Your installed version of Ruby is 2.6.3, but your Gemfile has specified that this project requires a different version.
    - This can happen on remote deployment platforms (eg Heroku) if you have pushed `Gemfile` but not `Gemfile.lock` (see below)
    - You might not find anything in your `Gemfile` which obviously specifies a Ruby version. Instead you might see something like this:
        - `ruby File.read(File.expand_path("../.ruby-version", __FILE__)).strip`
        - This indicates that you have a separate file called `.ruby-version` which tells you which version of Ruby your project is expecting
        - In my case my `Gemfile` and my `.ruby-version` are both in the same folder, so I don't know why the path (`../`) specifies that the file is in the parent folder. 
- **Solutions**:
    - To find out which version of Ruby you have installed, type this at the command line: `ruby --version`
    - If this happens in Heroku, make sure you have checked in your `Gemfile.lock` as well as your `Gemfile`
    - Install the correct version of Ruby: `ruby-install ruby 2.6.5`    
        - Note then when I had this problem, this wasn't enough - I also had to run `gem install bundler` and then `bundle install` - see questions below
    - You might try using `chruby`, but when I did this it didn't seem to work (see questions below):
		* Add stuff to `~/.bash_profile` and `.ruby-version` as per https://github.com/postmodern/chruby
		* Cmd: `which ruby`
		* Cmd: `chruby_use /Users/clarey/.rubies/ruby-2.6.5/`
- **Questions**:
    - Why did I also have to run `gem install bundler` and then `bundle install`?
    - What's all that `chruby` stuff?
    - Why does Heroku need `Gemfile.lock` as well as `Gemfile`?

### Conflicting Ruby versions

- **Example**:
    - I got various errors about Ruby versions when I first set this site up.
- **Solutions**:
    - I originally fixed the project at Ruby version 2.6.5 by adding a `.ruby-version` file and referring to it in `Gemfile`. But then my system version of Ruby got updated to 2.7.2 (probably because of academny-related Ruby stuff) and things got screwy again. Currently I can't run `jekyll serve` because I get the error "Your Ruby version is 2.7.2, but your Gemfile specified 2.6.5".
- **Questions**   
    - How can I stop this problem from recurring every time I update Ruby?
    - How can I keep Ruby up to date and avoid security weaknesses dur to not keeping Ruby and other dependencies up to date?
    - Are the following all equivalent alternatives to `.ruby-version`?
        - `chruby`
        - `rvm`
        - `rbenv`
- **Experiments**:
    - Use `.ruby-version` to update the version of Ruby being used by this site.
    - Go back to Ruby version 2.6.5 system-wide. Check my other Ruby projects (academy stuff) aren't broken by this.
    - Find a way of having more than one version of Ruby installed - so that this project can be fixed at a different version.
    - Once I have the Ruby version sorted, run `jekyll serve` to try and understand what all the `mingw` stuff is about. Or just use a previously-committed `Gemfile.lock` that contains the `mingw` stuff.
    - Update the Ruby version and then try to fix the formatting issue where the search box moves from right to left.

### `warn_for_outdated_bundler_version': You must use Bundler 2 or greater with this lockfile.

- **Explanation**:
    - Presumably this comes from the "BUNDLED WITH" section at the bottom of `Gemfile.lock` (see questions below).
- **Solution**:
    - `gem install bundler` 
- **Questions**:
    - Presumably you could also be more specific and run something like `gem install bundler -v 2.0`?
    - What's the difference between having a version specified in `Gemfile` and having it specified in `Gemfile.lock`? The lock file tends to have a lot more version specifications than `Gemfile`, and Heroku complains if it doesn't have a lock file checked in.
    - There's no reference to bundler in `Gemfile`, but it does say "BUNDLED WITH" and a version number at the bottom of `Gemfile.lock`. Presumably this is where the error comes from?

### "Could not find gem 'YYY (~> a.b)', which is required by gem 'ZZZ (= c.d.e)', in any of the sources."

- **Example**: 
    - `Could not find gem 'bundler (~> 1.1)', which is required by gem 'middleman-core (= 3.3.7)', in any of the sources.`
- **Explanation**: 
    - It can't find a particular version (`~> 1.1`) of a particular gem (`bundler`), because another gem (`middleman-core`, currently at version `3.3.7)`) has specified that it is dependent on the missing gem.
    - `~> 1.1` means version `1.1` or later, but only if it's prefixed `1.1`. So `1.1.5` would be installed, but `1.2` would not.
    - `>= 1.1` would mean version `1.1` or later, including `1.2`, `1.3` and even `7.2`.
- **Solution**:
    - Install the correct version of `bundler` and then reinstall `middleman`:
        - Cmd: `gem install bundler -v 1.15`
        - Cmd: `bundle _1.15_ install`
        - Cmd: `gem install middleman`
- **Questions**:
    - Those actions above are just what I did before things started working again - doesn't mean they were the correct or best solution. So...
        - Did I really need to reinstall `middleman`?
        - What's the difference between the first and second lines?

### "can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException)"

- **Example**:
    - "/home/travis/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/rubygems.rb:308:in activate_bin_path' /home/travis/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/rubygems.rb:289:infind_spec_for_exe': can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException)"
- **Explanation**:
    - This happened to me when deploying on Travis. If you look closely, you'll see it was in a Travis Ruby 2.5.1 directory. This seemed to come from the fact that I had `rvm` version `2.5.1` specified in `.travis.yml`.
- **Solution**:
    - I changed the `rvm` section of `.travis.yml` to match `.ruby-version`.
        - Something that confused me is that this section is not specifying the version of `rvm`, it's specifying the version of `Ruby`.

### Jekyll adds Windows-related dependencies to Gemfile

- **Example**: 
    - Running `jekyll serve` on my Windows machine (for this website) results in Windows-related dependencies being added to your `Gemfile.lock` (gems like `eventmachine (1.2.7-x64-mingw32)` are added, and a new `x64-mingw32` entry is added in the `PLATFORMS` section at the bottom), which then causes Heroku to complain that your `Gemfile.lock` was created by Windows.
- **Explanation**:
    - Maybe `jekyll serve` picks up on local platform settings and installs the relevant gems?
- **Solutions**:
    - My main workaround is that I either manually remove all those `mingw32` entries or I just don't check in the altered version of `Gemfile.lock`.
    - Instead, could fix `Gemfile.lock` by running the bundle command in Ubuntu and then pushing the resulting `Gemfile.lock` up to the server?
- **Questions**:
    - What's actually happening here? And is there a better solution?
    
### "cannot load such file" 

- You might need to run `bundle install`
    - If that doesn't work, it might mean that you have not added the specified gem to your `Gemfile`.
    - For instance if you get "cannot load such file -- rspec/core/rake_task", then try adding `gem 'rspec'` to your `Gemfile`.
- If you get “command not found: bundle” then you might need to install Bundler: `sudo gem install bundler`
   - !! The password it wants is your laptop password

## Things you might do to fix a problem

### gem install bundler

- **Example**:
    - `gem install bundler`
    - Note that this is typically folowed by `bundle install`
- **Explanation**:
    - `bundler` is a gem package manager
- **Questions**:
    - Presumably `bundler` is itself a gem?
    - How does it know about versions of gems? Does it rely on `Gemfile`?
    - Will `Gemfile` work if you don't have `bundler` installed, or is `Gemfile` proprietary to `bundler`?
    - Can you manage gems using other systems, or do you *have* to have `bundler`?

### bundle install

- **Example**:
    - `bundle install`
- **Explanation**:
    - This installs all the gems specified in your `Gemfile`
- **Gotchas**:
    - Note that in Ubuntu 16 on Windows (using WSL), when I ran the `bundle` command to install rake, I had to add some permissions: `sudo chown -R claresudbery:claresudbery /home/claresudbery/.bundle`
- **Questions**:
    - Locally or globally?
    - Presumably you need `bundler` installed?
    - Can you have a functioning `Gemfile` without having `bundler` installed?
    - What does it mean to say that gems are installed?

### bundle update

- **Example**:
    - `bundle update`
- **Explanation**:
    - Sometimes when you run `bundle install`, you get a message saying you need to run bundle update first. In this case you should… run `bundle update` first! 
    - But be aware that `bundle update` will ignore `Gemfile.lock` and update ALL dependencies, which can have unexpected results. 
        - A less aggressive approach is to run `bundle update` on a specific package, like this: `bundle update rack-cache`. Then only that package and its dependencies will be updated.
        - However, `bundler` will not update the dependency of an updated gem if it means the resulting dependency will be a version incompatible with another gem that also depends on it.
- **Questions**:
    - What does `bundle update` do?
    - Why does it sometimes need running before bundle install?

### gem update

- **Example**:
    - `gem update`
    - (Note that [in Linux on Windows](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#jekyll-installation-for-windows), I first had to run `sudo chown -R claresudbery /var/lib/gems/2.5.0/` to avoid permissions errors)
- **Explanation**:
    - ???
- **Questions**:
    - Is this the equivalent of `bundle install` if you don't have `bundler` installed?
    - I used this command [on Linux in Windows](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#jekyll-installation-for-windows). Is that relevant?

### gem install XXX

- **Example**:
    - `gem install middleman`
- **Explanation**:
    - You're installing the specific gem called `middleman` 
- **Questions**:
    - Presumably because you haven't specified a version, you will get the latest release?

### gem install XXX -v a.b

- **Example**:
    - `gem install bundler -v 1.15`
- **Explanation**:
    - You're installing a specific version (`1.15`) of a specific gem (`bundler`)

### gem install XXX YYY

- **Example**:
    - `gem install bundler jekyll`
- **Explanation**:
    - You're installing two gems at once (`bundler` and `jekyll`)
- **Questions**
    - Am I right about this? I spotted it in my [Jekyll installation instructions](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#to-get-up-and-running-on-a-mac), but I'm guessing.

### bundle _a.b_ install

- **Example**:
    - `bundle _1.15_ install`
- **Explanation**:
    - ??? 
- **Questions**:
    - Is this something that only works on the version of bundler - because it's using the `bundle` command to update itself - or if would this work on any gem, and in this case the gem in question is `bundle`? 
        - I suspect the former, because I don't think there is a gem called `bundle` - the gem (if it even counts as a gem?) is called `bundler`. I could be wrong though.

### bundle exec xxx

- **Example**:
    - `bundle exec jekyll build`
- **Explanation**:
    - You're prefixing command-line operations with `bundle exec` 
- **Questions**:
    - Is this so that everything you run will only use gems that have been installed using bundler?
    - Does it mean you make sure you only use the gem versions specified locally for that project?
    - Does it only work for command line operations?
    - Does it only work when the things you are running on the command kine are themsleves gems?- If you get the error 

### Use chruby to manage your Ruby versions

- See also [Different versions of Ruby](#different-versions-of-ruby) in this doc.

- **Example**:
    - Add stuff to `~/.bash_profile` and `.ruby-version` as per https://github.com/postmodern/chruby
    - Cmd: `which ruby`
    - Cmd: `chruby_use /Users/clarey/.rubies/ruby-2.6.5/`
- **Another example**:
    - Cmd: `brew install chruby`
    - Cmd: `source /usr/local/share/chruby/chruby.sh`
    - Cmd: `source /usr/local/share/chruby/auto.sh`
- **Explanation**:
    - You're using chruby to manage which version of Ruby is used by this project
- **Questions**:
    - Does this mean that different projects can use different versions of Ruby?
    - What's the difference between the two examples above?
    - What are the other tools that can be used to manage Ruby versions - eg `rvm`?
    - How come Travis appears to rely on `rvm` (hence the section in `.travis.yml` used to specify your Ruby version) even though I'm not? Presumably this is because Travis is using `rvm` locally on its own servers?

### Use ruby-install to specify a Ruby version

- See also [Different versions of Ruby](#different-versions-of-ruby) in this doc.

- **Example**:
    - Cmd: `brew install ruby-install`
    - Cmd: `ruby-install ruby 2.6.5`
- **Explanation**:
    - `ruby-install` is what you use to install Ruby. In this case you're specifying a particular version
    - Note that you might not have `brew` installed on your system. 
        - If you're in Windows, I think you have to use a dedicated installer.
        - If you're on a Mac or Linux, I think `yarn` is one of the alternatives to `brew`?
        - If you're on Linux, the equivalent to `brew install` is often (always?) `sudo apt-get install`
        - Fwiw personally I like using `brew` when I'm on a Mac - it allows me to have a `brew` script which I can use to set up a new Mac with all my preferred software.
- **Questions**:
    - If you don't specify a version, will you get the latest stable release?
    - Are there other Ruby installation tools available other than `ruby-install`?
    - Can you have old versions of Ruby hanging around on your system? 
        - I think there will be folders somewhere in your operating system that have particular versions in their names?

## To do

- Answer the questions in this doc
- Update clare-wiki 
    - Fix kramdown vulnerability by [upgrading Jekyll](https://jekyllrb.com/docs/upgrading/3-to-4/)
    - update Ruby version 
    - Update gems 
    - see [this article](https://thoughtbot.com/blog/keep-your-gems-up-to-date) - which also gives advice on how to automate the process.
        - try getting bummr working?
- Fix problems with martin fowler
    - I made a change to `class-too-large.xml` which I didn't push to the remote repo because I wasn't able to test it locally.
        - There's a backup in Dropbox at Desktop\Current\refactoring
        - If you run `work` and then `rs` you get the following error: "C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/bundler-1.17.3/lib/bundler/spec_set.rb:91:in `block in materialize': Could not find ffi-1.11.2-x64-mingw32 in any of the sources (Bundler::GemNotFound)"
        - I'm pretty sure this is because it's trying to use Ruby 2.7.0 (check out the folder in the path in the error message), and maybe the last time I ran it I was on Ruby 2.6.5?
            - I tried running everything in Linux (Ubuntu - not 16.04) instead, because that way I could use `chruby` to switch Ruby versions
            - I got as far as installing the required version of Ruby, but then when I tried to run `bundle install` I got the error "/usr/lib/ruby/2.5.0/rubygems.rb:284:in `find_spec_for_exe': Could not find 'bundler' (1.17.3) required by your /mnt/c/development/sudbery-mfcom/Gemfile.lock. (Gem::GemNotFoundException)"
            - When I tried to install the correct version of bundler using `gem install bundler -v 1.17.3`, I got the error "Unable to require openssl, install OpenSSL and rebuild ruby (preferred) or use non-HTTPS sources" (I found [this on stackoverflow](https://stackoverflow.com/questions/37336573/unable-to-require-openssl-install-openssl-and-rebuild-ruby-preferred-or-use-n), but didn't have time to investigate further).
            - When I tried `bundle _1.17.3_ install`, I just got the same error as before ("Could not find 'bundler' (1.17.3)")
            - I tried pulling latest changes from remote but that didn't help either.
    - Once I get this working I need to test it locally before pushing it to the remote.
- Answer unanswered questions in this doc
- Update to [WSL 2 on my machine](https://docs.microsoft.com/en-gb/windows/wsl/install-win10)

