---
layout: page
location: pages/coding/webdev/leaf
permalink: /pages/coding/webdev/Different-Webapp-Stacks
---

## Possible Stacks

I asked Twitter [the following question](https://twitter.com/ClareSudbery/status/1403060911657701378?s=20): "If you wanted to build and deploy a very simple web app using TDD and automated unit tests as part of the deployment pipeline, an inexperienced coder, what language / platform / deployment pipeline would you use? We're looking for low friction, quick results, low learning curve."

Below started out as a summary of the answers I got. I expected it will probably get added to over time.

### Heroku / Node.js / React / Jest

@worldofchris (Chris Young)

**Deployment / pipeline**: Heroku

**Backend**: Node.js

**Unit tests**: Jest

**Front end**: React

**Front end tests**: Jest

### Heroku + Git / Node.js

@thinkfoo (Dave Hounslow)

**Deployment / pipeline**: Heroku + Git

**Backend**: Node.js

**Unit tests**: ?

**Front end**: ?

**Front end tests**: ?

### Rails / Python/Flask / Pytest / Ruby / rspec

@worldofchris (Chris Young)

**Deployment / pipeline**: Rails

**Backend**: Python / Flask

**Unit tests**: Pytest

**Front end**: Ruby

**Front end tests**: rspec

### Heroku / Python/Flask / Pytest

@nimphal (Nevelina A)

**Deployment / pipeline**: Heroku

**Backend**: Python / Flask

**Unit tests**: Pytest

**Front end**: ?

**Front end tests**: ?

### Github actions + Heroku / Node + express / Jest / Create-react-app

@jocrossick

[create-react-app - getting-started](https://create-react-app.dev/docs/getting-started/)

**Deployment / pipeline**: Github actions + Heroku

**Backend**: Node + express

**Unit tests**: Jest

**Front end**: Create-react-app 

**Front end tests**: Create-react-app

### Github actions + Netlify / Create-react-app

@fidgetfive

**Deployment / pipeline**: Github actions + Netlify

**Backend**: ?

**Unit tests**: ?

**Front end**: Create-react-app 

**Front end tests**: Create-react-app

### Github actions + Netlify / React

@coderbyheart (Markus Tacker)

[An example app](https://github.com/coderbyheart/tdd-web-app)

("It has tests for plain JS libraries and React components. Tests are run using GitHub actions. On success, deployed to Netlify. PRs are tested and deployed to preview URLs.")

**Deployment / pipeline**: Github actions + Netlify

**Backend**: ?

**Unit tests**: ?

**Front end**: React 

**Front end tests**: ?

### Github actions + Netlify / Create-react-app

@DinoRoar2

**Deployment / pipeline**: Express + Docker

**Backend**: ?

**Unit tests**: ?

**Front end**: Static pages, very simple routing 

**Front end tests**: Cypress, or just architect it so you can fire a load of rest calls and not have to worry about setup/teardown. Like why - If you know you want e2e tests - do people design so that they have to reset the dB between tests? How is that a good tradeoff? What are the alternatives this wins against? You end up with something way simpler imo. Esp if your tests leave v easy to recognise data.

**Data store**: json

### Github actions + Heroku  / Ruby / Sinatra / rspec

@adomas_s

**Deployment / pipeline**: Github actions + Heroku

**Backend**: Ruby

**Unit tests**: rspec

**Front end**: Ruby

**Front end tests**: rspec

### http4k

@natpryce

"the “server-as-a-function“ model makes testing a breeze."

### Simple http server

@LewisDaleUK

**Deployment / pipeline**: ?

**Backend**: Express

**Unit tests**: ?

**Front end**: Http

**Front end tests**: Cypress

### Go + gin

@dmlled

"Fast compilation, no need to start the server to test the routes, tiny language, ok VS Code support"

[Getting started](gobyexample.com)

"and more, the readmes in the ecosystem are good"

https://github.com/gin-gonic/gin
https://github.com/stretchr/testify
https://github.com/spf13/cobra

### Go

@quii (Chris James)

"Simple language, testing built in. Standard library has absolutely everything you need to build production ready web servers.

[I wrote a thing about TDD with it](https://quii.gitbook.io/learn-go-with-tests/)

[This chapter in particular I hope would help](https://quii.gitbook.io/learn-go-with-tests/build-an-application/http-server)

Coming from writing scala for 5 years it did few backward in terms of syntax but the ecosystem around it makes you incredibly productive."


