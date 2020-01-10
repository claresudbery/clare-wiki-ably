---
layout: page
categories: organising BigIndex
location: "pages/organising/BigIndex/"
permalink: /pages/organising/BigIndex/Big-Index-Useful-Tools
---

## Pandoc

* Converting a word doc: 

{% highlight bash %}
pandoc -t gfm --extract-media . -o "/C/Users/CLARE/OneDrive/TW Stuff/Ongoing Updates/Etsy-toc.md" "/C/Users/CLARE/OneDrive/TW Stuff/Ongoing Updates/Etsy.docx"

pandoc -t gfm --extract-media . -o "/C/Users/CLARE/mydoc.md" "/C/Users/CLARE/mydoc.docx"

{% endhighlight %}