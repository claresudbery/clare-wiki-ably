---
layout: page
location: "pages/coding/webdev/js/leaf"
permalink: /pages/coding/webdev/js/Node-JS
---

## Useful tools

- [Top 10 VS Code extensions for Node js](https://developer.okta.com/blog/2019/05/08/top-vs-code-extensions-for-nodejs-developers)

## Updating npm dependencies

Good explanation [here](https://flaviocopes.com/update-npm-dependencies/).

## Upgrading node - Troubleshooting

- If you try to upgrade node, you might find yourself in a situation where despite the upgrade apparently being successful, you are still seeing the wrong version when you run `node -v` or `node --version` on the command line. This happened to me, and it turned out to be all about `nvm`. Here are my notes:
    - [Node upgrade details here](https://phoenixnap.com/kb/update-node-js-version)
        - I first used the [MacOS Installer](https://nodejs.org/en/download/current/), but it didn't work:
            - It said it had installed, but when I followed it up with `node --version` in Terminal, it was still saying I was on `13.10.1`. 
            - This remained true after restarting iTerm and then restarting my macbook
        - So then I tried installing via `n` (as recommended on [this page](https://phoenixnap.com/kb/update-node-js-version))
            - ...using these commands:
            - `npm cache clean -f`
            - `npm install -g n`
            - `sudo n stable`
        - ...but I still got `13.10.1` when I ran `node -v`. But then I noticed the feedback from the previous `sudo n stable` command:
            - `installed : v14.17.1 to /usr/local/bin/node`
            - `active : v13.10.1 at /Users/[username]/.nvm/versions/node/v13.10.1/bin/node`
        - It turns out I had `nvm` installed on my system (node version manager), which had the active version set to `13.10.1`. The solution was to use `nvm` to change versions, like this: `nvm install 14.17.1`

## Node Js and WSL

- You'll need [WSL 2](/pages/coding/dotnet/Windows-Subsystem-for-Linux---WSL), which you're [better off running in a VM](https://www.windowscentral.com/how-create-virtual-machine-using-hyper-v-test-windows-10-insider-builds) as long as it's still part of the Insider programme.
- Then follow the instructions [here](https://docs.microsoft.com/en-us/windows/nodejs/setup-on-wsl2).

## Debugging node in Visual Studio

### attaching directly via VS Code terminal

`node --inspect program.js`

where `program.js` is your entry point - in one project I worked for it was `server.js` (didn't actually need the `.js` - could just put `server`).

- Use Cmd + Shift + P to bring up the Visual studio code command palette and type in "toggle auto attach". If you're already debugging, you can turn auto attach on and off via the orange status bar at the bottom.

More [here](https://code.visualstudio.com/docs/nodejs/nodejs-debugging#_attaching-to-nodejs)

### Attach to node process

The Attach to Node Process action opens a Quick Pick menu that lists all potential processes that are available to the Node.js debugger. Access it with Cmd + Shift + P to bring up the Visual studio code command palette and type in "Attach to Node Process".

### Via npm

If you already have an npm command setup - eg in this example a `server` command in the `scripts` section of package.json, then the config below would go in launch.json (more [here](https://code.visualstudio.com/docs/nodejs/nodejs-debugging#_launch-configuration-support-for-npm-and-other-tools)).

Whenever you add a new config to launch.json, you get a new item in the dropdown top left next to the green Play / Debug button.

```
,
        {
          "name": "Launch via npm",
          "type": "node",
          "request": "launch",
          "cwd": "${workspaceFolder}",
          "runtimeExecutable": "npm",
          "runtimeArgs": ["run-script", "server"],
          "port": 9229
        }
```

## Node, proxies and IP addresses

* When you add an entry to the hosts file, you change the TCP request to convert a name into an ip address (eg this in your hosts file: “127.0.0.1 acme” … means that “acme” is converted to the IP address)

* But the thing you type into the browser is the thing that ends up in the host header on the http request (regardless of what’s in the hosts file)

* Therefore you want to type `acme`, NOT `127.0.0.1`

* This is because there is a node proxy running because we ran `make start-proxy` which uses `index.js` to analyse the http host header (see the makefile to see where the `start-proxy` command is configured).

  * `start-proxy` listens to your browser, checks the url, and sends it to the correct proxy (healthystockport or stockportgov) based on the url.

* Index.js example [here (accessible to Clare only)](https://github.com/claresudbery/samba), in the `proxy` sub-folder of the web-app project folder.

  * If you look at Index.js (in the proxy folder in webapp code), it says listen on port 5555 and then sets up the correct business Id based on that.

  * It then routes requests to port 5000.

* Makefile example [here (accessible to Clare only)](https://github.com/claresudbery/samba), in the web-app project folder.

* It then extracts the business Id (Eg “acme”) from the host header

* Be aware that the node proxy will not come into the equation unless you have added your url AND PORT NUMBER into the proxy exceptions in your browser settings

### Troubleshooting proxy settings

If you get a “connection refused” error when trying to visit your app in the browser:

* Change your proxy settings in Firefox:

  * Go to Settings | Options | Advanced | Network 
  * Click the Settings button in the “Connection” section
  * Make sure "Manual proxy configuration" is selected
  * Set the http proxy and port. To find the values you need, do this:
  * 1. Search for Network Proxy Settings in Windows
  * 2. Under Manual Proxy Setup, you will see an IP address and port number – these are the ones you want
  * Check the checkbox "Use this proxy server for all protocols"
  * Add whatever is needed to your list of exceptions (The “No Proxy for” box)

* Change your NO_PROXY environment variable (Windows | System Environment variables)
  * It should contain the same list as in your "No Proxy for" setting (see above)

* Check your hosts file