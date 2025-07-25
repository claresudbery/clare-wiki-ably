---
layout: page
categories: coding webdev jekyll 
location: "pages/coding/webdev/jekyll/leaf"
permalink: /pages/coding/webdev/jekyll/Jekyll-Troubleshooting
---

## Ably's use of Jekyll deployed on Heroku: 
* https://www.ably.io/blog/hacking-github-to-build-your-own-wiki
* https://github.com/ably/wiki-site
	
## To get up and running on a Mac:

* I've now captured the installation in a Mac installation script
    * You can find it [here](https://github.com/claresudbery/Root-Scripts/blob/master/installing-new-mac)
    * Scroll down a bit to the set of commands headed "Install Ruby and Jekyll and everything needed to support the Jekyll wiki site"
    * It's basically these commands (some of which might be redundant / overkill, I'm not sure):

```
# Install ruby-install
brew install ruby-install

# Install chruby 
brew install chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Install ruby
ruby-install ruby 2.6.5

# Make the Ruby version stick at ruby 2.6.5
chruby ruby-2.6.5

# Install bundler
gem install bundler
bundle install

# Install jekyll
gem install bundler jekyll

# Install heroku CLI (needs sudo pw)
curl https://cli-assets.heroku.com/install.sh | sh
```

* Here are my original notes:
    * clone the repo containing the jekyll site (currently clare-wiki-jekyll)
    * install git 
    * install ruby and jekyll and heroku stuff: https://blog.heroku.com/jekyll-on-heroku
     	* NB: Change those instructions slightly:
        * Instead of ```ruby-install ruby```, use ```ruby-install``` to install the same Ruby version as specified in Gemfile, like this: ```ruby-install ruby 2.6.5```
    * MacOS Catalina has the wrong version of Ruby - see [Ruby Version Stuff](<#ruby version stuff>)
	
## Deploying jekyll using heroku: https://blog.heroku.com/jekyll-on-heroku
* Clare-specific notes available [here](https://github.com/claresudbery/clare-tech/blob/master/coding/webdev/jekyll/Jekyll-Notes.md) (accessible to Clare only).
* In Ubuntu 16: 
	* I followed the instructions for getting ruby-install and chruby to get latest Ruby version	
		* prob not necessary though, as I forgot I'd alrteady installed Ruby.
		* and it took ages!
	* I got an error saying "chruby: command not found" when I ran the command chruby ruby
		* I fixed this by adding these two lines to ~/.bashrc: 
		* ```source /usr/local/share/chruby/chruby.sh```
		* ```source /usr/local/share/chruby/auto.sh```
	* MacOS Catalina has the wrong version of Ruby - see [Ruby Version Stuff](<#ruby version stuff>)
	* Then I installed Heroku CLI: ```curl https://cli-assets.heroku.com/install.sh | sh```
		* (that's because I got an error when I used the ```snapd``` command: https://superuser.com/questions/1391219/setting-up-heroku-cli-in-wsl)
		* After that you have to qualify heroku commands like this: ```/usr/local/bin/heroku create```
		* But then I added heroku to my path and didn't need to do that any more: ```export PATH=$PATH:/usr/local/bin/heroku```
	* When I ran the ```bundle``` command to install rake, I had to add some permissions:
		* ```sudo chown -R claresudbery:claresudbery /home/claresudbery/.bundle```

## If you get server errors after deployment

- run `heroku logs --tail --app clare-wiki` on the command line to see keroku server logs

## Deploying ruby using heroku
* Here: https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up

## Creating a site with Jekyll
* Here: https://jekyllrb.com/tutorials/home/

## Useful Jekyll Stuff:
* Simple Jekyll Search: https://github.com/christian-fei/Simple-Jekyll-Search
* Listing posts by category: https://github.com/shigeya/jekyll-category-archive-plugin
* Programatically retrieve list of pages instead of hard coding navigation links: https://jekyllrb.com/tutorials/navigation/

## Ruby Version Stuff

### Clearer guidance for particular errors and problems

There's now a [whole separate page for this](/pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems), which hopefully has clearer advice for how to fix specific versioning problems, but I'm preserving these notes for historical reasons.

### When I had problems running jekyll on command line (GitBash, Windows) after installing jekyll using gem install jekyll bundler
* Updated ruby version in .ruby-version
* Ran **bundle install**
* Then prefixed all jekyll commands with **bundle exec** - eg **bundle exec jekyll -v** and **bundle exec jekyll build**

### MacOS Catalina has the wrong version of Ruby
* MacOS Catalina has the wrong version of Ruby, so I ran **ruby-install ruby 2.6.5**
	* ... but I still got an error "Your Ruby version is 2.6.3, but your Gemfile specified 2.6.5" on MacOS
	* So I ran **gem install bundler** and then **bundle install**, and that fixed it.
	* I also did some other stuff previously, but I'm pretty sure none of it made any difference:
		* Added stuff to ~/.bash_profile and .ruby-version as per https://github.com/postmodern/chruby
		* Cmd: **which ruby**
		* Cmd: **chruby_use /Users/clarey/.rubies/ruby-2.6.5/**

### Ruby version problems when deploying with Heroku

* I got an error on heroku deploy at one point:
* "Your Ruby version is 2.5.1, but your Gemfile specified 2.6.5"
* It turned out this was because I had checked in Gemfile with the new Ruby version, but hadn't checked in Gemfile.lock

### Using ruby-install with a specific Ruby version

* Instead of **ruby-install ruby**, you can use **ruby-install** to install the same Ruby version as specified in Gemfile, like this: **ruby-install ruby 2.6.5**

### Bundler version error

- When trying to run [testing-for-beginners](https://github.com/rubymonsters/testing-for-beginners) via `rackup`: "Could not find gem 'bundler (~> 1.1)', which is required by gem 'middleman-core (= 3.3.7)', in any of the sources."
- Solution:
	- `gem install bundler -v 1.15`
	- `bundle _1.15_ install`
	- `gem install middleman`

### Error on jekyll serve: "warn_for_outdated_bundler_version"

Full error:
```
C:/RailsInstaller/Ruby2.3.3/lib/ruby/gems/2.3.0/gems/bundler-1.15.3/lib/bundler/lockfile_parser.rb:108:in `warn_for_outdated_bundler_version': You must use Bundler 2 or greater with this lockfile. (Bundler::LockfileError)
```

I ran `bundle install` and that told me to run `gem install bundler`, which worked.

### Summary of early 2021 versioning problems

- In December 2020 I was having Travis deployment problems
- I hit everything with lots of hammers, including running `bundle update` and upgrading Ruby - which meant that everything got upgraded
- This only partially worked
- In Feb 2021 I saw more problems
- Then I realised the original Travis error was caused purely because the Ruby version specified by the `rvm` section of `.travis.yml` didn't match `.ruby-version`
- So I undid all the upgrade stuff and just fixed that `rvm` section 
- This left a few more lingering problems, which I fixed by 
	- altering `Rakefile` to put back the `rspec` section I'd added earlier
	- adding `rspec` to `Gemfile` (in commit 22918d7), running `bundle install` and checking in the new `Gemfile.lock` (commit efbd13a). This seemed to fix the problem.
- However this put me back to a situation where all the dependencies are pretty out of date, and [dependabot](/pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems#how-dependabot-works) is shouting at me.
- Then I learnt a lot more about Ruby versioning and gems, and created [this page here](/pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems).
- Finally at the beginning of March 2021, I set about trying to get all dependencies up to date.
	- See [this section](/pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems#staying-up-to-date) for notes on that.
- Full details are in the two sections below.

### Bundler version problems when deploying with Travis

- (see [above for summary](<#summary of early 2021 versioning problems>))
- On or around 30/12/20, starting at around commit e4bb0ba: 
- Getting the following error in Travis: "/home/travis/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/rubygems.rb:308:in `activate_bin_path'
/home/travis/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/rubygems.rb:289:in `find_spec_for_exe': can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException)"
- In the end when I looked more closely at the errors in Travis I realised it was in a Travis Ruby 2.5.1 directory which seemed to come from the fact that I had rvm version 2.5.1 specified in .travis.yml.
	- I spent bloody ages trying to work out what the latest version of rvm is, or what version I should have in .travis.yml... until I finally realised that it's not referring to the version of rvm, it's referring to the version of RUBY that rvm should use. So I changed the `rvm` section of `.travis.yml` to match `.ruby-version`.
	- This led me down another set of rabbit holes. See commits [484dbf2](https://github.com/claresudbery/clare-wiki-ably/commit/484dbf2) to [b128805](https://github.com/claresudbery/clare-wiki-ably/commit/b128805), to see the various things I tried.
	- Then I got the following error in Travis: "`bundle exec rake` - rake aborted! Don't know how to build task 'default'", so I added lines to my `Rakefile` as recommended by [this article](https://coderwall.com/p/sdxxaa/travis-ci-don-t-know-how-to-build-task-default).
		- This was the final action that fixed everything!
		- ...well, sort of. Sadly it meant that [this formatting problem](<#issue with site layout caused when you push gemfile lock changes>) returned.
		- Also I'm pretty sure it was at this point that I started getting a million warnings on the command line whenever I ran jekyll serve.
- These are the things I tried before I realised the problem was likely the `rvm` section of `.travis.yml` (see explanation above):
	- Found [this issue](https://github.com/rbenv/rbenv/issues/1138) and [this article](https://bundler.io/blog/2019/01/04/an-update-on-the-bundler-2-release.html) and [this article](https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html.)
	- Tried the below steps (not sure they were in that order though). Note that I went beyond just looking at bundler versions because I thought everything might have got out of sync because I kept overwriting `Gemfile.lock` because the `mingw` thing kept messing with the formatting of the site (to see an example of a `Gemfile.lock` containing `mingw` references, see [Gemfile-with-mingw.lock](https://github.com/claresudbery/clare-wiki-ably/blob/master/Gemfile-with-mingw.lock)).
	
```bash
gem install bundler
gem install bundler -v '2.1.4'
# updated Ruby version to 2.7.2 in .ruby-version
bundle install
gem install nokogiri
gem install nokogiri --platform=ruby
bundle update
gem update --system
```

#### Problems related to the above

- (see [above for summary](<#summary of early 2021 versioning problems>))
- On or around 26/2/21:
- At some point after the above I started getting deployment errors because there was no `Gemfile.lock` being pushed to source control.
	- When I committed Gemfile.lock I got internal server errors on every page of the site except the home page.
	- So I undid all the changes I'd previously made, apart from the change to the rvm section of `.travis.yml` (see notes above).
	- Basically what I did (starting at commit 1be449b) was go back to commit e4bb0ba, take copies of the following files and then recommit them at the tip of master - apart from I fixed the rvm section in `.travis.yml` to match `.ruby-version`:
		- (these files are all at C:\Temp\wiki-safe\2020-01-26-deployment):
		- `.gitignore`
		- `.ruby-version`
		- `.travis.yml`
		- `Gemfile`
		- `Gemfile.lock`
		- `Rakefile`
		- then after that I also reinstated the change that had removed the script sections from `.travis.yml`, because that looked like it might be causing errors in Travis.
	- The above changes meant that my previous `bundle update` was undone, so a lot of gems went back to old versions again.
		- This wasn't ideal - dependabot certainly didn't like it.
		- So on 1/3/21, I updated a bunch of gems.
		- To see everything I did, see commits cd73da4 to d9548ea
		- I started by merging the dependabot branches
		- Then I ran [`bundle-audit`](/pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems#acting-on-security-recommendations-with-bundle-audit) and acted on its recommendations
		- Then I upgraded jekyll (which I couldn't do without simultaneously upgrading minima and html-proofer - I worked out I needed to update versions in `Gemfile` and also run `bundle update jekyll minima html-proofer` after getting a lot of errors about conflicting dependencies centering on those three gems)
		- Finally I replaced `redcarpet` with `kramdown`, after getting server errors in `heroku` and realising that the newer version of `Jekyll` didn't support `redcarpet` - [see notes here](<#switching from redcarpet to kramdown>)
	- I don't quite understand why, but this still leaves the formatting of the search box screwed up.
		- Maybe something to do with the version of nokogiri?
		- Previously (on 30/12/20) in commit 96d475a, I had updated nokogiri from 1.10.4 to 1.10.10, and that got reversed by my changes above
		- There was a [dependabot](/pages/coding/lang/oo/ruby/Ruby-Versioning-And-Gems#how-dependabot-works) branch from 27/11/20 trying to bump the nokogiri version from 1.10.4 to 1.10.8, but this got closed when I made the changes on 30/12/20, because I'd updated versions of everything.
		- Then on 26/1/21, presumably because I'd reversed the previous updates, dependabot opened a new PR to bump nokogiri from 1.10.10 to 1.11.0
	- At some point the formatting problem got fixed again, and I'm really not sure when / how.
		- I discovered this on 22/2/21
		- But this Travis error came back again - "`bundle exec rake` - rake aborted! Don't know how to build task 'default'" 
			- so I made the same change to `Rakefile` detailed above (I made the new change in commit 8587665). 
			- Then I got the error "cannot load such file -- rspec/core/rake_task", so I added `rspec` to `Gemfile` (in commit 22918d7), ran `bundle install` and checked in the new `Gemfile.lock` (commit efbd13a). This seemed to fix the problem.
- Relevant commits from the original changes on 30/12/20 - listed in reverse order to identify exactly what was changed:
	- febe432 Fix rake error in Travis deploy - `Rakefile`
	- b128805 fixing new deploy errors after losing Gemfile.lock - `.travis.yml` and `script/dummy` (commented out the script-related settings)
	- 5e9da04 Stop pushing Gemfile.lock to Travis - `.gitignore` and removing `Gemfile.lock.hidden`
	- 61e3b3a Go back to Ruby 2.7.2 and stop pushing Gemfile.lock - `.travis.yml` and adding `Gemfile.lock.hidden` (changed rvm setting from 2.7 to 2.7.2)
	- 9d43814 Still trying to fix ruby version - `.travis.yml` (changed rvm setting from 2.7.2 to 2.7)
	- 30e0f19 Change rvm setting to match Ruby version in ruby-version - `.travis.yml` (changed rvm setting from 2.6 to 2.7.2)
	- 484dbf2 Try updating rvm version - `.travis.yml` (changed rvm setting from 2.5.1 to 2.6)
	- 1e42796 Fixing and documenting the Travis deployment error problem - `Gemfile.lock` and  `Gemfile`
	- 96d475a Updated gems to try fix Travis deployment error - `Gemfile.lock` and  `Gemfile` and `.ruby-version`
	- e4bb0ba Fix bad gemfile.lock - `Gemfile.lock`
	
## Favicon Stuff

### Favicon showing up in Google Chrome 
* Here: https://stackoverflow.com/questions/16375592/favicon-not-showing-up-in-google-chrome
* Favicon generator: https://favicon.io/favicon-generator/

### Error: favicon.ico not found
* Here: https://github.com/mmistakes/minimal-mistakes/issues/389
	
## Css/layout not the same locally as remote

* Stored relevant files in C:\Users\CLARE\Downloads\images\BigIndex
* See screenshots: Local-layout.PNG and Remote-layout.PNG
* Html and search js are identical (see files in same folder)
* But _site/assets/main.css are slightly different. See local-main.css and remote-main.css
* It turns out this happened because of the Windows `mingw` stuff that finds its way into Gemfile.lock if you run **jekyll serve** from GitBash.
* The solution is to remove all the lines in Gemfile.lock that contain the `mingw` thing (the easiest way to do this is to revert to your previous version of `Gemfile.lock`). Then stop using GitBash to run `jekyll serve` (originally I had a problem running `jekyll serve` from Ubuntu (not Ubuntu 16.04 on my machine - just because that's not the one I'm keeping up to date with `~/.bashrc` etc), but that's no longer the case).
* Otherwise Heroku complains about Gemfile.lock having been created by Windows, and somehow the dependencies get mucked up on the server.
* I tried fixing Gemfile.lock by running the **bundle** command in Ubuntu (which is equivalent to **bundle install**) , but this didn't seem to work - the `mingw` entries remained.		

## Keeping a file in git without tracking changes
* Here: https://stackoverflow.com/questions/9794931/keep-file-in-a-git-repo-but-dont-track-changes

## Issue with site layout caused when you push Gemfile.lock changes

- Issue: The search box appears top left instead of top right
- Cause: Every time you run `jekyll serve` (`js`) in GitBash, extra windows stuff gets added to `Gemfile.lock` which is fine locally but doesn't work remotely.
	- The *stuff* in question is a lot of new `mingw` versions of various gems, like this: `eventmachine (1.2.7-x64-mingw32)`. Also a new `x64-mingw32` entry is added in the `PLATFORMS` section at the bottom (mingw = MinGW = Minimal Gnu for Windows) (to see an example of a `Gemfile.lock` containing `mingw` references, see [Gemfile-with-mingw.lock](https://github.com/claresudbery/clare-wiki-ably/blob/master/Gemfile-with-mingw.lock)).
- Solution: Revert any pushed changes to `Gemfile.lock`
- Prevention: Never push changes to `Gemfile.lock`. I have a shortcut alias set up - just run `discard Gemfile.lock` on command line before changes are staged.
- Note that in the end, due to other problems, I stopped pushing `Gemfile.lock` altogether. But sadly this did mean the formatting problem returned. 
	- I'm guessing the problem is that some gem has been updated in a way that changes how layouts work (could well be an accessibility thing - screen readers work better if sidebars are on the left instead of the right). I probably just need to change some css / html somewhere?
	- In the end, because I was getting errors due to not puishing `Gemfile.lock`, I unwound some of the other changes I'd made [(details here)](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting#problems-related-to-the-above), and went back to the previous `Gemfile.lock`, which fixed the formatting again.

## Jekyll installation for windows
* Here: https://jekyllrb.com/docs/installation/windows/
* First I [installed the Windows subsystem for linux (WSL)](/pages/coding/dotnet/Windows-Subsystem-for-Linux---WSL)
* Then I basically ran all the following commands (see below for some of the explanation):
	* sudo apt update && sudo apt upgrade
	* sudo apt-get update -y && sudo apt-get upgrade -y
	* sudo apt-get install libgdbm-dev
	* sudo apt-get install libpng-dev
	* sudo apt-add-repository ppa:brightbox/ruby-ng
	* sudo apt-get update
	* sudo apt-get install ruby2.5 ruby2.5-dev build-essential dh-autoreconf
	* sudo chown -R claresudbery /var/lib/gems/2.5.0/
	* sudo chown -R claresudbery /usr/local/bin
		* (!! Those ```sudo chown``` commands are to get round the permissions errors you get otherwise when you run the next command (gem update))
	* gem update
	* gem install jekyll bundler
* Then I got permission errors when trying to run ```bundle exec jekyll serve```
	* Errors:
		* bundler: failed to load command: jekyll (/usr/local/bin/jekyll)
		* Errno::EPERM: Operation not permitted @ apply2files - /mnt/c/development/clare-wiki-jekyll/_site/README.md
	* Tried doing this:
		* ```sudo umount /mnt/c```
		* ```sudo mount -t drvfs C: /mnt/c -o metadata```
		* Had to restart machine first though because of errors about drive being in use.			
		* From here: https://stackoverflow.com/questions/46610256/chmod-wsl-bash-doesnt-work
		* Via here: https://stackoverflow.com/questions/57243299/jekyll-operation-not-permitted-apply2files
* Then localhost simply not accessible from browser
	* Someone with similar problem here: https://github.com/microsoft/WSL/issues/2471
	* I gave up in the end and started doing everything in `GitBash` instead for a while.
		* Then I realised that it's harder to manage Ruby versions in GitBash
		* Also Travis and Heroku are deploying on Linux, so it makes sense to also use Linux as mny development environment.
		* Luckily when I tried again in Jan 2021 (using Ubuntu installed on my Windows laptop - NOT Ubuntu 16.04 (just because Ubuntu is the one I keep up to date and has everything in `~/.bashrc`)), it had started working.
	* Sadly this does mean that ```Gemfile.lock``` keeps getting Windows-related stuff added to it whenever I run run ```jekyll serve```, and this breaks things if I push it up to Heroku.
* https://docs.microsoft.com/en-gb/windows/wsl/install-win10?redirectedfrom=MSDN
* When I followed the jekyll instructions, I got the following errors when I ran sudo gem update (immediately after sudo apt-get install ruby2.5 ruby2.5-dev build-essential dh-autoreconf):
	* ERROR:  Error installing dbm: ERROR: Failed to build gem native extension. checking for -lgdbm... no
	* ERROR:  Error installing gdbm: ERROR: Failed to build gem native extension. checking for gdbm_open() in -lgdbm... no
	* ERROR:  Error installing zlib: ERROR: Failed to build gem native extension.
		* checking for deflateReset() in -lz... no
		* checking for deflateReset() in -llibz... no
		* checking for deflateReset() in -lzlib1... no
		* checking for deflateReset() in -lzlib... no
		* checking for deflateReset() in -lzdll... no
		* checking for deflateReset() in -lzlibwapi... no
	* They were all followed by the following:
		* extconf.rb failed
		* Could not create Makefile due to some reason, probably lack of necessary libraries and/or headers.  
		* Check the mkmf.log file for more details.  You may need configuration options.
	* The mkmf.log files were available here: 
		* /var/lib/gems/2.5.0/extensions/x86_64-linux/2.5.0/dbm-1.1.0/mkmf.log
		* /var/lib/gems/2.5.0/extensions/x86_64-linux/2.5.0/gdbm-2.1.0/mkmf.log
		* /var/lib/gems/2.5.0/extensions/x86_64-linux/2.5.0/zlib-1.1.0/mkmf.log
	* I found this article for a similar problem: https://github.com/zendesk/zendesk_apps_tools/issues/245
		* Based on that and a bit of deduction / experimentation, I ran these lines:
			* ```sudo apt-get install libgdbm-dev```
			* ```sudo apt-get install libpng-dev```
		* Then I ran ```sudo gem update``` again and all was good.

## Viewing heroku logs: 
* Runtime logs via Command line 
	* use ```heroku logs -a clare-wiki```
	* (Might have to login first using ```heroku login``` then ```ctrl + C``` in GitBash, but no need for Ctrl + C if you're in Ubuntu)
	* https://devcenter.heroku.com/articles/logging
* Build logs Via web UI
	* Click pipeline, then clare-wiki, then Activity, View build logs under a build
* Clare-specific notes available [here](https://github.com/claresudbery/clare-tech/blob/master/coding/webdev/jekyll/Jekyll-Notes.md) (accessible to Clare only).

## Downloading individual files from GitHub

* You'll find you often get told to download individual files from GitHub when using plugins etc. 
* But GitHub doesn't easily allow that via its UI.
* Click on the file in GitHub UI, then click Raw, then copy the url
* Now use this command on command line in root of your project (this one was going to _plugins folder, you might need to tweak):

{% highlight bash %}
	curl -L https://raw.githubusercontent.com/shigeya/jekyll-category-archive-plugin/master/_plugins/category_archive_plugin.rb > _plugins/category_archive_plugin.rb
{% endhighlight %}

## OmniAuth vulnerability

- Before doing any auth stuff, check whether there is still a vulnerability in OmniAuth (see [alert here](https://github.com/claresudbery/clare-wiki-ably/network/alert/Gemfile.lock/omniauth/open) or check the front page of the `clare-wiki-ably` repo in GitHub - the alerts show up there (but NOT in notifications)

## Error on jekyll serve: "invalid byte sequence in UTF-8 included in /_layouts/default.html"

The full error:
```
Liquid Exception: Liquid error (C:/development/clare-wiki-ably/_includes/toc.html line 35): invalid byte sequence in UTF-8 included in /_layouts/default.html
jekyll 3.7.4 | Error:  Liquid error (C:/development/clare-wiki-ably/_includes/toc.html line 35): invalid byte sequence in UTF-8 included
```

### The problem

It turned out this was caused by a particular line of text in a markdown file (pages\coding\infra\security\oauth.md). I found it by using the equivalent of Saff squeeze (same concept as binary search algorithm) to identify the commit that caused the problem (it was commit 77698c8 on 20/4/20, "New content from Cadogan notes"). I then used the same technique to narrow down the problematic line of text. I used "View | Show symbol | Show all characters" in Notepad++ to try and see what the problem was and there was nothing visible. 

### The fix

I tried running dos2unix on that file, but it didn't work. Then again, I ran it in GitBash. Should I have run it in Linux?
Anyway, in the end I fixed it by manually typing out the same words again, removing the original text. So it's a bit of a mystery!

## Switching from redcarpet to kramdown

- I upgraded to Jekyll 4.2.0 on 1/3/21
- This was fine in Travis - everything was building fine.
- But I got heroku build errors (which confused me - I thought all the building happened in Travis) and deployments failed.
	- It's also confusing because everything was working fine locally - it's only in Heroku that it fails.
	- This was the main error: `Markdown processor: "redcarpet" is not a valid Markdown processor. Available processors are: kramdown`
	- It turns out redcarpet is not supported in Jekyll 4 (but it was in Jekyll 3). This is not well documented.
	- I found [this article](https://idratherbewriting.com/2016/02/21/bug-with-kramdown-and-rouge-with-github-pages/) and followed its advice for moving from redcarpet to kramdown
	- See commit a3717f6
- See also [this GitHub issue](https://github.com/claresudbery/clare-wiki-ably/issues/1) where I had a convo with the person who wrote the toc element I'm using, and they recommended replacing `redcarpet` with `kramdown` to fix a toc formatting issue (which actually I'd already fixed by editing `toc.html` - see commits 34b357f, 8f89162, 175a4df and [my toc notes](/pages/organising/bigindex/Big-Index-Useful-Tools#generating-table-of-contents-toc))