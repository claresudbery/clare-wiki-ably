---
layout: page
categories: coding webdev jekyll 
location: "pages/coding/webdev/jekyll/leaf"
permalink: /pages/coding/webdev/jekyll/How-to-do-Jekyll-(Misc)
---

## Liquid templating laguage

All the stuff you see surrounded by squigglybracket-percent tags as shown below is the [liquid templating language](https://shopify.github.io/liquid/). Docs are quite good.

{% highlight html %}
  {% assign myvar = 10 %}
{% endhighlight %}

## Draft Posts

* Draft posts go in the _drafts folder, but apart from that they work the same as posts.  
* If you want to preview them, run **jekyll serve --draft**.  
* Note that you don't have to use the same naming convention - draft posts don't need a date attached to their name.

## Serving multiple local Jekyll sites

The default port is 4000, but you can add --port nnnn after the jekyll serve command to serve a separate site on a separate port.

## Code Snippets

Jekyll offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

## Jekyll Docs

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/

## Permalinks

You can access vars in permalinks, eg **permalink: /:categories** will mean that the permalink mimics the categories - so if the categories for this post are **jekyll update**, then the permalink will be **/jekyll/update**.

Other vars available are :year, :month, :day, :title. You can also add your own cutom extension at the end, eg **permalink: /:categories/:title.html**.

!! See [Permalinks not working unless you do them in a certain way](#permalinks-not-working-unless-you-do-them-in-a-certain-way) below.

## Changing _config.yml

Whenever you make changes to your _config.yml, you have to restart the jekyll server to see the changes.

## Default Front Matter

You can define default front matter in _config.yml, for instance author and layout. Put this in your _config.yml:

{% highlight yml %}
defaults:
    -
        scope:
            path: "pages"
            type: "posts"
        values:
            layout: "page"
            title: "My page title"
{% endhighlight %}

The path is telling you which files you want your defaults to apply to. By specifying **pages**, this will only apply to files in the pages folder. All those files will now have a **page** layout.

You can also specify a type - if you specify type of "posts" then it will apply to all files in the _posts folder.

(Remember you have to restart the jekyll server to see the changes).

## Themes

The default theme is minima. This is defined in _config.yml. To find different themes, go to rubygems.org and search for "jekyll-theme". Once you have the name of the theme you want, add it to **Gemfile** under the line specifying **gem "minima"** and then run **bundle install** to install the new theme gem. Then you can update the setting in _config.yml and restart your Jekyll server. But when you restart, use **bundle exec jekyll serve**. You might notice when you refresh the page in the browser that you get some blank pages. This can happen if you're using layouts in your pages that are not supported in your new theme. When you're choosing your theme, check the folders on its home page to see what html files it has - it will have an html file for each supported layout. 

## Layouts

By default, Jekyll is using a **theme**, which is defining different layouts for all the pages (see above). You can define a layout in your front matter for each file. The theme has files for each of the available layouts.

You can add your own layouts by creating a _layouts folder and adding html files. The name of your html file will be the name of the layout, that you can then refer to in your front matter. You can use special variables in your layout files, like for instance:

{% highlight html %}
(( content )) <!-- !! replace round brackets with curly brackets!>
{% endhighlight %}

Haha that's funny, I originally typed it exactly as it should appear, but it had the effect of inserting the content of this post into this post! [mind blown]. So those round brackets should be replaced with curly brackets.

This will insert the content from your source file, eg your actual blog post.

See _layouts folder in clare-wiki-ably ([copied from Ably](https://github.com/ably/wiki-site)) for more complex layouts.

### More Complex Layouts

!! It's really useful to go and look at the source code for whichever theme you're using, because then you can copy and tweak it. For instance if you go and have a look at minima, you can find all the includes and layouts and then create your own tweaked versions. To do this, just copy the same folder structure and nakming convention. For instance, you can copy the _layouts/default.html and _includes/footer.html files from minima ([available here](https://github.com/jekyll/minima)) and then alter them to do what you want.

You can also nest layouts. You can do this by putting some front matter at the top of a layout html file. The front matter will look exactly the same as it does in a markdown file. This front matter can specify a layout component that refers to yet another layout html file. For further explanation see [this tutorial video](https://www.youtube.com/watch?v=bDQsGdCWv4I&list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB&index=12), from about 5:20.

You'll notice various variables and for loops and stuff being used in minima files and files created by Ably. There's nore explanation of things like loops and variables in the later [tutorial videos on the Jekyll site](https://jekyllrb.com/tutorials/video-walkthroughs/).

## Permalinks not working unless you do them in a certain way

The use of permalinks in this site as edited by Ably will not work (as of [commit 2530d9f](https://github.com/claresudbery/clare-wiki-ably/commit/2530d9f)).

The reason for this is the code in _layouts/default.html, which relies on the url to do two things:
* List site content under the search box
* Display the title of the page, both in the site content list and on the page itself.  

It's assuming that the url will contain "pages/", so if you don't include that in your permalink it'll make everything go weird. Even if you do include it in your permalink, if your permalink doesn't end with a sensible page title then things will still go screwy.

Also for some reason the **:categories** variable isn't working for permalinks in this site.

So, as long as you include "pages/" in your permalink, don't use the categories variable and make sure it ends with a sensible title, then everything will be fine! Prob best to just rely on the default code and try not to move files around - or at least know that if you do, it'll result in broken links.

## Links to other pages on the site

For instance, if you want to [link to the Jekyll How-to page on file locations](/pages/coding/webdev/jekyll/How-to-do-Jekyll-(File-Locations)).

Other pages on Jekyll stuff:  

- [Jekyll How-to page on front matter](/pages/coding/webdev/jekyll/How-to-do-Jekyll-(Front-Matter))
- [Jekyll How-to page on misc stuff](/pages/coding/webdev/jekyll/How-to-do-Jekyll-(Misc))
- [Jekyll Troubleshooting](/pages/coding/webdev/jekyll/Jekyll-Troubleshooting)
- [Simple Jekyll Search plugin](/pages/coding/webdev/jekyll/Simple-Jekyll-Search)

## Links to other sections of the same doc

First you have to do the following in _config.yml:

{% highlight yml %}
kramdown:
  auto_ids: true
{% endhighlight %}

Then you can link to a section [like this](#draft-posts).

In the raw markdown that looks like this:

{% highlight markdown %}
Then you can link to a section [like this](#draft-posts).
{% endhighlight %}

## Table of Contents

I'm using [jekyll-toc](https://github.com/allejo/jekyll-toc/), but I had to make an amendment to remove strange chars at the start of every list item. See [commit 34b357f](https://github.com/claresudbery/clare-wiki-ably/commit/34b357f).

I also made another amendment to add a heading to each toc: [commit ebb8600](https://github.com/claresudbery/clare-wiki-ably/commit/ebb8600).

## Category archive

I didn't manage to get this working. I was using [category archive](https://github.com/shigeya/jekyll-category-archive-plugin). There are build errors related to the plugin when you run jekyll serve locally, that will probably contain the key for how to fix it. See [commit 8f43b44](https://github.com/claresudbery/clare-wiki-ably/commit/8f43b44) for when I added the plugin.

## Sitemap

I've used the [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) plugin to create sitemap.xml.

But I've also written my own _includes/sitemap.html component to traverse the folder structure and build a sitemap. Note that it doesn't actually traverse the folder structure: What it actually does is use the location variable in the front matter. Each file uses location to record its location in the folder structure. The same structure is also mirrored in each file's permalink (hmm, I should probably try to automate that - it's currently manual).

Note that each folder contains an index.md which has folderlist set to true in the front matter, and I've created two more includes - folder-contents.html and subfolders.html - which use that value to build lists of subfolders and files in the relevant folder.

If a file isn't a folderlist, its location has an extra element - "leaf" - appended to the end. This allows the sitemap recursive functionality to line everything up nicely in the sitemap tree. This is implemented in recursive-subfolders.html.

!! I don't think this is going to scale well! I couldn't find any decent mapping or filtering functionality for collections in Liquid, which has meant I've had to scatter for loops all over the bloody place. If the site grows a lot this could have a big impact on the build performance - I'll have to keep an eye on that. The answer is probably to build a decent Ruby plugin instead of writing the functionality in liquid. Sadly those for loops are also in folder-contents.html and subfolders.html so it really is pretty awful. But I'm tired now and I want to eat my tea. :/

I'm now wondering whether this might be a better recursive site map: https://thinkshout.com/blog/2014/12/creating-dynamic-menus-in-jekyll/?

## Collections

- [Use collections to create folder indices?](https://github.com/jekyll/jekyll-help/issues/182)
	- [more on collections](https://jekyllrb.com/docs/collections/)
	- Collections [tutorial?](https://www.youtube.com/playlist?list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB)
