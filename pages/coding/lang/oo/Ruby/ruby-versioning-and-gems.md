---
layout: page
location: pages/coding/lang/oo/ruby/leaf
permalink: /pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems
---

## Intro

Ruby is a great language in many ways, but the one thing that mars the experience of working with Ruby is the fact that you'll often find yourself having to halt development work while you fix confusing `Gemfile` errors such as "Your Ruby version is 2.6.3, but your Gemfile specified 2.6.5" or ."Could not find gem 'bundler (~> 1.1)', which is required by gem 'middleman-core (= 3.3.7)', in any of the sources." 

I can't decide whether I should be proud or ashamed of the fact that for a long time, my reaction to these errors was to google them and then blindly follow the advice I found until things were working again. Proud, because I was focused and pragmatic - I had a goal in mind and didn't want to be distracted by the rabbithole of researching exactly what was going on. Ashamed, because I was doing the equivalent of hitting it with a hammer until it worked - rather than getting a proper understanding and therefore the ability to find long term solutions and be confident that I wouldn't find myself back in the same situation at some unpredictable point in the future.

If you look at my [Jekyll troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting), you'll see that I was simply recording error messages and solutions, with not much idea of what was actually going on or which actions were the ones that actually fixed my problems, and not much understanding of *why* things got fixed when they did.

So today I have put aside a whole day to dive in and get to grips once and for all with what the hell is going on with my `Gemfile`.

## Useful resources

- [Learn Tech guide on gem packaging](https://learn.madetech.com/guides/06-Gem-Packaging/) (from Made Tech)
- [Internal Made Tech workshop on Ruby versioning, bundling and managing gems](https://docs.google.com/presentation/d/1sYbNtN6Frbu-cucQL8hxPlgV-eaLqPwU9FMNhNE1YEc/edit#slide=id.ga070ffb2eb_0_138) (courtesy of George Schena)
- [Brief bundler tutorial from Learn Enough Ruby on Rails](https://www.learnenough.com/ruby-on-rails-6th-edition-tutorial/beginning#sec-the_hello_application) (Learn Enough subscription might be needed, but at the time of writing (Jan 2021) this content was free).

## Bundler

## Errors you might see

### "Your XXX version is a.b.c, but your Gemfile specified d.e.f"

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


### "Could not find gem 'YYY (~> a.b)', which is required by gem 'ZZZ (= c.d.e)', in any of the sources."

- **Example**: 
    - `Could not find gem 'bundler (~> 1.1)', which is required by gem 'middleman-core (= 3.3.7)', in any of the sources.`
- **Explanation**: 
    - It can't find a particular version (`~> 1.1`) of a particular gem (`bundler`), because another gem (`middleman-core`, currently at version `3.3.7)`) has specified that it is dependent on the missing gem.
- **Solution**:

## Things you might do to fix a problem

### gem install bundler

- **Example**:
    - `gem install bundler`
    - Note that this is typically folowed by `bundle install`
- **Explanation**:
    - `bundler` is a gem package manager
- **Questions**:
    - Presumably `bundler` is itself a gem?
    - How does it know abhout versions of gems? Does it rely on `Gemfile`?
    - Will `Gemfile` work if you don't have `bundler` installed, or is `Gemfile` proprietary to `bundler`?
    - Can you manage gems using other systems, or do you *have* to have `bundler`?

### bundle install

- **Example**:
    - `bundle install`
- **Explanation**:
    - This installs all the gems specified in your `Gemfile`
- **Questions**:
    - Locally or globally?
    - Presumably you need `bundler` installed?
    - Can you have a functioning `Gemfile` without having `bundler` installed?
    - What does it mean to say that gems are installed?

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
    - Does it only work when the things you are running on the command kine are themsleves gems?

### Use chruby to manage your Ruby versions

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

### Use ruby-install to specify a Ruby version

- **Example**:
    - Cmd: `brew install ruby-install`
    - Cmd: `ruby-install ruby 2.6.5`
- **Explanation**:
    - `ruby-install` is what you use to install Ruby. In this case you're specifying a particular version
    - Note that you might not have `brew` installed on your system. 
        - If you're in Windows, I think you have to use a dedicated installer.
        - If you're on a Mac or Linux, I think `yarn` is one of the alternatives to `brew`?
        - Fwiw personally I like using `brew` when I'm on a Mac - it allows me to have a `brew` script which I can use to set up a new Mac with all my preferred software.
- **Questions**:
    - If you don't specify a version, will you get the latest stable release?
    - Are there other Ruby installation tools available other than `ruby-install`?
    - Can you have old versions of Ruby hanging around on your system? 
        - I think there will be folders somewhere in your operating system that have particular versions in their names?





