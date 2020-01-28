---
layout: page
categories: organising BigIndex
location: "pages/organising/bigindex/leaf"
permalink: /pages/organising/bigindex/Big-Index-Useful-Tools
---

## Pandoc

* Converting a word doc: 

{% highlight bash %}
pandoc -t gfm --extract-media . -o "/C/Users/CLARE/mydoc.md" "/C/Users/CLARE/mydoc.docx"
{% endhighlight %}

Clare-specific notes available [here](https://github.com/claresudbery/clare-tech/blob/master/organising/BigIndex/Big-Index-Useful-Commands.md) (accessible to Clare only).
		
## Migrate Evernote notes as plain text or markdown
* Here: http://www.markwk.com/migrate-evernote-plaintext.html

## Suggested markdown editors 

- for iOS: [iAWriter and Working Copy](https://thesweetsetup.com/apps/our-favorite-markdown-writing-app-for-the-iphone/)
- For Mac / Windows: 
    - Visual Studio Code
    - Byword (Mac only?)

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

My version of the script can be found [here](/resources/gh-md-toc).