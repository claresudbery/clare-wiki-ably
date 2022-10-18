---
layout: page
location: pages/coding/webdev/js/leaf
permalink: /pages/coding/webdev/js/TypeScript
---

## Getting started with typescript in VS Code

Run the following command on the comand line:

```
npm install -g typescript
```

Now you can transpile typescript files into javascript by running `tsc filename.ts` on the command line (see section below on how to automate this).

If you get permission errors when you run the `npm install -g typescript` command, here's what do do:

If on Mac:

- Add `sudo` to the front of the command, like this: `sudo npm install -g typescript`
- ("sudo" stands for "super-user do")
- (You can also use `sudo !!` but only if you do it immediately after the `npm install -g typescript` command. `sudo !!` means "run the command I just ran, but this time with super-user privileges")

If on Windows:

- Close down VS Code
- Use the main Windows search function to find Visual Studio Code, but...
Instead of just clicking on it like you normally would, right-click on it and select "Run as administrator"
- Click Yes when it asks you if you're happy for it to make changes
- Back in VS Code, open up the terminal again
- Run the following command:

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

- Run the `npm install -g typescript` command again. It should work this time.

!! Remember that every time you change the source code you have to recreate the javascript. So for instance every time you edit `source.ts` you have to run `tsc source.ts` again. This is why my code failed the last time I ran the tests in class. The clue is when the test failure message references the javascript version of the file (`source.js` instead of `source.ts`) ... and you think "but I already fixed that code!" (but see below on automation)

## Automate transpilation in VS Code

See [this article](https://code.visualstudio.com/docs/typescript/typescript-compiling).

