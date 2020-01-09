---
layout: post
categories: jekyll howto
---

## Configuration
Front matter defines the look of every page on your site.  

## In posts
You see it at the top of each post file and indeed every markdown file (including index and abhout in the root), delineated by two "---" lines at the start and end. So you can edit title and date in the front matter section at the top of the post file.  

## Date and time
Note: You can miss out the time and only leave the date if you want. You can even miss out the date altogether, in which case it seems to pick it up from the name of the post file. But if you don't include the date in the file name, you lose it altogether.

## Categories
The categories will determine what folder the file lives in when published (so, where the html file is in the _site folder).  
For instance, if categories are set to "jekyll update" and the date is 2020-01-08, then the html file will end up in _site/jekyll/update/2020/01/08.

## Front Matter variables - default and custom
You can add a new variable in the front matter section at the top of your post. The defaults are 

* layout 
  * there are three layout values by default - post (used by posts), page (used by about page) and home (used by index)
* title
* date
* categories
* permalink 
  * used by about page and index  

If you add a new one, you will be able to refer to it in your layouts.