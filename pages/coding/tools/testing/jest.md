---
layout: page
location: pages/coding/tools/testing/leaf
permalink: /pages/coding/tools/testing/Jest
---

## Misc

- Javascript unit testing framework
- [Docs](https://jestjs.io/docs)
- [Matchers](https://jestjs.io/docs/using-matchers)

## Running only subsets of tests

Because I edited my package.json like this...

```
"scripts": {
    "test": "jest",
    "test:char": "jest --watchAll --testPathPattern=src/character-copier",
    "test:fizzbuzz": "jest --watchAll --testPathPattern=src/fizzbuzz",
    "test:leap": "jest --watchAll jest --findRelatedTests src/leap-year"
  },
```

... I can run this in the terminal - `npm run test:char` - and it will watch my code and run tests in the background, but only for the specified folder.