---
layout: page
categories: coding webdev jekyll 
location: "pages/coding/webdev/jekyll/leaf"
permalink: /pages/coding/webdev/jekyll/Jekyll-Troubleshooting
---

## Ably's use of Jekyll deployed on Heroku: 
* https://www.ably.io/blog/hacking-github-to-build-your-own-wiki
* https://github.com/ably/wiki-site

## Deploying ruby using heroku
* Here: https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up

## Creating a site with Jekyll
* Here: https://jekyllrb.com/tutorials/home/

## Useful Jekyll Stuff:
* Simple Jekyll Search: https://github.com/christian-fei/Simple-Jekyll-Search
* Listing posts by category: https://github.com/shigeya/jekyll-category-archive-plugin
* Programatically retrieve list of pages instead of hard coding navigation links: https://jekyllrb.com/tutorials/navigation/

## Ruby Version Stuff

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
* It turns out this happened because of the Windows ming stuff that finds its way into Gemfile.lock if you run **jekyll serve** from GitBash.
* The solution is to remove all the lines in Gemfile.lock that contain the ming thing. 
* Otherwise Heroku complains about Gemfile.lock having been created by Windows, and somehow the dependencies get mucked up on the server.
* If it happens again, fix Gemfile.lock by running the **bundle** command in Ubuntu and then pushing the resulting Gemfile.lock up to the server.		
	
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
	* MacOS Catalina has the wrong version of Ruby - see [Ruby Version Stuff](#ruby-version-stuff)
	* Then I installed Heroku CLI: ```curl https://cli-assets.heroku.com/install.sh | sh```
		* (that's because I got an error when I used the ```snapd``` command: https://superuser.com/questions/1391219/setting-up-heroku-cli-in-wsl)
		* After that you have to qualify heroku commands like this: ```/usr/local/bin/heroku create```
		* But then I added heroku to my path and didn't need to do that any more: ```export PATH=$PATH:/usr/local/bin/heroku```
	* When I ran the ```bundle``` command to install rake, I had to add some permissions:
		* ```sudo chown -R claresudbery:claresudbery /home/claresudbery/.bundle```
	
## To get up and running on a Mac:
* clone the repo containing the jekyll site (currently clare-wiki-jekyll)
* install git 
* install ruby and jekyll and heroku stuff: https://blog.heroku.com/jekyll-on-heroku
	* NB: Change those instructions slightly:
	* Instead of ```ruby-install ruby```, use ```ruby-install``` to install the same Ruby version as specified in Gemfile, like this: ```ruby-install ruby 2.6.5```
* MacOS Catalina has the wrong version of Ruby - see [Ruby Version Stuff](#ruby-version-stuff)

## Keeping a file in git without tracking changes
* Here: https://stackoverflow.com/questions/9794931/keep-file-in-a-git-repo-but-dont-track-changes

## Jekyll installation for windows
* Here: https://jekyllrb.com/docs/installation/windows/
* First I installed the Windows subsystem for linux: https://docs.microsoft.com/en-gb/windows/wsl/install-win10
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
	* I gave up in the end. I now run ```jekyll serve``` from GitBash, but do everything else in Ubuntu.
	* Sadly this does mean that ```Gemfile.lock``` keeps getting Windows-related stuff added to it, that breaks things if I push it up to Heroku.
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



