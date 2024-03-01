---
layout: page
location: "pages/coding/lang/oo/leaf"
permalink: /pages/coding/lang/oo/Python
---

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [Root-Scripts (PRIVATE)](https://github.com/claresudbery/Root-Scripts)
    - My own root scripts, installed on all machines I use.
- [Infra-Scripts (PRIVATE)](https://github.com/claresudbery/Infra-Scripts)
    - Useful command-line scripts and infrastructure stuff (eg Terraform, Kubernetes, GCP) from various projects
- [standards-translation (PRIVATE)](https://github.com/claresudbery/standards-translation)
- [data-engineering (PRIVATE)](https://github.com/claresudbery/data-engineering.git)
    - Stuff learnt / played with during TW data engineering course.

## Useful Links

- [Using spacy.io to do AI, NLP, deep learning with Python](/pages/coding/data/Machine-Learning#Spacy.io)
- [Python Software Foundation](https://www.python.org/psf/)
- [Python wiki](https://wiki.python.org/moin/) and its [language page](https://wiki.python.org/moin/CompLangPython)
- For learning Python:
  - [Learn Python - Free Interactive Python Tutorial](https://www.learnpython.org/)  
  - [w3schools](https://www.w3schools.com/python/default.asp)
  - [Head First Python (book by Paul Barry)](https://www.amazon.co.uk/Head-First-Python-Paul-Barry/dp/1491919531)  
  - [Python koans](https://github.com/gregmalcolm/python_koans) (they form an interactive tutorial for learning the Python programming language by making tests pass)  
  - [Dive Into Python](https://diveintopython3.net)  
  - [Python Challenge](http://pythonchallenge.com)  
  - [https://python-course.eu](https://python-course.eu)
  - [The GeeksforGeeks Python site](https://www.geeksforgeeks.org/python-programming-language/)
  - [Python.org itself](https://www.python.org/about/gettingstarted/)  
  - [Learn python the hard way](https://www.amazon.co.uk/Learn-Python-Hard-Way-Introduction/dp/0321884914)
  - [The hitchhiker guide to python](https://docs.python-guide.org/)
  - [The Python software foundation](https://www.python.org/psf/)
  - [JetBrains academy](https://tinyurl.com/jetbrains-python) ("I completed a lot of books/courses when learning Python and JetBrains academy was the best by miles. Although it's marketed at absolute beginners, it's really easy to navigate through the comp sci basics to get to the more useful bits for people who are already familiar with other languages")
  - "If money were no object I would buy a raspberry pi400 and work through the "build games in python" tutorial material that comes with it. For books the O'reilly options are always solid. ... I also own "Automate the Boring stuff with Python" which is good and "Python Playground" and people do rate other No Starch Press coding books. ... Online the tutorials at CodeAcademy and RealPython and learnpython all get positive noises but I can't personally comment there."

## Misc

  - Type python at command line to write python live
    
      - Python has a repl - presumably that’s what this is?

  - To run a Python script: **python script-name.py**

  - To start up your virtual env (venv), source the activate file that
    will have been put in a bin folder in your venv folder:
    
      - Cmd: cd venv
    
      - Cmd: source bin/activate

  - Use **yum provides python3** to find which package will give us
    python3
    
      - We want python 3.7 for Alex’s script - gives really good string
        interpolation. yum only has Python 3.4
    
      - yum is locked down in CentOS, everything super secure, so
        doesn’t have stuff as up to date as brew does (eg python3)
    
      - You might have to be on your laptop and install python3 using
        brew
        
          - But apparently (according to Ben Smith) you can manually add
            the newer python repo for yum on the command line - but you
            have to accept the keys for the repo not shipped with the
            distribution

  - Book: Python the hard way - type everything out, no c+p

  - David is using SCL to manage his Python - something collection -
    something to do with yum - kind of like a virtual env of his own

  - To install the dependencies you have set up in your
    requirements.txt: **pip install -U -r requirements.txt**

  - To start your repl: **python**
    
      - In the repl, there are library functions that will work on any
        object - like **dir(var)** that will tell you what attributes
        are available on your object called var. There’s no distinction
        between attributes and functions but if they’re prefixed with
        \_\_, that means they’re private.

  - Syntax error at end of file: check for unclosed parentheses

  - Filter a list:
    [<span class="underline">http://book.pythontips.com/en/latest/map\_filter.html</span>](http://book.pythontips.com/en/latest/map_filter.html)

  - Check if element exists in list:
    [<span class="underline">https://thispointer.com/python-how-to-check-if-an-item-exists-in-list-search-by-value-or-condition/</span>](https://thispointer.com/python-how-to-check-if-an-item-exists-in-list-search-by-value-or-condition/)

  - Elastic Search python library:
    [<span class="underline">https://elasticsearch-py.readthedocs.io/en/master/api.html</span>](https://elasticsearch-py.readthedocs.io/en/master/api.html)

## Packages - pip

  - Pypi -
    [<span class="underline">https://pypi.org/search/?q=elasticsearch</span>](https://pypi.org/search/?q=elasticsearch)
    - directory to find what’s available via pip install

## Repl

  - Type python at the command line to get a repl / Python interpreter

  - For multiline code, type \\ at the end of the first line and it will
    keep asking you for more
    
      - Hit Enter twice to finish typing and execute all lines
    
      - Remember you still need to use indentation\! Just use the tab
        key.

## Mocking

  - Here:
    [<span class="underline">https://realpython.com/python-mock-library/</span>](https://realpython.com/python-mock-library/)

  - I did a TON of mocking and stuff in the SnapshotHandler script,
    which is [here (accessible to Clare only)](github.com/claresudbery/Infra-Scripts/tree/master/observability-toolbox/closedindices/es_indices_snapshot).

  - Useful links on mocking and stuff:
    
      - Use **assertLogs** to check what has been logged:
        [<span class="underline">https://stackoverflow.com/questions/31728497/assert-that-logging-has-been-called-with-specific-string</span>](https://stackoverflow.com/questions/31728497/assert-that-logging-has-been-called-with-specific-string)
    
      - Use **PropertyMock** to make assertions about properties.
        Attributes:
        [<span class="underline">https://stackoverflow.com/questions/19147268/assert-attribute-on-mock-instance-was-accessed</span>](https://stackoverflow.com/questions/19147268/assert-attribute-on-mock-instance-was-accessed)
    
      - Mock multiple calls with different results :
        [<span class="underline">https://stackoverflow.com/questions/23159257/python-mock-multiple-calls-with-different-results</span>](https://stackoverflow.com/questions/23159257/python-mock-multiple-calls-with-different-results)
    
      - Assert a method was called iwth one argument out of several:
        [<span class="underline">https://stackoverflow.com/questions/21611559/assert-that-a-method-was-called-with-one-argument-out-of-several</span>](https://stackoverflow.com/questions/21611559/assert-that-a-method-was-called-with-one-argument-out-of-several)
    
      - Mock function based on input arguments:
        [<span class="underline">https://stackoverflow.com/questions/16162015/mocking-python-function-based-on-input-arguments</span>](https://stackoverflow.com/questions/16162015/mocking-python-function-based-on-input-arguments)
    
      - Create your own **assert\_not\_called\_with** method:
        [<span class="underline">https://stackoverflow.com/questions/54838354/python-how-can-i-assert-a-mock-object-was-not-called-with-specific-arguments</span>](https://stackoverflow.com/questions/54838354/python-how-can-i-assert-a-mock-object-was-not-called-with-specific-arguments)
    
      - Spying with python mocks:
        [<span class="underline">https://wesmckinney.com/blog/spying-with-python-mocks/</span>](https://wesmckinney.com/blog/spying-with-python-mocks/)
    
      - Use **assertRaises** to catch exceptions:
        [<span class="underline">https://realpython.com/python-mock-library/</span>](https://realpython.com/python-mock-library/)
    
      - Catch third party library exceptions:
        [<span class="underline">https://stackoverflow.com/questions/44828156/python-catch-third-party-library-exceptions</span>](https://stackoverflow.com/questions/44828156/python-catch-third-party-library-exceptions)

## Catching exceptions from third party libraries

  - In our closed\_indices script (in observability\_toolbox, called
    something like es\_indices\_snapshot.py, or
    es\_snapshot\_handler.py), we wanted to catch an excpetion from the
    elasticsearch python library.
    
      - In the repl it was showing as
        elasticsearch.exceptions.NotFoundError, so we had to add this
        line at the top of our file:
    
      - from elasticsearch.exceptions import NotFoundError
    
      - and then we could catch it like this: **except NotFoundError as
        e:**

## Virtual environment / venv

  - David’s zshrc sources several other files, for instance a bash
    function for cd that runs bin/activate whenever you cd into a
    directory that has a Python venv in it:
    
      - function cd() {  
         if \[\[ -d ./venv \]\] ; then  
           deactivate  
         fi  
          
         builtin cd $1  
          
         if \[\[ -d ./venv \]\] ; then  
           . ./venv/bin/activate  
         fi  
        }

## Getting Started with a new Python project

  - Python scaffolding:
    
      - Cmd: **mkdir \[project name\]**
    
      - Guide that David uses:
        [<span class="underline">https://docs.python-guide.org/</span>](https://docs.python-guide.org/)
    
      - venv \[folder name\]
        
          - Or if you have two versions of Python (**python --version**
            and **python3 --version**), you will need this to get
            python3: **python3 -m venv venv**
        
          - That’s creating a venv called “venv” which will then be
            created in a folder in whatever directory you’re currently
            in
    
      - To start up your virtual env, source the activate file that will
        have been put in a bin folder in your venv folder:
        
          - Cmd: cd venv
        
          - Cmd: source bin/activate
        
          - To prove you’re now in a venv which has a different version
            of python running:
            
              - Cmd: python --version
            
              - \- you now have a different version of python
    
      - Scaffolding a new Python project:
        
          - David likes to have the following five files:
            
              - Cmd: touch setup.py
            
              - Cmd: touch \[parent folder name\].py
                
                  - Some people say this should be called main.py and
                    should be in your bin
            
              - Cmd: touch requirements.txt
                
                  - This will contain all the pip requiremtns so you can
                    do pip install and pass this file in
            
              - Cmd: touch readme.md
            
              - Cmd: touch makefile
                
                  - contents of makefile
                
                  - init section, test section
        
          - Also a tests folder: **mkdir tests**

  - To install the dependencies you have set up in your
    requirements.txt:
    
      - Cmd: **pip install -U -r requirements.txt**
    
      - To get rid of the warning about your version of pip, add **pip**
        as the first line in requirements.txt

  - To start your repl: **python**
    
      - Then you can start typing commands in repl
    
      - Once you see them working you can copy them into your actual
        Python file
    
      - There are various library functions available

## Language notes

I learnt a lot of the following while working on Llewellyn Falco's duplication kata: https://github.com/LearnWithLlew/DuplicationKata.Python
    - I've forked this into `DuplicationKataPython-Clare-Fork`

### Approval tests

- Final working code can be seen here: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/tests/test_regression.py#L50
  - ...and here: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/tests/RegressionTest.test_segment_index.approved.txt
- Source code for Python approvals: https://github.com/approvals/ApprovalTests.Python/blob/main/approvaltests/combination_approvals.py
- Useful examples: https://snyk.io/advisor/python/approvaltests/functions/approvaltests.verify_all_combinations
- Gotcha: I got a `TypeError` error because I got the syntax wrong when creating an arg list that only contained one member 
    - You have to add a comma after the first element if there's only one element
    - Like this: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/tests/test_regression.py#L103

### Enums

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L4
- Reference: https://docs.python.org/3/howto/enum.html

### Getting the index of a member in a list

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L24
- Reference: https://treyhunner.com/2016/04/how-to-loop-with-indexes-in-python/#What_if_we_need_indexes?

### Break statements in for loops

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/Lesson32.py#L14
- Reference: https://www.digitalocean.com/community/tutorials/how-to-use-break-continue-and-pass-statements-when-working-with-loops-in-python-3

### Creating and instantiating a simple class

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L10
- Reference: https://dev.to/ogwurujohnson/creating-and-instantiating-a-simple-class-in-python-79b

### Adding the param name in front of an argument

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/tests/test_regression.py#L54
- Reference - but watch out though - this talks about forcing it using `*` but you don't need to do that if you just want to do it optionally: https://www.vegardstikbakke.com/python-keyword-only/#:~:text=By%20adding%20a%20*%20in%20the,all%20arguments%20to%20be%20named.&text=This%20makes%20writing%20defensive%20Python%20easier!

### Lambda functions

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L24
- Reference: https://www.w3schools.com/python/python_lambda.asp

### Using args keyword for variable length list of args

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/tests/test_regression.py#L109
- Reference: https://realpython.com/python-kwargs-and-args/

### Getting the name of an enum

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/tests/test_regression.py#L109
- Reference: https://stackoverflow.com/questions/29880323/how-to-get-back-name-of-the-enum-element

### String interpolation

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L35
- Reference: https://www.programiz.com/python-programming/string-interpolation

### The built in str function 

- equivalent of ToString in C# or Java
- Example: 
  - Definition: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L35
  - Usage: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L40
  - More usage: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/tests/test_regression.py#L109
- Reference: https://www.digitalocean.com/community/tutorials/python-str-repr-functions

### Using map 

- equivalent of Linq Select in C#
- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L24
- Reference: https://www.w3schools.com/python/ref_func_map.asp

### Joining strings from a collection together with a separator

- Example: https://github.com/LearnWithLlew/DuplicationKata.Python/blob/2d177b7ee5f2fda372a9f899c503edb65b798ea8/kata/LineSegment.py#L25
- Reference: https://www.w3schools.com/python/ref_string_join.asp

### Using product() to create all possible permutations to combine members of collections

- Example: https://github.com/approvals/ApprovalTests.Python/blob/98bf3df9a05a1fc03a851c6cc89b79810a172e7b/approvaltests/combination_approvals.py#L110
- Reference 1: https://www.hackerrank.com/challenges/itertools-product/problem#:~:text=product(),-Problem&text=This%20tool%20computes%20the%20cartesian,equivalent%20to%20nested%20for%2Dloops.
- Reference 2: https://www.geeksforgeeks.org/python-itertools-product/

### AttributeError

- This is what you get if you try to access a function on an object that doesn't actually have that function
- Example: In this map call, I originally tried to call `self.line_segments.map` and got attribute error because `map` is not a method that belongs to objects.
