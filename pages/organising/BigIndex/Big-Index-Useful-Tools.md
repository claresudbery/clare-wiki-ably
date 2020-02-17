---
layout: page
categories: organising BigIndex
location: "pages/organising/bigindex/leaf"
permalink: /pages/organising/bigindex/Big-Index-Useful-Tools
---
 
## Other technologies considered for BigIndex

- Boostnote (quite limited and not cross platform)
- Alex's clare-bot (needed quite a lot of work and only worked in Slack)
- [dokuwiki](#dokuwiki)
- [Simple Note](https://blog.danhhz.com/simplenote-934cb2a5e50b), the one Joe Ray found for me
- [Bear](https://bear.app/) - shown to me by Phil from TW but only works on Mac / iOS
- [Notion](https://www.notion.so)
  - "I've been exploring [Notion](https://www.notion.so) for the last few months and found it to be excellent at most of the things you're looking for. But the advanced features of databases with custom views, functions, etc are what I'm really enjoying the most."
  - "If you want a good idea of what you can do with it - Here's a good [YouTube video that turned me onto it](https://youtu.be/m9S5I3pWz94)."

### Dokuwiki

- [Set up an Apache web server in AWS](https://docs.aws.amazon.com/efs/latest/ug/wt2-apache-web-server.html)
- [Configure an Apache web server](https://opensource.com/article/18/2/how-configure-apache-web-server)
- [Install dokuwiki](https://www.dokuwiki.org/install)
		
## Migrate Evernote notes as plain text or markdown
* Here: http://www.markwk.com/migrate-evernote-plaintext.html

## Suggested markdown editors 

- for iOS: [iAWriter and Working Copy](https://thesweetsetup.com/apps/our-favorite-markdown-writing-app-for-the-iphone/)
    - See also notes on how to use iAWriter
- For Mac / Windows: 
    - Visual Studio Code
    - Byword (Mac only?)
    - Visual Studio [MarkdownEditor Extension](https://marketplace.visualstudio.com/items?itemName=MadsKristensen.MarkdownEditor)

## Generating Table of Contents (TOC)

I'm using [jekyll-toc](https://github.com/allejo/jekyll-toc/), but I had to make an amendment to remove strange chars at the start of every list item. See [commit 34b357f](https://github.com/claresudbery/clare-wiki-ably/commit/34b357f).

I also made another amendment to add a heading to each toc: [commit ebb8600](https://github.com/claresudbery/clare-wiki-ably/commit/ebb8600).

Other possible tools:

- [Simple online tool that will generate a markdown table of contents](https://ecotrust-canada.github.io/markdown-toc/)
- [command line tool for non-Jekyll markdown files (gh-md-toc)](#gh-md-toc-command-line-tool)    
- [python tool](https://gist.github.com/live-wire/fdcd9adaf4738fcabb0af47a28b7b279)
    - "Use toc.py which is a tiny python script which generates a table-of-contents for your markdown.
    - Usage:
    - In your Markdown file add <toc> where you want the table of contents to be placed.
    - `$python toc.py README.md` (Use your markdown filename instead of README.md)

### gh-md-toc Command Line Tool

I didn't need this on the Jekyll site, but I did need it in my GitHub markdown site.

I use the following call on the command line to run the toc script on all markdown files in all subfolders from your current location:

```
find . -name "*.md" -exec gh-md-toc --insert {} ";"
```

I got this tool from [here](https://github.com/ekalinin/github-markdown-toc), but I made a few changes:

- I used sed to remove all text between two patterns: https://stackoverflow.com/questions/6287755/using-sed-to-delete-all-lines-between-two-matching-patterns
    - I used this command: 
```
sed -i '/^<!--ts-->/,/^<!--te-->/{/^<!--ts-->/!{/^<!--te-->/!d};}' ./notes/Scratch.md
```
- I made it idempotent: Every time you run it, it will either create a new toc or update the previous one (by removing and replacing it).
- I fixed a problem where every element of the TOC was indented by one tab too many.
- I fixed a problem with multiple files where if any file without the toc markers was found, the whole script terminated and subsequent files were not processed.
- I stopped it from creating two new files for every file processed (one containing the original content and one containing just the toc)
- I made it work in Windows (where line endings were preventing it from working)
- I added a heading at the top of each table of contents.
- I stopped adding a footer with date/time at the end of every toc - this was causing my files to appear updated (in source control) every time I ran the script, even when the toc hadn't actually been updated.

My version of the script can be found [here](/resources/scripts/gh-md-toc).

## Pandoc

* [Pandoc](https://pandoc.org/)
* [Installing Pandoc](https://pandoc.org/installing.html)
* Issues:
    * Unnecessary blank lines are created between bullet points
        * I orignally solved this in [wiki-doc-convert](/resources/scripts/wiki-doc-convert) using the sed command `sed -i '/^[[:space:]]*$/d' $md_path`, but that didn't work because Jekyll couldn't parse sub headings with no proper line break (or something). I dunno but anyway all the sub headings got lost when Jekyll rendered the markdown. I
        * Instead I used a `lua` solution, also in [wiki-doc-convert](/resources/scripts/wiki-doc-convert) - [see below](#lua-solution-to-pandoc-inserting-blank-lines-between-bullet-points)
    * Can I append the resulting markdown to an existing markdown file, instead of creating a new file?
* Converting a word doc: 

{% highlight bash %}
pandoc -t gfm --extract-media . -o "/C/Users/CLARE/mydoc.md" "/C/Users/CLARE/mydoc.docx"
{% endhighlight %}

Clare-specific notes available [here](https://github.com/claresudbery/clare-tech/blob/master/organising/BigIndex/Big-Index-Useful-Commands.md) (accessible to Clare only).

### Lua solution to pandoc inserting blank lines between bullet points

From John Macfarlane in the pandoc-discuss Google group:

You could use a `lua` filter; it would have to replace
list items that consist of a single Para element with
list items that consist of a single Plain element.

This filter will do it:

```

paraToPlain = {
    Para = function(el)
      return pandoc.Plain(el.content)
    end
}

function BulletList(el)
  return pandoc.walk_block(el, paraToPlain)
end

```

Save that as `tightenLists.lua` and use `--lua-filter tightenLists.lua` on your command line.

## Scripts for creating markdown files (and converting from Word to markdown)

I've created the following scripts to help me create markdown files and folders quickly for this site.
Private Clare notes [here](https://github.com/claresudbery/clare-tech/blob/master/organising/BigIndex/Big-Index-Useful-Commands.md).

- [wiki-doc-convert](/resources/scripts/wiki-doc-convert) - converts Words docs to Wiki markdown (uses pandoc)
- [docx-md-append](/resources/scripts/docx-md-append) - converts Word docs to Wiki markdown (using pandoc) then appends the resulting markdown to a specified md file
- [wiki-folder](/resources/scripts/wiki-folder) - creates a new wiki folder plus index.md
- [wiki-page](/resources/scripts/wiki-page) - creates a new wiki page
- [wiki-page-insert](/resources/scripts/wiki-page-insert) - Inserts wiki front matter into a pre-existing markdown file

## Scripts Used for RefactoringExamples

- See [RefactoringExamples repo](https://github.com/claresudbery/RefactoringExamples/blob/master/github-markdown/notes/code-changes.md) (private only, I'm afraid).

## Copying data from a Google Drive to other storage

- Put everything in one folder
- Right-click that folder and choose Download
- It will download a zipped copy of your folder
- AND it will convert all Google docs and sheets into Word docs and Excel sheets

## Converting Chrome bookmarks to markdown

I used this tool: [Bookmarker](https://github.com/lubien/bookmarker)

### Installing Bookmarker in Ubuntu in WSL: 

```
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir
mix escript.install github lubien/bookmarker
export PATH=$PATH:/home/claresudbery/.mix/escripts
```

### Running Bookmarker 

- Note that the input it expects is your current Chrome bookmarks file, which is in an entirely different format to any exported html bookmarks files).  
- In Windows you'll find it somewhere like here: C:\Users\CLARE\AppData\Local\Google\Chrome\User Data\Default\Bookmarks.  
- If you have separate Chrome profiles, their bookmarks will be somewhere like `C:\Users\CLARE\AppData\Local\Google\Chrome\User Data\Profile 2`.  
- `Bookmarks` is the file - it has no file extension - it's not a folder. 
- I've stored bookmarks files [here](https://github.com/claresudbery/clare-tech/tree/master/resources).
- Run the command below.
- !! It didn't actually work when I tried it - I got an error "** (KeyError) key :sort not found in: %{"children" => [etc]"
  - See GitHub issue [here](https://github.com/lubien/bookmarker/issues/23).

```
bookmarker -o "./resources/bookmarks.md" --file "./resources/bookmarks"
```

## Inserting new reference data from a spreadsheet

I have a [spreadsheet]() (only available to me) which contains a list of references I want to add as content. It uses the formulas listed below to convert spreadsheet data into an insertion script, creating new pages and folders where necessary.

It's a semi manual process (I have to [sort the spreadsheet appropriately](/pages/coding/data/Google-Sheets#sorting) and then copy from spreadsheet columns into scripts), but it's v useful.

The spreadsheet formulas are explained in my Google Sheets section [here](/pages/coding/data/Google-Sheets#string-manipulation).

**Creating new folders**

`=IF(E2="Yes","",CONCATENATE(IF(B2="wiki","wiki-folder ","tech-folder "),LEFT(C2,LEN(C2)-FIND("/",REVERSE(C2)))," ",RIGHT(C2,FIND("/",REVERSE(C2))-1)," ",D2))`

Example output: **wiki-folder pages/coding/infra testing Testing**

**Creating new pages**

`=IF(H31="Yes","",CONCATENATE(IF(B31="wiki","wiki-page ","tech-page "),C31," ",G31," ",F31))`

Example output: **wiki-page pages/coding/lang/oo cpp C-Plus-Plus**

**Inserting new content**

`=CONCATENATE("new-ref ",C53,"/",G53,".md ","'- ",IF(IFERROR(FIND("http",L53)=1,0),CONCATENATE("[",I53,"](",L53,")"),CONCATENATE(I53,": ",L53)),"'")`

Two example outputs: 

```
new-ref pages/coding/lang/oo/csharp.md '- [C# string concatenation](https://docs.google.com/document/d/1uibHxv2kiuS5kgQxJHKEY1ET9LeSK-2V/edit)'
new-ref pages/coding/webdev/js/javascript-resources.md '- Ext JS stuff: Dropbox\IT Training\JS Stuff\SampleExtJSApp.zip'
```