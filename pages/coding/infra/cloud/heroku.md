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
- I also have a few simple dockerised sites deployed via Heroku:
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

## Misc Heroku Stuff

- There are some heroku-related notes in the [Jekyll troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting) on this site.
- HackMcr with Laurent - One True Path: Dropbox\IT Training\Hackathons\HackManchester\2015
- There are lots of heroku-related notes on [my Jekyll troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting).

## Troubleshooting

- "No web processes running". I got this error for ages with the [tic-tac-toe-kata](https://tic-tac-toe-kata.herokuapp.com/tictactoe) (the error was visible in the logs via `heroku logs --tail --app tic-tac-toe-kata`). The solution was to go to [the resources section in heroku](https://dashboard.heroku.com/apps/tic-tac-toe-kata/resources), then under Free Dynos, click the Edit button (pencil icon) over on the right, and turn the switch on to activate the web dyno.

## Deploying Dockerised apps

- [Deploying a Docker container to Heroku](https://devcenter.heroku.com/articles/container-registry-and-runtime)
- See [my tic-tac-toe repo](https://github.com/claresudbery/tic-tac-toe-kata) for an example of a Dockerised Sinatra app, deployed via Heroku [here](https://tic-tac-toe-docker.herokuapp.com/tictactoe).
- See [my Docker page](/pages/coding/infra/cloud/Docker) for more Docker stuff.
- [Deploying an ASP.Net dockerised app to Heroku](https://medium.com/@vnqmai.hcmue/deploy-asp-net-core-to-heroku-for-free-using-docker-bd6d6fc161ae)
    - My heroku-deployed dockerised ASP.Net app:
        - [source code](https://github.com/claresudbery/dotnet-docker-clare) (check readme for notes on things I had to do to get it working)
        - [deployed app](https://dotnet-docker-clare.herokuapp.com/)
    - I also have a heroku-deployed dockerised .Net Core web API:
        - [source code](https://github.com/claresudbery/webapi-docker) (check readme)
        - [deployed API](https://webapi-docker.herokuapp.com/shiny)