---
layout: page
location: "pages/coding/webdev/js/leaf"
permalink: /pages/coding/webdev/js/Node-JS
---

## Useful tools

- [Top 10 VS Code extensions for Node js](https://developer.okta.com/blog/2019/05/08/top-vs-code-extensions-for-nodejs-developers)

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

