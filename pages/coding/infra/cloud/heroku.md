---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/Heroku
---

## GitHub Repos

- This [tic-tac-toe Ruby kata](https://github.com/claresudbery/tic-tac-toe-kata) is built in Sinatra and deployed to Heroku [here](https://tic-tac-toe-kata.herokuapp.com/tictactoe).

## Misc Heroku Stuff

- There are some heroku-related notes in the [Jekyll troubleshooting page](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting) on this site.
- HackMcr with Laurent - One True Path: Dropbox\IT Training\Hackathons\HackManchester\2015

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