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

- [Getting started with Jest and React](https://jestjs.io/docs/tutorial-react)
- [Testing a React app created using create-react-app](https://facebook.github.io/create-react-app/docs/running-tests)
- CLARE ONLY: CBF [github repo - basic unit tests](https://github.com/claresudbery/cbf-sample-solutions/tree/main/software%20engineering/B_tdd/tdd-javascript/2022-10_sample-solutions/src) 
- CLARE ONLY: CBF [github repo - React and Jest](https://github.com/claresudbery/cbf-sample-solutions#react) 

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

## Troubleshooting with React

### Invalid hook

- When you get an error saying invalid hook in jest tests:
- you might need to update your version of jest
    - like this: `npm install react-router-dom@6`
- https://reactjs.org/link/invalid-hook-call
- https://github.com/next-page-tester/next-page-tester/issues/147

### testing-library issues

"Cannot find module '@testing-library/react' from [path to test file]"

- Solution: `npm install --save-dev @testing-library/react`
- or `npm install --save @testing-library/react @testing-library/jest-dom`

### Can't install testing library because dependencies

ERESOLVE unable to resolve dependency tree
npm ERR!
npm ERR! While resolving: client@0.1.0
npm ERR! Found: react@17.0.2
npm ERR! node_modules/react
npm ERR!   react@"^17.0.2" from the root project

This is because you have an old version of react

Solution: `npm install react react-dom` to get latest version

### Upgrading react has no impact

package.json still has `"react": "^17.0.2",` even after running `npm install react react-dom`

Solution: 

- Run the install command in the ROOT of your project (one level higher than client and server)
- Remove the older react and react-dom versions from dependencies in package.son in the sub-project
- Run npm install again (in the sub-folder)

