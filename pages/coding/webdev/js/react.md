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
- My [sample repo](https://github.com/claresudbery/create-react-app-playground-win)

### create-react-app - Troubleshooting getting started

#### Troubleshooting node version

- I had node v 13 which didn't work (`The engine "node" is incompatible with this module. Expected version "^10 or ^12 or >=14". Got "13.10.1"`) so I upgraded node, but it took a bit of doing to get it right.
    - See [troubleshooting notes on my node page](/pages/coding/webdev/js/Node-JS#upgrading-node---troubleshooting).

#### Troubleshooting getting started with a project not created on your machine

- If you're getting errors about `create-script` not existing, this probably means you don't have a `node_modules` folder yet.
- This means you haven't installed your packages yet.
- If your project is using `yarn` (there'll be a `yarn.lock` file in the root folder), you need to run the `yarn` command.
- If your project is using `npm` (there won't be a `yarn.lock` file in the root folder, but there will be `packages-lock.json`), you need to run the `npm install` command.

#### Troubleshooting yarn vs npm

- I was experimenting with developing the same [project](https://github.com/claresudbery/create-react-app-playground) on two [different](https://github.com/claresudbery/create-react-app-playground-win) machines (a Windows machine and a Macbook, as it happens, but that wasn't actually relevant to this problem) and I came up against a conflict between `npm` and `yarn`.
    - On my macbook I had `yarn` installed. This was apparently detected by `create-react-app` and the project was built to work with `yarn`. When I pulled the code onto my Windows machine - where I *didn't* have `yarn` installed - I couldn't run the code because `yarn start` didn't work (it was configured to run using `npm start` instead).
    - The solution was to install `yarn` on my Windows machine (where I was running the project in GitBash) using `npm install -g yarn`, and then migrate the project from `npm` to `yarn`. Full instructions [here](/pages/coding/webdev/js/Node-JS#migrating-from-npm-to-yarn).
        - You can see the resulting commit [here](https://github.com/claresudbery/create-react-app-playground-win/commit/356597f7e6ec58a75e96cb20c398b09e3edcb1ee).
    - See [package management notes on my node page for further info on yarn and npm](/pages/coding/webdev/js/Node-JS#package-management---npm-vs-yarn).

### create-react-app - Scratchpad

```
create-react-app-playground
npx create-react-app create-react-app-playground --template typescript
```