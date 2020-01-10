---
layout: page
categories: coding webdev jekyll 
location: "pages/coding/webdev/jekyll/leaf"
permalink: /pages/coding/webdev/jekyll/How-to-do-Jekyll-(File-Locations)
---

## Posts

The file name is key. There is a convention that you have to follow: each file in the _posts folder must be called yyyy-mm-dd-some-words.md (eg 2019-01-08-my-post.md). This will have an impact on what the file is called and where it lives. If you break this convention the file won't be generated at all.

There is an individual html file generated for each post. They're placed in the _site sub-folder, in nested sub-folders defined by date, file name and categories. For instance, if categories are set to "jekyll update" and the date is 2020-01-08, then the html file will end up in _site/jekyll/update/2020/01/08. Its file name will be based on the file name after the date component (this will also determine the title of the file unless you override it in the title variable of the front matter).

## Root pages

If a page has a permalink set in its front matter, and if the permalink has a nexted route (eg folder/subfolder) then appropriate folders will be created. If there is no nested route, then the permalink will have a folder created in the root and the file itself will be named index.html. Otherwise the file is named after the route and created in a folder to match the rest of the route. The home page has no sub-folder and is just called index.html.

## Folders in your _posts folder

You can create as many folders as you like to organise your content. Be aware it won't actually have any impact on the url or the location of the html file - those are determined by file name and front matter settings.