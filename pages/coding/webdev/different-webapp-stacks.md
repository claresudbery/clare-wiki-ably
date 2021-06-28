---
layout: page
location: pages/coding/webdev/leaf
permalink: /pages/coding/webdev/Different-Webapp-Stacks
---

## Possible Stacks

I asked Twitter [the following question](https://twitter.com/ClareSudbery/status/1403060911657701378?s=20): "If you wanted to build and deploy a very simple web app using TDD and automated unit tests as part of the deployment pipeline, an inexperienced coder, what language / platform / deployment pipeline would you use? We're looking for low friction, quick results, low learning curve."

Below started out as a summary of the answers I got. I expected it will probably get added to over time.

I'm splitting them by language because that seemed a reasonable way of looking at it.

## Javascript

### Heroku / Node.js / React / Jest

@worldofchris (Chris Young)

- **Deployment / pipeline**: Heroku
- **Backend**: Node.js
- **Unit tests**: Jest
- **Front end**: React ([my React notes])](/pages/coding/webdev/js/React))
- **Front end tests**: Jest

### Heroku + Git / Node.js

@thinkfoo (Dave Hounslow)

- **Deployment / pipeline**: Heroku + Git
- **Backend**: Node.js
- **Unit tests**: ?
- **Front end**: ?
- **Front end tests**: ?

### Github actions + Heroku / Node.js + Express / Jest / React + Create-react-app

@jocrossick

[create-react-app - getting-started](https://create-react-app.dev/docs/getting-started/)

- **Deployment / pipeline**: Github actions + Heroku
- **Backend**: Node.js + Express
- **Unit tests**: Jest
- **Front end**: React via create-react-app ([my `create-react-app` notes])](/pages/coding/webdev/js/React#create-react-app))
- **Front end tests**: create-react-app

### Github actions + Netlify / React + Create-react-app

@fidgetfive (Matt)

- **Deployment / pipeline**: Github actions + Netlify
- **Backend**: ?
- **Unit tests**: ?
- **Front end**: React via create-react-app ([my `create-react-app` notes])](/pages/coding/webdev/js/React#create-react-app)) 
- **Front end tests**: Create-react-app

### Github actions + Netlify / React

@coderbyheart (Markus Tacker)

[An example app](https://github.com/coderbyheart/tdd-web-app)

("It has tests for plain JS libraries and React components. Tests are run using GitHub actions. On success, deployed to Netlify. PRs are tested and deployed to preview URLs.")

- **Deployment / pipeline**: Github actions + Netlify
- **Backend**: ?
- **Unit tests**: ?
- **Front end**: React ([my React notes])](/pages/coding/webdev/js/React))
- **Front end tests**: ?

### Docker / Node.js + Express / Static pages / Cypress

@DinoRoar2 (John Nicholas)

- **Deployment / pipeline**: Docker
- **Backend**: Node.js + Express
- **Unit tests**: ?
- **Front end**: Static pages, very simple routing 
- **Front end tests**: Cypress, or just architect it so you can fire a load of - rest calls and not have to worry about setup/teardown. Like why - If you know - you want e2e tests - do people design so that they have to reset the dB - between tests? How is that a good tradeoff? What are the alternatives this - wins against? You end up with something way simpler imo. Esp if your tests - leave v easy to recognise data.
- **Data store**: json

### Simple http server / Node.js + Express / Http / Cypress

@LewisDaleUK

- **Deployment / pipeline**: Simple http server
- **Backend**: Node.js + Express
- **Unit tests**: ?
- **Front end**: Http
- **Front end tests**: Cypress

## Python 

### Python/Flask / Pytest / Ruby + Rails / rspec

@worldofchris (Chris Young)

- **Deployment / pipeline**: ?
- **Backend**: Python / Flask
- **Unit tests**: Pytest
- **Front end**: Ruby + Rails
- **Front end tests**: rspec

### Heroku / Python/Flask / Pytest

@nimphal (Nevelina A)

- **Deployment / pipeline**: Heroku
- **Backend**: Python / Flask
- **Unit tests**: Pytest
- **Front end**: ?
- **Front end tests**: ?

## Ruby

### Python + Ruby + Rails

- See [Python/Flask / Pytest / Ruby + Rails / rspec](#pythonflask--pytest--ruby--rails--rspec)

### Github actions + Heroku  / Ruby / Sinatra / rspec

@adomas_s (Adomas Sliužinskas)

This is what I've used to create a lot of simple webapps. [Examples are listed here](/pages/coding/lang/oo/ruby/Ruby#sinatra).

- **Deployment / pipeline**: Github actions + Heroku
- **Backend**: Ruby
- **Unit tests**: rspec
- **Front end**: Ruby + Sinatra
- **Front end tests**: rspec

## Kotlin

### http4k

@natpryce

- "http4k. The “server-as-a-function“ model makes testing a breeze."
- From [http4k.org](https://www.http4k.org/blog/meet_http4k): "http4k is an HTTP toolkit written in Kotlin that enables the serving and consuming of HTTP services in a functional and consistent way. ... Written in pure, functional Kotlin, with zero dependencies. http4k is simple. Like, really simple. No static API magic, no annotations, no reflection."

## Go

### Go + gin

@dmlled (DLed)

- "Go + gin. Fast compilation, no need to start the server to test the routes, tiny language, ok VS Code support"
- [Getting started](gobyexample.com)
- "and more, the readmes in the ecosystem are good"
- Some useful links:
    - [The gin web framework](https://github.com/gin-gonic/gin)
    - [Testify - Go testing framework](https://github.com/stretchr/testify)
    - [Cobra - Useful library for creating Go CLI applications](https://github.com/spf13/cobra)

### Go + TDD

@quii (Chris James)

- "Go. Simple language, testing built in. Standard library has absolutely everything you need to build production ready web servers.
- Coming from writing scala for 5 years it did few backward in terms of syntax but the ecosystem around it makes you incredibly productive."
- [I wrote a thing about TDD with it](https://quii.gitbook.io/learn-go-with-tests/)
- [This chapter in particular I hope would help](https://quii.gitbook.io/learn-go-with-tests/build-an-application/http-server)


