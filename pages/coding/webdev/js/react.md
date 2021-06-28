---
layout: page
location: "pages/coding/webdev/js/leaf"
permalink: /pages/coding/webdev/js/React
---

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [getting-started-with-tdd-in-react](https://github.com/claresudbery/getting-started-with-tdd-in-react)
- [MenopauseTracker-javascript](https://github.com/claresudbery/MenopauseTracker-javascript)
- [react-big-calendar](http://intljusticemission.github.io/react-big-calendar/examples/index.html)
    - I found this on my hard disk after I cloned it from elsewhere. When I tried to create a new repo for it I just got a ton of security warnings because all the dependencies were out of date, so I got rid of my copy. This version is the source version, at intljusticemission.
    - It was used by another project - MenopauseTracker, I think.
- [Samba (PRIVATE)](https://github.com/claresudbery/samba)
    - See sub-folders son**, sig** and vis**

## Docs and Blog Posts

- [ReactiveX](/pages/coding/tools/ReactiveX)

## Reagent

- Reagent is a library – a Clojurescript wrapper around react js. See [Clojure notes](/pages/coding/lang/func/Clojure#reagent)

## create-react-app

### create-react-app - Intro

- As recommended [here](/pages/coding/webdev/Different-Webapp-Stacks)
- Create React App is an officially supported way to create single-page React applications. It offers a modern build setup with no configuration.
- [create-react-app - getting-started](https://create-react-app.dev/docs/getting-started/)
- My [sample repo](https://github.com/claresudbery/create-react-app-playground)

### create-react-app - Troubleshooting getting started

- I had node v 13 which didn't work (`The engine "node" is incompatible with this module. Expected version "^10 or ^12 or >=14". Got "13.10.1"`) so I upgraded node, but it took a bit of doing to get it right.
    - See [troubleshooting notes on my node page](/pages/coding/webdev/js/Node-JS#upgrading-node---troubleshooting).

### create-react-app - Scratch

```
create-react-app-playground
npx create-react-app create-react-app-playground --template typescript
```