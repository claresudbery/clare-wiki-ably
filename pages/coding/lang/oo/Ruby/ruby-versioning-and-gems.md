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
- [Brief bundler tutorial from Learn Enough Ruby on Rails](https://www.learnenough.com/ruby-on-rails-6th-edition-tutorial/beginning#sec-bundler) (Learn Enough subscription might be needed, but at the time of writing (Jan 2021) this content was free).

## Bundler

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
- **Gotchas**:
    - Note that in Ubuntu 16 on Windows (using WSL), when I ran the `bundle` command to install rake, I had to add some permissions: `sudo chown -R claresudbery:claresudbery /home/claresudbery/.bundle`
- **Questions**:
    - Locally or globally?
    - Presumably you need `bundler` installed?
    - Can you have a functioning `Gemfile` without having `bundler` installed?
    - What does it mean to say that gems are installed?

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
    - What are the other tools that can be used to manage Ruby versions - eg `rvm`?
    - How come Travis appears to rely on `rvm` (hence the section in `.travis.yml` used to specify your Ruby version) even though I'm not? Presumably this is because Travis is using `rvm` locally on its own servers?

### Use ruby-install to specify a Ruby version

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




