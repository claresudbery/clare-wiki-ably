---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/Vim
---
## Misc

  - Vim cheat sheet –
    [<span class="underline">http://hamwaves.com/vim.tutorial/images/vim.en.png</span>](http://hamwaves.com/vim.tutorial/images/vim.en.png)

  - If you make changes to \~/.vimrc and want to reload:
    
      - Type **:so $MYVIMRC**
    
      - ...but actually you can just type **$MY** and then tab to
        autocomplete.

  - Searching:
    
      - See separate section below

  - Navigate lines:
    
      - Go to end of line: $ or A (which also puts you in insert mode)
    
      - Go to start of line: 0
    
      - Remap Ctrl+a and Ctrl+e to take you to start / end of line while
        in Insert mode:
        [<span class="underline">https://coderwall.com/p/fd\_bea/vim-jump-to-end-of-line-while-in-insert-mode</span>](https://coderwall.com/p/fd_bea/vim-jump-to-end-of-line-while-in-insert-mode)

  - Navigate blocks delineated by {}, (), \[\], \<\> or “”
    
      - See separate section below

  - Navigate file:
    
      - Go to top of file: **gg**
    
      - Go to end of file: **shift + g**
    
      - Go to line number: **line-number + shift + g**
    
      - Navigation within chars / lines: j = down, k = up, h = left, l =
        right

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
        [<span class="underline">https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/</span>](https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)
    
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
        [<span class="underline">https://stackoverflow.com/questions/11723169/selecting-entire-function-definition-in-vim/11723259</span>](https://stackoverflow.com/questions/11723169/selecting-entire-function-definition-in-vim/11723259)

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

## Vertical columns of text (like alt click)

  - Select a vertical column of text (like using Alt + click in other
    text editors):
    
      - **Ctrl + v** takes you into “visual block” mode, then use the up
        and down arrows.
    
      - Commands like **x** will work instantly
    
      - But if you want to do something like substitute (**s**) or
        append (**A** only, **a** won’t work) or change (**c**), you
        need to execute the full command first - at which point it will
        look like it’s only worked on one line - and then press Esc
        twice - and finally your change will appear on multiple lines.
    
      - If you want to type replacement text, you use insert mode but it
        has to be **I** instead of **i** (upper case instead of lower
        case). As with **s**, **a** and **c** you won’t see the full
        effect until you exit Insert mode AND visual mode (press Esc
        twice).
    
      - To insert one vertical column of text in front of another one:
        
          - Go to the place you’re copying from
        
          - Use **ctrl+v** to go into visual block mode
        
          - Use **y** to copy the highlighted text
        
          - Go to your destination
        
          - Use **ctrl+v** to select a column of text consisting of the
            first character of the place you want your new column to go
            in front of
        
          - Use **I** to go into insert mode, and type one space
        
          - Press Esc, and you’ll see you have inserted a column of
            single spaces
        
          - Now use **ctrl+v** again to highlight the column of spaces
        
          - Use **p** to paste your original column selection
        
          - There is an explanation here for why you can’t do it without
            typing the extra space:
            [<span class="underline">https://stackoverflow.com/questions/31893732/vim-how-do-i-paste-a-column-of-text-from-clipboard-after-a-different-column-o</span>](https://stackoverflow.com/questions/31893732/vim-how-do-i-paste-a-column-of-text-from-clipboard-after-a-different-column-o)

## Navigate blocks delineated by {}, (), \[\], \<\> or “”

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

## Searching

  - Search: **/\[search term - regex\]**
    
      - Press n to get next search result
    
      - Press N to get previous search result
    
      - For case insensitive search, add **\\c** to the command (either
        at start or end)
    
      - If you then get highlighting which won’t go away, type **:noh**
        
          - For a more permanent solution which means you can clear it
            by hitting Esc, see here:
            [<span class="underline">https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting</span>](https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting)

  - Search and replace: **:%s/\[search term\]/\[replacement\]/g**
    
      - **%s** means whole file, **/g** means every occurrence on every
        line
    
      - If you want it to ask you for confirmation on every replacement,
        add **c** as well: **:%s/foo/bar/gc**
    
      - More here:
        [<span class="underline">https://vim.fandom.com/wiki/Search\_and\_replace</span>](https://vim.fandom.com/wiki/Search_and_replace)
    
      - And here:
        [<span class="underline">https://www.linux.com/learn/vim-tips-basics-search-and-replace</span>](https://www.linux.com/learn/vim-tips-basics-search-and-replace)
    
      - If your strings contain forward slashes, then you can replace
        the forward slashes in the command with any other character\!
    
      - For case insensitive search, add **\\c** to the command (either
        at start or end)
    
      - To do it on whole words only: **:%s/\\\<word\\\>/newword/g** -
        you have to delimit the word with \\\< and \\\>

  - f – find character on this line
    
      - Add a number to do multiple
    
      - Eg **2f\_**

  - \* Find the word under the cursor: **\***
    
      - This works on words containing underscores
    
      - By default it won’t work on words containing hyphens
        
          - You can change this by adding **set iskeyword+=-** to .vimrc
        
          - Or just type **:set isk+=-** in Vim

  - Find whatever text you have highlighted (in visual mode)
    
      - See solution here, which I have in both my vim configs:
        [<span class="underline">https://github.com/nelstrom/vim-visual-star-search/blob/master/plugin/visual-star-search.vim</span>](https://github.com/nelstrom/vim-visual-star-search/blob/master/plugin/visual-star-search.vim)
    
      - To use it, hit **v** to get in visual mode, highlight the yext
        you want to search for, then hit **\***

## Less + Vim

  - Shift g – end of file

  - gg – top of file

  - up and down arrows – scroll

  - Ctrl b – page up (b = backwards)

  - Ctrl f – page down (f = forwards)

  - q - exit

  - / - search
    
      - \! Uses regex which means you have to escape special characters
        like ( and )
    
      - Press n to get next search result
    
      - Press N to get previous search result
