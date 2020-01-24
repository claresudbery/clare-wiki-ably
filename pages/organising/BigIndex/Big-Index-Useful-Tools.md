---
layout: page
categories: organising BigIndex
location: "pages/organising/BigIndex/leaf"
permalink: /pages/organising/BigIndex/Big-Index-Useful-Tools
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
- [command line tool (gh-md-toc)](https://github.com/ekalinin/github-markdown-toc)
    - use sed to remove all text between two patterns: https://stackoverflow.com/questions/6287755/using-sed-to-delete-all-lines-between-two-matching-patterns
- [python tool](https://gist.github.com/live-wire/fdcd9adaf4738fcabb0af47a28b7b279)
    - "Use toc.py which is a tiny python script which generates a table-of-contents for your markdown.
    - Usage:
    - In your Markdown file add <toc> where you want the table of contents to be placed.
    - `$python toc.py README.md` (Use your markdown filename instead of README.md)