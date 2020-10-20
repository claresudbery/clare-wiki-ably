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

- "No web processes running". I got this error for ages with the [tic-tac-toe-kata](https://tic-tac-toe-kata.herokuapp.com/tictactoe). The solution was to go to [the resources section in heroku](https://dashboard.heroku.com/apps/tic-tac-toe-kata/resources), then under Free Dynos, click the Edit button (pencil icon) over on the right, and turn the switch on to activate the web dyno.