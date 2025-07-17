---
layout: page
location: pages/coding/webdev/js/leaf
permalink: /pages/coding/webdev/js/TypeScript
---

## Useful links

- [typescript tutorial](https://www.w3schools.com/typescript/index.php)

## Getting started with typescript in VS Code

Run the following command on the comand line:

```
npm install -g typescript
```

Now you can transpile typescript files into javascript by running `tsc filename.ts` on the command line (see section below on how to automate this).

If you get permission / script errors when you run the `npm install -g typescript` command or when you run the `tsc` command, here's what do do:

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

### Simple all-in-one instructions

(See sections below for more detail)

- Add / edit a `settings.json` file in your `.vscode` folder (if you don't have one, just create it)
  - It should look like this (if you already have this file, just add the "files.exclude" section):

```
{
  "files.exclude": {
    "**/*.js.map": true,
    "**/*.js": { "when": "$(basename).ts" },
    "**/**.js": { "when": "$(basename).tsx" },
  }
}
```

- Add a `tsconfig.json` file to the root of your project
  - Put the following inside that file:

```
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "sourceMap": true
  }
}
```

- Terminal => Configure Default Build Task
  - Select `tsc: watch` from the list
    - You might have to scroll down a bit
  - This will create a `.vscode` folder (if you don't have one already)
    - and create or edit the `tasks.json` file 
- Now you can just use Ctrl + Shift + B to start automatic transpilation
  - This will make it seem like you can't run anything else in the terminal, but you can: 
  - Terminal => New Terminal
  - Now you can (for instance) get automatic tests running with `npm run test:char` (if you've set up the ["scripts" section in `package.json`](/pages/coding/tools/testing/jest.md#running-only-subsets-of-tests))
  - You now have two terminal windows open, but that's not immediately obvious
  - If you look to the right hand side of your Terminal panel, there's an extra bit that lists "watch - tsconfig.json" and something else (for `npm run test` it'll say "node")
  - Just select whichever one you're interested in (which is most likely the test runner)
  - If you want to open up yet another terminal, just use Terminal => New Terminal again, and you'll get another one listed on the right. You can switch between all of them.

### Getting started

- Add a `tsconfig.json` file to the root of your project
- Put the following inside that file:

```
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "sourceMap": true
  }
}
```

### To transpile all your typescript files

- Terminal => Run Build Task (Ctrl + Shift + B) 
- then select `tsc:build` from the menu 
  - you might have to scroll down to the bottom of the list of options
    - but once you've selected it, it will float up to the top of the menu next time
  - (See [default build task](<#set as default build task>) for how to avoid selecting from menu)
- This will create a `*.js` and a `*.js.map` file for each of your typescript files.
  - sourceMap files (`*.js.map`) allow you to focus on your typescript files even though the actual underlying code is in a javascript file.
- (See below for how to get it happening automatically)

### Automatic transpilation

- To transpile all typescript files automatically every time you change them, with no manual intervention needed:
- Terminal => Run Build Task (Ctrl + Shift + B) 
- then select `tsc:watch` from the menu 
  - you might have to scroll down to the bottom of the list of options
    - but once you've selected it, it will float up to the top of the menu next time
  - (See [default build task](<#set as default build task>) for how to avoid selecting from menu)
- This will create a `*.js` and a `*.js.map` file for each of your typescript files, every time you edit any file.
  - sourceMap files (`*.js.map`) allow you to focus on your typescript files even though the actual underlying code is in a javascript file.
- !! If you have constant tests running in the background as well as automatic transpilation:
  - eg if you're using something like `npm run test`
  - You now have two terminal windows open, but that's not immediately obvious
  - If you look to the right hand side of your Terminal panel, there's an extra bit that lists "watch - tsconfig.json" and something else (for `npm run test` it'll say "node")
  - Just select whichever one you're interested in (which is most likely the test runner)
  - If you want to open up yet another terminal, just use Terminal => New Terminal and you'll get another one listed on the right. You can switch between all of them.

### Put js and js.map files somewhere out of sight

- To stop your folder getting cluttered with .js and .js.,ap files...
  - Add an `outDir` line to your `tsconfig.json` file.
  - This will mean that the extra files are created in an `out` folder
  - Like this:

```
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "sourceMap": true,
    "outDir": "out"
  }
}
```

- Unfortunately if you have already transpiled some typescript before you make this change, the old files will still be there as well as the new ones in the `out` folder
  - You can just delete the old files
- Also, if you make this change and you're using a command to run tests only in one folder, it will mess with that
  - It's all about the `package.json` ["scripts" setting](/pages/coding/tools/testing/jest.md#running-only-subsets-of-tests)
  - It should be possible to fix this with the right regex in the `testPathPattern` section, but I couldn't get this working because I'm hopeless at regex
    - I asked a Stack Overflow question about it [here](https://stackoverflow.com/questions/74141047/how-to-create-simple-readable-regex-that-matches-either-of-two-possible-file-pat)
  - So in the end I gave up and used the [making files invisible](<#making derived files invisible in vs code>) method.  
- An alternative to this method is to [make derived files invisible](<#making derived files invisible in vs code>).

## Making derived files invisible in VS Code 

- Add a `settings.json` file in your `.vscode` folder (if you don't have one, just create it)
- It should look like this:

```
{
  "files.exclude": {
    "**/*.js.map": true,
    "**/*.js": { "when": "$(basename).ts" },
    "**/**.js": { "when": "$(basename).tsx" },
  }
}
```

- For more detail, see ["Hiding derived JavaScript files"](https://code.visualstudio.com/docs/typescript/typescript-compiling#_hiding-derived-javascript-files) for how to do this.
  - But it doesn't have the extra setting for `.map` files (see above).

### Set as default build task

- To avoid having to select what you want from the menu whenever you do Ctrl + Shift + B (Terminal => Run build task):
  - Terminal => Configure Default Build Task
  - Select `tsc: watch` or `tsc: build` 
    - You might have to scroll down a bit
    - This works for both `tsc: build` and `tsc: watch`
  - This will create a `.vscode` folder (if you don't have one already)
    - and create or edit the `tasks.json` file 
  - Now you can just use Ctrl + Shift + B to either run all transpilations or start automatic transpilation
  




