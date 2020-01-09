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


