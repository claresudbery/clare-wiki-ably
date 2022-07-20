---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/Visual-Studio-Code
---
## Visual Studio Code (VS Code) - Misc

  - Keyboard shortcut cheat sheet:
    [<span class="underline">http://donovanbrown.com/post/visual-studio-code-keyboard-shortcut-cheat-sheet</span>](http://donovanbrown.com/post/visual-studio-code-keyboard-shortcut-cheat-sheet)
    
      - (it’s for Windows so replace Ctrl with Cmd)

  - Ctrl + p / Cmd + P search for a file name (and also commands and
    other stuff I think)

  - Cmd + Shift + F - Find in files

  - Cmd + o - open a file (but it has to be recently opened or already
    open?)

  - Cmd + shift + o - search for a symbol

  - Select vertical column of text: 
    - Place the cursor where you want it
    - hold down Shift + Alt , then click and drag with the mouse

## Debugging

- If you want to debug code in VS Code, you need a `launch.json` file. 
- Click the Play button over on the left, and you'll see text saying something like "To customize Run and Debug create a launch.json file". If you click the link, it will create one for you.
- You might then want to add new configurations for new languages (eg Ruby) - to do that, click the link under "Show all automatic debug configurations"  and then click "Add configuration".
- If you're configuring debugging for Ruby, there are some extra instructions [here, under the link to Debugging Ruby with breakpoints](http://127.0.0.1:4000/pages/coding/lang/oo/Ruby#tutorials-and-guides) 

## Copy/paste - don't copy source formatting by default

- When you try to copy/paste from VS Code to other editors (eg MS Word), it brings ALL source formatting with it - including background colour.
- Turning this off is not trivial! But it is possible.
- First find your `settings.json` file. 
    - On a Mac, note that there is a space in the path
    - Also on my Mac I have VSCode insiders, which also has a space in the path
    - This command will open it for editing on my Mac: `vim "$HOME/Library/Application\ Support/Code - Insiders/User/settings.json"`
    - [More info on path here](https://code.visualstudio.com/docs/getstarted/settings)
- Now edit the file to add the following line, within the curly brackets: `"editor.copyWithSyntaxHighlighting":false`
- [More info here](https://stackoverflow.com/questions/44461520/how-to-turn-off-copy-with-syntax-highlighting)
- Mine looks like this:

```
{
    "editor.copyWithSyntaxHighlighting":false
    "files.autoSave": "afterDelay"
}
```