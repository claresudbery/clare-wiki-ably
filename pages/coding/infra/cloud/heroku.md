---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/Heroku
---

## GitHub Repos

- This [tic-tac-toe Ruby kata](https://github.com/claresudbery/tic-tac-toe-kata) is built in Sinatra and deployed to Heroku via Travis [here](https://tic-tac-toe-kata.herokuapp.com/tictactoe).
    - I documented the Heroku / Travis deployment steps [in the readme here](https://github.com/claresudbery/tic-tac-toe-kata/blob/master/README.md#deploying-to-heroku-via-travis).
- This clare-wiki site (this one!) is also deployed via Heroku.
- My [Cards Against Humanity answer generator](https://github.com/claresudbery/cah-answer-generator) is also deployed via Travis to Heroku.
- My [Ruby version of the Mars Rover kata](https://github.com/claresudbery/mars-rover-kata-ruby) is also deployed via Travis to Heroku.
- I did also have a few simple dockerised sites deployed via Heroku (but I've now deleted the apps in Heroku to preserve free dyno hours):
    - [webapi-docker](https://github.com/claresudbery/webapi-docker)
    - [dotnet-docker-clare](https://github.com/claresudbery/dotnet-docker-clare)

## Deploying to heroku

### Deploying direct to heroku (Ruby) without a CI tool

For [Wordlessly](https://github.com/claresudbery/wordlessly/blob/master/README.md#deploying-to-heroku), I didn't even bother with Travis (or Circle CI). I just deployed direct to heroku, following these instructions:

- Install [everything you need to deploy a ruby app to Heroku](https://devcenter.heroku.com/articles/getting-started-with-jruby)
- Install [heroku command line tools](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli)
- Login to heroku: `heroku login`
    - if you get `bad request` it might mean you forgot to navigate to the project folder first.
- Create an app: `heroku apps:create your-app-name`
- Run `git push heroku master` (note that even if your main git branch is named `main`, you still use `master` in this command)
    - !! But if you get the error "fatal: 'heroku' does not appear to be a git repository", you need to run `heroku git:remote -a your-app-name` first (fill in your app name).
- Ensure that at least one instance of the app is running: `heroku ps:scale web=1 --app your-app-name`
- Open the website: `heroku open --app your-app-name`

### Database stuff

- For Ruby, PostgreSQL, Sinatra/Rails and heroku see [here](/pages/coding/data/PostgreSQL-and-PSQL#heroku)

### Deploying to heroku (Ruby) with Circle CI

If I decide to switch to Circle CI in the future, I think [this page for the Circle CI side of things](https://circleci.com/docs/2.0/language-ruby/) and [this page for the Heroku end](https://circleci.com/integrations/heroku) will probably be useful.

### Deploying to heroku (Ruby) with Travis

I documented the Heroku / Travis deployment steps [in the tic-tac-toe readme here](https://github.com/claresudbery/tic-tac-toe-kata/blob/master/README.md#deploying-to-heroku-via-travis).

## My apps

- See clare-tech: heroku.md

## Free dyno hours

- [More here](https://devcenter.heroku.com/articles/free-dyno-hours)
- To see hours used by one app:
    - Run `heroku login` and then `heroku ps -a [app-name]` to see how many hours have been used by that app and how many hours you have left in your account. The first two lines of output will tell you ("Free dyno hours...")
- To see hours used by all apps:
    - Visit [the billing page](https://dashboard.heroku.com/account/billing) to see a list of all apps and how many hours they've used
- To turn off a worker dyno (might be running constantly if there is no web app, for instance if it's just a docker app - [more here](https://devcenter.heroku.com/articles/dynos)):
    - Run `heroku login` and then `heroku ps:stop worker -a [app name]`
- To delete a worker dyno (it might keep gettin restarted for various reasons, so stopping it may not be enough):
    - Go to the settings page for the app (change url to match app - eg https://dashboard.heroku.com/apps/dotnet-docker-clare/settings)
    - Scroll down to bottom and click Delete App

## Upgrade to heroku-22 from heroku-18 (29/04/23)

- This was my second attempt to upgrade my Wordlessly app
- I went [here](https://devcenter.heroku.com/articles/upgrading-to-the-latest-stack#upgrading-an-app)
    - This told me to run this: `heroku stack:set heroku-22 -a wordlessly`
    - which then told me to run `git push heroku main` 
        - but that didn't work ("failed to push some refs to 'https://git.heroku.com/wordlessly.git'")
        - instead I had to run `git push heroku master`
    - But that gave me a deployment error: "The Ruby version you are trying to install does not exist on this stack."
        - the version it was using was `ruby-2.7.5`
        - I don't know why! I can't find that specified anywhere in the Wordlessly project
            - actually that's not true - there are these two lines in `travis.yml`: `rvm:` followed by `- 2.7.0` on next line
            - but according to my notes in readme I never actually used Travis?
- So I tried to upgrade Ruby
    - I [checked here](https://devcenter.heroku.com/articles/ruby-support#supported-runtimes) for supported versions of Ruby
    - Then I went [here](https://www.rubyonmac.dev/how-to-upgrade-the-ruby-version-in-your-project) to see how to upgrade Ruby
    - I ran `chruby` and got the answer `* ruby-2.6.5`
    - I visited [Ruby site](https://www.ruby-lang.org/en/downloads/) and discovered latest stable version was 3.2.2.
    - so then I ran `ruby-install 3.2.2` - which took ages! Well, about 5-10 mins
    - After that, `package-lock.json` had been updated (not sure how/why), so I tried `git push heroku master` again
        - got same error about Ruby 2.7.5
    - so I tried editing `travis.yml` (even though I thought I wasn't using Travis) under `rvm` from `2.7.0` to `3.2.2`
    - then followed instructions from above RubyOnMac article:
        - `git checkout -b upgrade-ruby`
        - Committed the change to `travis.yml`
        - Committed the change to `package-lock.json` (probably unnecessary?)
        - Went out of folder and back in again with `cd ..` then `cd -` to try and pick up new Ruby version
            - that didn't work - when I ran `ruby -v` I was still on 2.6.5
            - So I ran `chruby 3.2.2` and then `ruby -v` again and that worked
        - Ran `gem install bundler` and `bundle install`
            - Got errors: "An error occurred while installing nokogiri (1.10.10), and Bundler cannot continue.
                - Make sure that `gem install nokogiri -v '1.10.10' --source 'https://rubygems.org/'` succeeds before bundling."
            - Ran `bundle update --bundler`
                - Got errors:
                    - (after "Installing sinatra-activerecord 2.0.25") 
                    - "Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
                        - current directory: /Users/claresudbery/development/wordlessly/vendor/bundle/ruby/3.2.0/gems/nokogiri-1.10.10/ext/nokogiri" 
                    - "An error occurred while installing nokogiri (1.10.10), and Bundler cannot continue.
                        - In Gemfile: rspec-html-matchers was resolved to 0.9.3, which depends on nokogiri"
                    - "An error occurred while installing pg (1.3.4), and Bundler cannot continue.
                        - In Gemfile: pg"
            - Paid better attention to first error, and ran `gem install nokogiri -v '1.10.10' --source 'https://rubygems.org/'`
            - Ran `bundle install` again
                - Kept getting errors about nokogiri and things like "rspec-html-matchers was resolved to 0.9.3, which depends on nokogiri"
                - Did the following: 
                    - gem install nokogiri -v '1.10.10' --source 'https://rubygems.org/'
                    - bundle install
                    - bundle update nokogiri
                    - bundle update rspec-html-matchers
                    - gem update nokogiri
                    - bundle install
                - No joy
                - Edited Gemfile to copy `gem 'rspec'` and `gem 'rspec'` into the `group :test do` section
                    - Ran `bundle install` and got warnings about duplicates for `gem rspec` but then same error:
                    - "An error occurred while installing nokogiri (1.10.10), and Bundler cannot continue.
                        - In Gemfile: rspec-html-matchers was resolved to 0.9.3, which depends on nokogiri"
                    - Incidentally it's now saying 0.9.3 again, after saying another version after I ran `bundle update rspec-html-matchers` but anyway none of that is working.
                    - Tried removing the duplicate lines for rspec and rspec-html-matchers from Gemfile, so all lines are now in the test block
                    - Same nokogiri error
                - Got drastic and removed tests altogether (they weren't working anyway)
                    - Removed spec folder
                    - Removed test block from Gemfile
                - Got error about pg:
                    - "An error occurred while installing pg (1.3.4), and Bundler cannot continue.
                        - In Gemfile: pg"
                    - Ran the suggested command: `gem install pg -v '1.3.4' --source 'https://rubygems.org/'`
                    - Got error: "Unable to find PostgreSQL client library."
                    - Tried `gem install pg` - same error
                    - Tried `brew install --cask pgadmin4` which is from my Mac install script (see reinstalling-new-mac.md in clare-tech - Clare only)
                        - Got error: "It seems there is already an App at '/Applications/pgAdmin 4.app'."
                    - Found [this article](https://stackoverflow.com/questions/6209797/cant-find-the-postgresql-client-library-libpq)
                        - Tried `sudo su` then `env ARCHFLAGS="-arch x86_64" gem install pg`
                        - Got error "Unable to find PostgreSQL client library. Please install libpq or postgresql client package like so: `brew install libpq`"
                        - Tried `brew install libpq` but it said it was already installed
                    - Found [this page](https://www.postgresql.org/download/macosx/)
                        - Tried downloading [EDB interactive Pstgresql installer](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
                - Suddenly realised I'm fiddling about trying to get bundle install to work locally, but what I actually care about is that it works remotely on heroku
                    - Changed tack:
                    - Went back to master branch and updated travis.yml from 2.7.0 to 3.2.2
                    - Committed and pushed the change, then ran `git push heroku master`
                    - Got same error about Ruby 2.7.5
                    - Tried adding `ruby "3.2.2"` to `Gemfile` under `source "https://rubygems.org"`
                    - Committed and pushed the change, then ran `git push heroku master`
                    - That seemed to fix it - it deployed with no errors... but when I visited it in browser I got errors
                    - So I looked at logs - `heroku logs --tail -a wordlessly` 
                    - saw errors like "crashed ... bundler: command not found: rackup ... Install missing gem executables with `bundle install`"
                    - Gave up at this point! No time left to continue.

## Upgrade to heroku-22 from heroku-18 (12/10/22)

- This was my first attempt, and it failed. Details below.
    - Second attempt is documented [here](#upgrade-to-heroku-22-from-heroku-18-290423).
- Find out which apps are using a particular stack (in this case `heroku-18`):
    - `heroku login`
    - (If not already done) `heroku plugins:install apps-table`
    - `heroku apps:table --filter="STACK=heroku-18"`
    - If you get an error "Warning: heroku update available" just run `heroku update`
- I followed instructions [here](https://devcenter.heroku.com/articles/upgrading-to-the-latest-stack) and [here](https://devcenter.heroku.com/articles/github-integration-review-apps#configuration)
- This is what I did (on mars-rover, used as test bed):
    - I tried using review apps, but it didn't work:
        - I added review apps ([info here](https://devcenter.heroku.com/articles/github-integration-review-apps#configuration))
            - Pipeline => Settings
            - Connect to a github repo
            - Add review apps
        - I added a new branch 
        - I added an app.json to the new branch, with `{"stack": "heroku-22"}` in it
            - Note this only works when upgrading review apps - you can't use this method to upgrade main app
        - I created a PR from that branch
        - I went to the Pipeline tab and clicked Create Review app under the PR
        - ... but this failed when I reviewed the deployment, and there was no feedback as to why
    - So I just clicked the upgrade button in the settings
        - This didn't work - build log showed deploy failed because I was using a vserion of Ruby not supported by the new heroku stack
            - Same happened when I tried again Apr '23, so I [tried again](#upgrade-to-heroku-22-from-heroku-18-290423).
        - So I rolled back: 
            - find previous release: `heroku login` then `heroku releases -a [app name]`
            - Roll back to last release using previous stack: `heroku rollback v28`
            - Check it's worked by listing all apps using the previous stack (in this case `heroku-18`): 
                - (If not already done) `heroku plugins:install apps-table`
                - Then `heroku apps:table --filter="STACK=heroku-18"`



## Misc Heroku Stuff

- There are some heroku-related notes in the [Jekyll troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting) on this site.
- HackMcr with Laurent - One True Path: Dropbox\IT Training\Hackathons\HackManchester\2015
- There are lots of heroku-related notes on [my Jekyll troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting).

## Troubleshooting

- "No web processes running". I got this error for ages with the [tic-tac-toe-kata](https://tic-tac-toe-kata.herokuapp.com/tictactoe) (the error was visible in the logs via `heroku logs --tail --app tic-tac-toe-kata`). The solution was to go to [the resources section in heroku](https://dashboard.heroku.com/apps/tic-tac-toe-kata/resources), then under Free Dynos, click the Edit button (pencil icon) over on the right, and turn the switch on to activate the web dyno.

## Deploying Dockerised apps

- [Deploying a Docker container to Heroku](https://devcenter.heroku.com/articles/container-registry-and-runtime)
- See [my tic-tac-toe repo](https://github.com/claresudbery/tic-tac-toe-kata) for an example of a Dockerised Sinatra app, was deployed via Heroku [here](https://tic-tac-toe-docker.herokuapp.com/tictactoe) (but I've now deleted the app to preserve free dyno hours.).
- See [my Docker page](/pages/coding/infra/cloud/Docker) for more Docker stuff.
- [Deploying an ASP.Net dockerised app to Heroku](https://medium.com/@vnqmai.hcmue/deploy-asp-net-core-to-heroku-for-free-using-docker-bd6d6fc161ae)
    - My heroku-deployed dockerised ASP.Net app:
        - [source code](https://github.com/claresudbery/dotnet-docker-clare) (check readme for notes on things I had to do to get it working)
        - it was deployed [here](https://dotnet-docker-clare.herokuapp.com/) but I've now deleted the app to preserve free dyno hours.
    - I did also have a heroku-deployed dockerised .Net Core web API:
        - [source code](https://github.com/claresudbery/webapi-docker) (check readme)
        - API was deployed [here](https://webapi-docker.herokuapp.com/shiny) but I've now deleted the app to preserve free dyno hours.