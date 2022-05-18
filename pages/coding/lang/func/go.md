---
layout: page
location: "pages/coding/lang/func/leaf"
permalink: /pages/coding/lang/func/Go
---

Notes below are from Jeremy Clark's session on "Go for C# developers" at SDDConf 2022.

## Overview

- Go is compiled down to an environment-specific binary
    - so for instance, an exe for Windows
    - once you have your binary, you need nothing else
    - no Go runtime environment or anything like that
- Advantages / features (all demonstrated in code snippets below, I think?)
    - Opinionated syntax
    - no unused vars
    - baked in concurrency
    - sync. WaitGroup
    - Deferred calls
    - Error handling
    - Multiple return values
    - Interfaces
    - Inline goroutines
    - Closures
    - Garbage collection
    - Pointers are safe (you can't access memory you shouldn't, I think?)
- Additinal features not demoed here
    - packages
    - exports
    - project structure
    - types
    - named return values
    - bare returns
    - channels
    - generics (v new - March 2022)
- Programming can be done in VS Code
    - `code main.go` on the ocmmand line to create a file and open it in VS Code
    - use the Go extension in VS Code - from Go team at Google

## Writing, building and running

### Bootstrapping your entry point / formatting your code

- Needs to look like this. Formatting is non-optional.
- CAUTION! I was typing all this code manually so I have probably made errors!

```go
package main

import "fmt"

func main() {
    fmt.Println("")
}
```

### Building code

- type `go build` on command line
    - this will create a binary specific to your context
    - eg an exe on Windows
    - it will be big, because it basically contains run-time environment
- the first time you'll get "go.mod file not found"
    - `go.mod` is like the `csproj` file
- `go mod init` will create a new one
    - you need to give it a globally unique name
    - common convention is to use github domain scoping
    - eg `github.xom/jeremybytes/tour-of-go`
        - that github repo does not have to actually exist
    - you can then type `code go.mod` to see it - there'll be very little there

### Running code

- Just run the exe
- So on command line, just `./tour-of-go.exe`

### Writing code

- If you put brace on new line, it won't compile. Go extension will underline iwth red squiggly
- Lower case start letter means private scope
    - Upper case start letter is public
- If you import something and then don't use it, when you save it will be removed / deleted
    - But just change your habits: don't import before you use. Instead, in your code, just type (eg) fmt.Println(), and it will do the import for you
- Don't put semi-colons at end of lines - they will be removed when you save
- var declaration and assignment:
    - `ids := [8]int{1, 2, 3, 4, 5, 6, 7, 8}`
    - `:=` is the equiv of `var` keyword in C#
- If you create and initailase a var without using, it won't get removed on save but it will cause compiler error on `go build`
- String interpolation
    - `fmt.Printf("IDs: %v\n" ids)` (where `ids` is an array of ints) will print to standard out
    - `%v` is default format - "natural format" - which for an array of ints will be "[1 2 3 4 5 6 7 8]"
    - `Sprintf` goes to a string
        - `url := fmt.SPrintf""`
    - `Fprintf` goes to a file

### help docs

- in browser just type for instance goloang fmt
- will probably take you to `pkg.go` domain

## Code snippets

### structs

- CAUTION! I was typing all this code manually so I have probably made errors!
- Code is at https://github.com/jeremybytes/sdd-2022/ - notes in walkthrough.md

```go
type person struct {
    ID int
    FamilyName string
    GivenName string

}
```

- Details
    - When you hit save it will line up all your formatting for you
    - Fields MUST be capitalised in order to work
    - even though you might have associated json taht is not capitalised
    - there's a json decoder package
        - `json.NewDecoder()` takes an IOReader parameter - IOReader is an interface
        - returns `*json.Decoder` which is a pointer to a decoder object
    - Go will work it out

### functions

- CAUTION! I was typing all this code manually so I have probably made errors!

```
func main() {
    ids := [10]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    fmt.Printf("IDs: %v\n" ids)

    for _, currentId := range ids {
        p = getPerson(curremtId)
        fmt.Printf("%d: %v\n", p.ID, p)
    }
}

func getPerson(id int) person {
    url := fmt.Sprintf("http://localhost:9874/people/%id", id)
    resp, _ := http.Get(url)
    var p person
    json.NewDecoder(resp.Body).Decode(&p)
    resp.Body.Close()
    return p
}

func (p person) String() string {
    return fmt.Sprintf("%s %s", p.GivenName, p.FamilyName)
}
```

- details
    - `http.Get` returns two things - a response and an error
    - `resp.Body is a disposable object, which means it is caller's responsbility to call close on object
        - if you don't, you won't get compiler error - it will keep http connections alive
    - Go developers have habit of using single-character names
    - Instead of `resp, err := http.Get(url)` you can do `resp, _ := http.Get(url)` which means you're declaring you're not going to use that var
    - All vars are by default passed by value - which means it makes a copy of your thing
        - Instead you can pass a pointer to that object - use `&` to say you want to pass a pointer to the thing
    - Output from will be:
        - ""

### interfaces

- CAUTION! I was typing all this code manually so I have probably made errors!
- Code is at https://github.com/jeremybytes/sdd-2022/ - notes in walkthrough.md

```go
type Stringer interface {
    String() string
}

