---
layout: page
location: "pages/coding/lang/func/leaf"
permalink: /pages/coding/lang/func/Clojure
---

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [clojure-playground](https://github.com/claresudbery/clojure-playground)
    - lots of useful notes in here, for instance all the different “playground” Clojure files in the [src/clojure-playground folder](https://github.com/claresudbery/clojure-playground/tree/master/src/clojure_playground).
- [clojure-stuff](https://github.com/claresudbery/clojure-stuff)
    - lots of useful notes in here, for instance walk.clj and walk2.clj in the [clojurebridge_turtle folder](https://github.com/claresudbery/clojure-stuff/tree/master/welcometoclojurebridge/src/clojurebridge_turtle).
- [samba (PRIVATE)](https://github.com/claresudbery/samba)
    - See sub-folders for son**, sig** and vis**     



## Docs and Blog Posts

- [My InSimpleTerms blog](https://insimpleterms.blog/category/clojure) (Clojure category)

## Guides

- [Clojurescript Quick Start Guide](https://clojurescript.org/guides/quick-start)

## General Useful Stuff

  - Clojure docs:
    [**http://clojuredocs.org/clojure.core**](http://clojuredocs.org/clojure.core)
  - See
      - GitHub repos:
        [clojure-stuff](https://github.com/claresudbery/clojure-stuff)
        and
        [clojure-playground](https://github.com/claresudbery/clojure-playground)
        – lots of notes in both of these, for instance:
          - [clojurebridge\_turtle](https://github.com/claresudbery/clojure-stuff/tree/master/welcometoclojurebridge/src/clojurebridge_turtle)
            - /walk.clj and walk2.clj
          - [clojure\_playground](https://github.com/claresudbery/clojure-playground/tree/master/src/clojure_playground)
            – all the different “playground” Clojure files.
      - My [“useful notes” for one of the Samba
        projects](https://github.com/claresudbery/samba/blob/master/signposts-misc-files/useful-single-view-notes.md)
        (accessible to Clare only)
  - Tools for opening / running Clojure:
      - IntelliJ IDEA – see [my notes on
        IDEA](/pages/coding/tools/IntelliJ-IDEA), a lot of which were
        written specifically with reference to Clojure projects
      - LightTable
  - Vectors
      - Vectors are basically arrays
      - They are 0-indexed
      - They can contain elements of mixed types
      - Example of array with four elements: \[45 7.2 ¾ "a"\]
      - \`-\>\` is known as the "thread-first" macro or the “thrush”
        operator, or just the thread macro
  - Maps
      - Maps are basically dictionaries
  - Def defines a var (which is really a constant because of
    immutability?)
  - Ratios are fractions
  - All types can be mixed (eg decimal plus ratio plus int)
  - Everythign is prefix notation
  - Most things are functions
  - Functions are always enclosed in brackets
  - Arguments come after function names, no commas
  - (Everythign in Clojure is a list
  - The leftmost part is always calling the function
  - The rightmost part is the arguments
  - Start a line with "(" to call a function)
  - A repl is like an environment - a scratchpad for writing code. REPL
    - Read Edit Print Evaluate. Each REPL has its own identity. For
    instance there is a Figwheel REPL and a Clojure REPL. They all have
    their own commands and basically their own language.
  - ClojureScript.org - do the QuickStart tutorial. Explains all sorts
    of things like repls and stuff.

## Binding

  - The words “binding” and “binding forms” are used to talk about what
    in C\# would be referred to as assignment.
  - The following statement binds the value 5 to the symbol height:
      - (def height 5)
  - The whole statement is a binding form.
  - Generally, a line of code, or statement, in Clojure, is called a
    form.

## Maps / Mapping

  - (this stuff now all in my clojure-playground GitHub repo, in
    [assoc\_playground.clj](https://github.com/claresudbery/clojure-playground/blob/master/src/clojure_playground/assoc_playground.clj),
    with a lot more explanation and examples)
  - (def m {:a {:b {:c 25}}})
      - This defines a map with three levels of nesting
  - m
      - This will print out your map for you to see
  - (assoc m :b 5)
      - Change the value without caring about previous value – throws
        previous value away
  - (update m :b dec)
      - Update requires a fuinction – which will receive the previous
        value
  - (assoc m :c 6)
      - – adds an additional key
  - (dissoc m :b)
      - – removes a key
  - (assoc-in m \[:a :b :c\] 30)
      - This will return a new map where the value of 25 has now been
        changed to 30
      - Result: {:a {:b {:c 30}}}
  - (assoc-in m \[:a :b :d\] 30)
      - This will return a new map – based on the original (which is of
        course immutable) – but now, at the level of c, there is also a
        member called d (in the same map)
      - Result: {:a {:b {:c 25, :d 30}}}
      - So, in the square brackets, the order defines level of nesting –
        the thirs element in there represents the third level down
      - So this would not reach the existing c, but would instead add a
        new c at the same level as b:
          - (assoc-in m \[:a :c\] 30)
          - The result would look like this: {:a {:b {:c 25}, :c 30}}
  - (assoc-in m \[:a :b :d :e\] 30)
      - – will create some new nesting, because :e is the fourth member,
        so we now have a fourth level of nesting
    <!-- end list -->
      - Result: {:a {:b {:c 25, :d {:e 30}}}}

## Figwheel

  - Use of Figwheel means that code changes are immediately reflected in
    the UI, whilst maintaining state – makes dev work significantly
    faster (example in one of the Samba projects – only available to
    Clare – see link above)
  - Like this: **lein figwheel**
  - Once Figwheel is running in Terminal, the command prompt will be
    labelled "Figwheel:"
  - Type this into Terminal at that point to see results:
  - (require 'cljs-time.core)
  - (cljs-time.core/now)

## Midje

  - Midje is a [testing framework for
    Clojure](https://github.com/marick/Midje)
      - Used in one of the
        [Samba](https://github.com/claresudbery/samba) projects
        (available to Clare only)
      - Notes
        [here](https://github.com/claresudbery/samba/blob/master/signposts-misc-files/useful-single-view-notes.md#data-ingestion-tests)
        and
        [here](https://github.com/claresudbery/samba/blob/master/signposts-misc-files/useful-single-view-notes.md#w-midje)
        (available to Clare only)

## Leiningen and Uberjars

  - See one of the
    [Samba](https://github.com/claresudbery/samba)
    projects for example code (available to Clare only)
  - When you run in an uberjar
  - A jar is like a dll – you can deploy code in it – it’s basically a
    zip file for class files, with some added metadata
      - Jar is really a tar archive which is really just a zip
      - But is actually a single executable
  - An uberjar is a collection of jars, all bundled together – has a
    class loader that knows where to find all the right jars
  - Leiningen is the build system: finds all the jars and builds them
    into an uberjar for us
      - To build an uberjar from the command line: **lein uberjar**
      - Controlled with project.clj
          - All Leiningen projects have a project.clj file
      - project.clj contains all the runtime dependencies – can be
        useful to find what libraries are being used
          - In project.clj, see:
          - :cljsbuild
              - This sets up a build called :min
          - :profiles
              - The :uberjar (ie prod) profile sets up :prep-tasks to
                use to use the min build
              - When running locally from the command line, you are not
                in an uberjar, so these are the dev settings
      - Contains some stuff to tell it what to do in different
        environments (dev / prod) – so basically some conditional
        compiling
      - Uses different code depending on environment
          - You can tell this because the two profiles, :dev and
            :uberjar, have different values for :source-paths
      - One example of code being different in different environments is
        middleware.clj
          - For prod, we get (def secure-cookies true)
          - secure-cookies is referenced in cookies.clj
      - Secure cookies have to be delivered across https
          - To check that the cookies are indeed secure in prod, visit
            the endpoint and inspect the browser to look at cookies
          - Some are also set as http only, which means they can’t be
            interrogated in the js
  - Troubleshooting:
      - We saw a problem on one dev’s Windows laptop and in Team City
        but not on our macs
      - It was fixed by running **lein clean** on the Windows machine
      - We could explicitly break it on our machines by running **lein
        uberjar**
      - The problem was caused by the value of **secure-cookies** being
        set wrong when creating the uberjar (because of the build
        differences for prod vs dev)
      - The fix was to change the test to explicitly overwrite the value
        of secure-cookies before proceeding with the test – as had been
        done for the other tests in the file. (see cookies-tests.clj)
          - Like this: **with-redefs \[middleware/secure-cookies
            false\]**

## Reagent

  - Reagent is a library – a Clojurescript wrapper around react js
      - define a state, eg {:name “Clare”}
      - define a template, eg \[:p (:name state)\]
      - the output will be html, like this: \<p “Clare”\>
  - An atom in clojure is a threadsafe sharable thing that you can
    modify in a safe way
      - When you build a reagent atom you automatically get something
        that’s watched
      - You are then notified when it changes
      - Reagent is looking for changes to states, then updating the dom
        as a result
      - Basically this means the UI is redrawn whenever state changes
  - See the relevant project in
    [Samba](https://github.com/claresudbery/samba) for an example
    (accessible to Clare only)
  - Once you have Leiningen and IntelliJ, you can type **lein new
    reagent clareproject**
  - Have a play\!
  - Then you can go to the reagent site and follow a basic tutorial:
    github.com/reagent-proj/reagent
  - Then you can get recipes from
    github.com/reagent-project/reagent-cookbook

## Clojure vs Clojurescript:

  - Commas are treated as whitespace
  - Datetime – moment.js in Clojure script, Yoda in Clojure
  - Clojure is generally server side, whereas Clojurescript is client
    side
  - Testing:
      - Clojure testing – Midje
      - Clojure script testing – Phantom js
      - Against-background
          - Part of the Midje library
  - Clj = clojure
  - Cljs = Clojurescript
  - Cljc = both

## Jetty

  - Server used in a Samba project
  - Some notes
    [here](https://github.com/claresudbery/samba/blob/master/signposts-misc-files/useful-single-view-notes.md#o-front-end-vs-back-end)
    (accessible to Clare only)

## Hiccup

  - Hiccup = html in sort of data format
  - A Samba front end was written in hiccup
  - Some notes
    [here](https://github.com/claresudbery/samba/blob/master/signposts-misc-files/useful-single-view-notes.md#o-w-front-end)
