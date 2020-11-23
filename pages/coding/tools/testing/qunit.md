---
layout: page
location: pages/coding/tools/testing/leaf
permalink: /pages/coding/tools/testing/QUnit
---

## Example tests

See [sample code base](https://github.com/claresudbery/Cadogan) (only
available to Clare)

### Acceptance tests

  - These use qunit
  - They use the Contentful Acceptance space (which isn’t used for
    anything else - has no front end)
  - When running the tests, it spins up your instance locally (See
    Tests/helpers/start-app.js?), visits particular routes and then
    interrogates the DOM
  - There are page helper objects such as article-page.js which know how
    to select items specific to that page

### Integration tests

  - All about what gets rendered
  - These use Ember-qunit, which renders Ember components
  - So basically we’re testing that the correct things are rendered –
    so, the component is doing what it should with data passed in, and
    based on Ember templates
  - Handlebars and components are tested in integration tests created by
    ember
