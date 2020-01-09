---
layout: post
categories: jekyll howto
---

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