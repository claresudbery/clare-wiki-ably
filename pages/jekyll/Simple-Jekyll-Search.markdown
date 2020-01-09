---
layout: post
categories: jekyll howto
---

I'm using [Simple Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search) to do searching (came from Ably originally). 

## Basic Description

I struggled to follow the explanations in the [Simple Jekyll Search wiki](https://github.com/christian-fei/Simple-Jekyll-Search/wiki) until I dug into it a bit. Here's how it works:

* Search.json defines what's returned in the search results.
* You can pass in config options by sticking some javascript in your html. At the time of writing ([commit 048c7b6 in clare-wiki-ably](https://github.com/claresudbery/clare-wiki-ably/commit/048c7b6f110b3225a107cafc76702bbe8fc8219e)), this is living in _layouts/default.html. It lives inside a <script> tag and looks like this: **window.simpleJekyllSearch = new SimpleJekyllSearch**.
* This config can then refer to further scripts, for instance at time of writing it refers to another script - showSearchResults - defined in the same file.
* The searchResultTemplate value defined in the config (see above) defines how each search result will look, and can refer back to the stuff defined in search.json.
* You can configure a full text search - see [instructions here](https://github.com/christian-fei/Simple-Jekyll-Search).

## An example of tweaking it

To configure it to do cool stuff with categories and tags, you can add a category element into the json that defines the search results, and then refer to it in default.html or wherever you're displaying your search results.

See [commit 048c7b6 in clare-wiki-ably](https://github.com/claresudbery/clare-wiki-ably/commit/048c7b6f110b3225a107cafc76702bbe8fc8219e) for an example of where I started playing with this (then I abandoned it because I didn't have the time to make it work properly).

