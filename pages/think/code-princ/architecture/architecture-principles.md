---
layout: page
location: pages/think/code-princ/architecture/leaf
permalink: /pages/think/code-princ/architecture/Architecture-Principles
---

## Neal Ford workshop

- My notes on Neal Ford's architecture workshop: OneDrive\TW-Stuff\Writing\Architecture Book\Neal Ford architecture workshop

## Things to think about for webapps

- CMS (Content Management System)
    - No hard-coded strings
    - Content changes can be made without deploying
- SPA
    - Single Page Architecture
- Progressive enhancement
    - No javascript by default
    - Not possible with client-side rendering
- Client-Side Rendering (CSR) vs Server-Side Rendering (SSR)
    - [Here](https://medium.com/@addyosmani/progressive-web-apps-with-react-js-part-4-site-is-progressively-enhanced-b5ad7cf7a447)
    - [Here](https://www.freecodecamp.org/news/what-exactly-is-client-side-rendering-and-hows-it-different-from-server-side-rendering-bd5c786b340d/)
- Route management 
	- Do your urls make sense? Will they help your users to navigate your site, and will they help you with things like Google Analytics?
- Performance 
	- Page load speed 
	- Above the fold / below the fold 

## Feature Toggles / Feature Toggling

- There is an example of this in [Samba](https://github.com/claresudbery/samba) - see the `Feature Toggles` section in the [Useful Notes doc](https://github.com/claresudbery/samba/blob/master/Useful-Notes.docx) (accessible to clare only)