func (p person) String() string {
    return fmt.Sprintf("%s %s", p.GivenName, p.FamilyName)
}
```

- details
    - v similar to C# BUT if you create an object that implements that method, it will automatically be considered to implement that interface - you don't have to explciitly declare that
    - If you have two interfaces that both have a String() method but both also have other mnethods which your class does NOT implement, then yuour class will NOT be assumed to be implementing either of those intefaces
    - in the example above, this will be considered to implement that interface

### loops

- CAUTION! I was typing all this code manually so I have probably made errors!
- Code is at https://github.com/jeremybytes/sdd-2022/ - notes in walkthrough.md

```go
for index := 0; index < len(ids); index++ {
    p = getPerson(2)
    fmt.Printf("%d: %v\n", p.ID, p)
}

for _, currentId := range ids {
    p = getPerson(curremtId)
    fmt.Printf("%d: %v\n", p.ID, p)
}
```

- details
    - The second example is basically a `foreach` loop
    - The `_` can be given a name if you want to use it, eg `index`

### async stuff / concurrency

- CAUTION! I was typing all this code manually so I have probably made errors!
- Code is at https://github.com/jeremybytes/sdd-2022/ - notes in walkthrough.md

```go
func main() {
    var waiter sync.WaitGroup
    for _, currentId := range ids {
        waiter.Add(1)
        go fetchAndDisplay(currentId, &waiter)
    }
    waiter.Wait()
    elapsed := time.Since(start)
    fmt.Printf("Total time: %v", elapsed)
}

func fetchAndDisplay(id int, *wg sync.WaitGroup) {
    p = getPerson(currentId)
    fmt.Printf("%d: %v\n", p.ID, p)
    wg.Done()
}
```

- details
    - There's no way you can get a return value from a async call
    - You can use channels
    - or shared vars
    - or do something to avoid the need to return things
    - in the code above we've extracted some cod into a functon
    - `fetchAndDisplay` will run somewhere else and not block thread
        - because of the `go` keyword
        - but we want to wait for it to finish
        - `wg.Done()` takes no params, it just decrements by 1
        - It's important to pass pointer to waiter, so wg.Done() happens on correct object


### error handling

- CAUTION! I was typing all this code manually so I have probably made errors!
- Code is at https://github.com/jeremybytes/sdd-2022/ - notes in walkthrough.md

- First example:

```go
func getPerson(id int) person {
    url := fmt.Sprintf("http://localhost:9874/people/%id", id)
    resp, _ := http.Get(url)
    var p person
    json.NewDecoder(resp.Body).Decode(&p)
    resp.Body.Close()
    return p
}
```

- Second example:

```go
func main() {
    var waiter sync.WaitGroup
    for _, currentId := range ids {
        waiter.Add(1)
        go fetchAndDisplay(currentId, &waiter)
    }
    waiter.Wait()
    elapsed := time.Since(start)
    fmt.Printf("Total time: %v", elapsed)
}

func fetchAndDisplay(id int, wg *sync.WaitGroup) {
    defer wg.Done()
    p, err := getPerson(id)
    if err != nil {
        log.Println(err)
        return
    }
    fmt.Printf("%d: %v\n", p.ID, p)
}

func getPerson(id int) person {
    url := fmt.Sprintf("http://localhost:9874/people/%id", id)
    resp, err := http.Get(url)
    if err != nil {
        return person{}, fmt.Errorf("error getting data: %v", err)
    }
    var p person
    json.NewDecoder(resp.Body).Decode(&p)
    resp.Body.Close()
    return p, nil
}

```

- details
    - errors are really just glorified strings
    - it's up to the programmer to handle them
    - if you try to access memory you shouyldn't, you'll get a "panic"
    - in first example above, we didn't store the error - so we got an error
    - in second example, `person{}` is an empty struct 
    - `defer wg.Done()` means you're saying this will happen no matter what
    - `defer` is basically a `finally` clause
    - if you have multiple defers, they'll execute in opposite order to what they were declared


### anonymous functions

- CAUTION! I was typing all this code manually so I have probably made errors!
- Code is at https://github.com/jeremybytes/sdd-2022/ - notes in walkthrough.md

- First version

```go
func main() {
    var waiter sync.WaitGroup
    for _, currentId := range ids {
        waiter.Add(1)
        go func(id int) person { 
            defer waiter.Done()
            p, err := getPerson(id)
            if err != nil {
                log.Println(err)
                return
            }
        }
        fmt.Printf("%d: %v\n", p.ID, p)
    }
    waiter.Wait()
    elapsed := time.Since(start)
    fmt.Printf("Total time: %v", elapsed)
}
```

- Second version

```go
func main() {
    var waiter sync.WaitGroup
    for _, currentId := range ids {
        waiter.Add(1)
        go func() person { 
            defer waiter.Done()
            p, err := getPerson(currentId)
            if err != nil {
                log.Println(err)
                return
            }
        }
        fmt.Printf("%d: %v\n", p.ID, p)
    }
    waiter.Wait()
    elapsed := time.Since(start)
    fmt.Printf("Total time: %v", elapsed)
}
```

- details
    - the code from fetchAnmdDisplay has been inlined as annonymous function
    - no need to fiddle aroudn with pointers to `waiter` object any more
    - in second version, `currentId` doesn't work
        - in closures, value is from time var was used, not from time var was captured
        - if you try to capture an indexer, you will run into these kinds of problems
        - but you'll get a warning if you try to do this

