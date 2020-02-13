---
layout: page
location: pages/aanew/leaf
permalink: /pages/aanew/New-Acme-Stuff
---
  


## Vim
### Misc
  - [Vim cheat sheet](http://hamwaves.com/vim.tutorial/images/vim.en.png)
  - Great [online “Vim Adventures” game](https://vim-adventures.com/) you can use to learn Vim:
  - If you make changes to \~/.vimrc and want to reload:
      - Type **:so $MYVIMRC**
      - ...but actually you can just type **$MY** and then tab to
        autocomplete.
  - Searching:
      - See separate section below
  - Navigating files, lines, blocks
      - See separate section below
  - Copy / paste:
      - Copy current line (“yank”): **yy -** which is the same as **Y**
      - Paste current line below the line you are on (“put”): **p**
      - To replace one line with another: **Y** to yank a line, then go
        to the line you want to replace and type **Vp**
          - **V** puts the whole line into visual mode, and then **p**
            pastes the register into the visual selection (the whole
            line).
  - Append, Substitute and Change
      - Append is **a** to append after current character or **A** to
        append at end of line
          - (puts you into insert mode)
      - Substitute is **s** to substitute current character and **S** to
        substitute current line
          - (puts you into insert mode)
      - Change is **c** to replace whatever you specify - eg aw for a
        word, iw for inner word (word without leading space)
          - (puts you into insert mode)
          - **C** is to replace from cursor to end of line
          - See also separate section below on navigating blocks
  - Select a vertical column of text (like alt click)
      - See separate section below
  - Text objects:
      - **aw** is a word
      - **iw** is an inner word
      - **daw** means delete a word
      - More here:
        <https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/>
      - In Vim adventures, try **:help aw**
  - To see line numbers: **:set number**
      - To make that change (or any other change) permanent:
          - Cmd: vim \~/.vimrc
          - Type the line **:set number** into the file
          - It will take effect immediately
      - To turn line numbers off temporarily (for copy/pasting): **:se
        nonu** (then **:se number** to turn them back on again)
  - Do one command while in Insert mode, then return to Insert mode:
    **Ctrl + o**
      - This takes you to normal mode for one command
  - Most commands in vim take a function and then an argument
      - Eg j is a movement argument – so dj is the delete command with a
        “down” argument
      - Commonly repeat the function if there is no argument – so dd
        means just delete
  - **u** - undo
  - **Ctrl + r** - Redo
  - **o** – insert new line below (Shift + o = above)
      - Note this will also put you in insert mode
  - Tab (indent) left or right: \< and \> - eg \<\< to just tab left
      - To indent a whole block: Use **v** to go into visual mode, then
        up and down keys to select lines, then **\<** and **\>** to
        indent in or out
  - Select an entire function definition
      - I used **a{** and **i{** but I never got quite what I wanted
      - I think the answer might lie here but I didn’t have the patience
        to read through all the suggested solutions:
        <https://stackoverflow.com/questions/11723169/selecting-entire-function-definition-in-vim/11723259>
  - Set to use spaces instead of tabs
      - Cmd: **:set expandtab ts=2 sw=2**
      - Ts = tabstop
          - Note this means that you can use the tab command and it will
            automatically insert 2 spaces
          - It also defines how he file will be displayed if it contains
            tab characters
      - Sw = Shiftwidth
          - Something to do with what happens when you press enter, -
            automatic indentations?
  - Multiples
      - Add number at start
      - Eg **2f\_** - find the second instance of underscore on this
        line
  - Delete characters – x
  - d – delete line
      - **dd** – delete current line
      - **4dd** – delete 4 lines
      - **dG** - Delete all lines from current line to end of file
      - **Shift+d** – delete to end of line
      - **Shift+c** – delete to end of line and go into insert mode
      - **dw** – delete a word
  - Vim: J to join text that’s split across lines to turn it into one
    long string
      - Eg This...
          - Hey
              - Hello
                  - You
              - And also
          - Goodbye
      - ... becomes this:
          - Hey Hello You And also Goodbye
  - Replace current word with contents of register: **v i w p**
      - **v** is visual mode
      - **iw** is inner word
      - **p** is put

### Navigating files, lines, blocks
  - Navigate lines:
      - Go to end of line: $ or A (which also puts you in insert mode)
      - Go to start of line: 0
      - Remap Ctrl+a and Ctrl+e to take you to start / end of line while
        in Insert mode:
        <https://coderwall.com/p/fd_bea/vim-jump-to-end-of-line-while-in-insert-mode>
  - Navigate file:
      - Go to top of file: **gg**
      - Go to end of file: **shift + g**
      - Go to line number: **line-number + shift + g**
      - Navigation within chars / lines: j = down, k = up, h = left, l =
        right
  - Navigate blocks delineated by {}, (), \[\], \<\> or “”
  - The diff between **%** and **\[{** always confuses me cos it’s not
    explained well in Vim Adventures:
      - **%** will take you to the matching bracket if you are already
        ON a bracket. It only works on {}, () and \[\] (not \<\>)
      - **\[{** will search backwards for the enclosing { if you are
        already IN a {} block - so it takes you to the start of your
        current scope
          - **\]}** will move forwards and take you to the end of your
            current scope
          - **\]{** is meaningless (I think)
          - **\[(** and **)\]** will also work in the same way
          - **\[\<** does not work, **\[“** does not work, and **\[\[**
            does something totally different
          - If you want to move back to blocks that enclose your current
            block, use numbers
              - So for instance, **3\[{** will take you to the beginning
                of this snippet of code if your cursor is in the
                innermost scope:
              - {
                  - {
                      - {I am here}
                  - }
              - }
          - In Vim Adventures type **:help \[{**
  - If you want to navigate inside a block delineated by \[\], \<\> or
    “”
      - You can use % to find the matching brace if you are on \[ or \]
        but not \< or \>
      - You can use visual mode to select the contents of {}, \[\], (),
        \<\> or “”
          - Use a to select the contents AND the delineators
          - Use i to select the inner contents (ie without the
            delineators)
          - Use the OPENING delineator to indicate what your scope is
          - These are all the possible commands: **va{, vi{, va\[, vi\[,
            va(, vi(, va\<, vi\<, va", vi"**
          - If you want to select blocks that enclose your current
            block, use numbers
              - So for instance, **v3a{** will select this whole snippet
                of code if your cursor is in the innermost scope:
              - {
                  - {
                      - {I am here}
                  - }
              - }
          - Once you’re in visual mode you can use commands like **i, p,
            c, a, s**
          - In Vim Adventures type **:help a{** or **help i{**
      - You can use **c** to select the contents of {}, \[\], (), \<\>
        or “” and then it will put you into Insert mode to replace what
        was there
          - Same principles as with v (see above)
          - These are all the possible commands: **ca{, ci{, ca\[, ci\[,
            ca(, ci(, ca\<, ci\<, ca", ci"**
          - As with **v** you can use numbers to select multiple
            enclosing blocks (see above) but the number comes BEFORE
            **c**, like this: **3ca{**
          - (There are others too, like **caw** and **ciw** for words -
            in Vim Adventures type **:help aw** and **:help iw**)

## Terminal commands
### Installing scripts
  - Copy script into \~/scripts folder
  - Edit PATH env var to include scripts folder
      - Put something like this into something like \~/.bashrc or
        \~/.zshrc: **export PATH=$PATH:/Users/your-user-name/scripts**
      - (see section on env vars below for more details)
  - If you include this line at the top of your script, it means you
    don’t have to use the “sh” command when you run the script on the
    command line:
      - This: **\#\!/bin/bash**
      - You also have to do this: **chmod +x /path/to/script**
  - Don’t give your script an extension, just add to path and it will
    become a command
      - (see section on bash scripts)

### Watch command
  - Use “watch” to make a command happen every 2 seconds
  - Use -n interval to tell it how often
  - Like this: **watch 'curl -s
    csudbery:\[password\]@xxx.Acmecorp.com:9200/\_cat/recovery | grep
    -v done'**
      - Or like this: **watch curl "http://10.266.8.66"**
      - Notice the first example needed quotes because it wasn’t just a
        simple command + argument, but the second works fine as it is.
      - That first example is doing the following: Curl the SoxElk
        endpoint using creds because it’s extra locked down. Pipe the
        result to grep, where you are EXCLUDING entries marked done (-v
        means exclude). Keep curling every 2 seconds and watch the
        results - that way you can see the number of not-done-yet
        recovery items gradually subside.
  - You can also get it to show you differences between each execution
    by adding a -d switch, like this: **watch -d ‘curl \[rest of
    command\]’**

## Bash Scripts
### Misc
  - if statement - the spaces matter\! **if \[\[ $NumDifferences \!= 0
    \]\]; then ... fi**
  - Bash scripts:
<!-- end list -->
  - **set -x** - also works on the command line - outputs every command
    that’s run to the command shell - include nested commands - useful
    for debugging (output all)
      - **set -e** - stops running on any error (also works on the
        command line)
<!-- end list -->
  - If you include this line at the top of your script, it means you
    don’t have to use the “sh” command when you run the script on the
    command line:
      - This: **\#\!/bin/bash**
      - You also have to do this: **chmod +x /path/to/script**
  - You don’t have to give your script an extension
      - So for instance if you just call it winpath instead of
        winpath.sh, and you have it in your path, then you can run it as
        a **winpath** command from anywhere.
      - This is preferable to adding functions to your bashrc file.
