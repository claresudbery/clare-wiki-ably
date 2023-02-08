---
layout: page
location: pages/coding/tools/testing/leaf
permalink: /pages/coding/tools/testing/Jest
---

## Misc

- Jest is a javascript unit testing framework
- [Docs](https://jestjs.io/docs)
- [Matchers](https://jestjs.io/docs/using-matchers)

## Links

- CLARE ONLY: CBF [github repo](https://github.com/claresudbery/cbf-sample-solutions/tree/main/software%20engineering/B_tdd/tdd-javascript/2022-10_sample-solutions/src) 

## Running only subsets of tests

Because I edited my package.json like this...

```
"scripts": {
    "test": "jest",
    "test:char": "jest --watchAll --testPathPattern=src/character-copier",
    "test:fizzbuzz": "jest --watchAll --testPathPattern=src/fizzbuzz"
  },
```

... I can run this in the terminal - `npm run test:char` - and it will watch my code and run tests in the background, but only for the specified folder.