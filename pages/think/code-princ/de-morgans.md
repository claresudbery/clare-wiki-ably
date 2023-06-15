---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/De-Morgans
---

Note that everything below was copied from [this page by Mike Foster](http://ix.cs.uoregon.edu/~michaelh/111/misc/inverting-logical-exprs.html) - I only put it here so I would have offline access.

## Inverting Logical Expressions with De Morgan's Laws

by Mike Foster ([cross-browser.com](https://cross-browser.com/))

A Javascript expression will sometimes be more intuitive (and easier to understand) when written a certain way - but we may actually need the inverse of the expression. For example in listing 1 our code only needs to react if (x && y) is false. We need to invert the expression.

Listing 1

```
if (x && y)
{
  // we don"t have anything to do here
}
else
{
  // we want to do something here
}
```

De Morgan"s laws describe how to invert a logical expression. In listing 2 let"s look at De Morgan"s Laws in Javascript syntax.

Listing 2
```
!(x || y) == (!x && !y)

!(x && y) == (!x || !y)
```

The rule is to invert each logical term and invert each logical operator.

In listing 3 we invert the expression from listing 1 by applying De Morgan"s Laws.

Listing 3

```
if (!x || !y)
{
  // we want to do something here
}
```

Sometimes a logical term is more complex than a simple boolean variable. A logical term may be a relational expression such as (p < q) from listing 4. We must invert the relational expression as a whole.

Listing 4

```
if (p < q && r != s)
{
  // we don"t have anything to do here
}
else
{
  // we want to do something here
}
```

Let"s invert the expression step by step.

1. Note that this expression is of the same form as our original expression in listing 1 (x && y) where x is replaced with (p < q) and y is replaced with (r != s). De Morgan"s rule is to invert each logical term and invert each logical operator.
2. Inverting the first logical term (p < q) we get (p >= q)
3. Inverting the next logical term (r != s) we get (r == s)
4. Inverting the logical operator && we get ||
5. Our result is in listing 5.

Listing 5

```
if (p >= q || r == s)
{
  // we want to do something here
}
```

So if you find yourself struggling with a Javascript problem, pick up an old math textbook - your solution is probably in there.