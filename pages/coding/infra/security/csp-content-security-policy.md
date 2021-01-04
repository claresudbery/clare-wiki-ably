---
layout: page
location: pages/coding/infra/security/leaf
permalink: /pages/coding/infra/security/CSP-Content-Security-Policy
---
## What is CSP

  - **Content Security
    Policy** ([CSP](https://developer.mozilla.org/en-US/docs/Glossary/CSP))
    is an added layer of security that helps to detect and mitigate
    certain types of attacks, including Cross Site Scripting
    ([XSS](https://developer.mozilla.org/en-US/docs/Glossary/XSS)) and
    data injection attacks.
  - Configuring Content Security Policy involves adding
    the [Content-Security-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) HTTP
    header to a web page and giving it values to control what resources
    the user agent is allowed to load for that page.
  - [More here](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP).

## A Half Example

  - It’s available
    [here](https://github.com/claresudbery/samba/tree/master/csp-testing)
    (to Clare only).
  - I seem to have kept only some of the relevant code – it’s some of
    the test code we wrote for this at Samba.
  - I also have the browser errors that prompted us to write these tests
    in the first place – in the same folder.
