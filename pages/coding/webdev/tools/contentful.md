---
layout: page
location: pages/coding/webdev/tools/leaf
permalink: /pages/coding/webdev/tools/Contentful
---
## Intro

- Contentful – headless CMS – third party – often used to serve data up to a content API
- Note that there were originally a lot more notes than this but they
  were all specific to a particular website (Cadogan). The full
  original notes are at OneDrive\\TW\\…\\Cadogan\\TechInfo\\Tech Info
  - Shared\\Documentation + Notes\\Contentful.docx.
- As well as Cadogan, Samba also used Contentful. More info [here](https://github.com/claresudbery/clare-tech/blob/master/notes/clients/samba/useful-samba-links.md).
- Contentful url:
  [https://app.contentful.com](https://app.contentful.com/)
- Contentful is divided into spaces
    - Select the space you want from the burger menu, top left
- Use the Content menu to edit content
- Use the Content Model menu to change the structure of the content
    - (add new content models, add fields to content models, etc)
- When editing content:
    - you can publish or save to draft (green button, top right)
    - Click the info button, top right, to find out what content type
      you are currently viewing
    - draft content will have an orange disc shown on it
    - Versions, over on the right, allow you to look at previous
      versions and audit changes
- To filter content:
    - Click the Filter button on the right hand end of the search
      input, available when you first click Content
- Space settings allow you to edit users, access API keys, edit
  webhooks
- Webhooks
    - See logs for when it was called but can also configure which
      events trigger it
    - This can be used to refresh the cache at the backend whenever
      changes are made in Contentful
    - See the backend|caching|webhooks section in the original doc
      “Accessing, Debugging, Navigating Code”
      (OneDrive\\TW\\…\\Cadogan\\TechInfo\\Tech Info -
      Shared\\Documentation + Notes) to see how webhooks were used at
      Cadogan to clear the backend cache every time new content was
      published
- Acceptance spaces in Contentful can have no UI – useful for front
  end acceptance tests
- Main menu => Users
    - Allows us to give different permissions to different users
- Content Model
    - Entry title determines how something is displayed to user
- Sometimes you will see a bunch of objects which are untitled
    - But they are published and title is mandatory
    - This is probably because when they were first created, title was
      not mandatory
    - It’s been added later but nobody’s been back to edit

## Advanced Searching

  - If, for instance, you want to find all the restaurants that
    reference a particular Amenity:
      - Select content type (eg Restaurant)
      - click the filter button to the right of the search input
      - scroll down all the fields that live on restaurant until you
        reach Amenities
      - Click in the input (where it says “click to select”)
      - Select the amenity you are interested in

## Exporting / Backing up Data

- Spaces are sections in contentful – each space has its own ID
  - Space Ids look like dfghsdfglhjk
  - These count as sensitive info and would get caught by githooks in Samba
- Useful link on space management:
  [<span class="underline">https://www.contentful.com/developers/docs/tools/spacemanagement/</span>](https://www.contentful.com/developers/docs/tools/spacemanagement/)
- Manual backups are available via this export route, but if we
  upgraded the pricing plan we would get an auto-backup feature from
  Contentful
- ([Code link for Clare
  only](https://github.com/claresudbery/Cadogan))
- Each of the front-end code bases has a scripts/contentful folder
- In this folder, is a script - export.sh - and a config file -
  export.json.
- In export.json, edit the Contentful space Id and management token
  for the space you’re backing up:
    - Space Id:
        - To look up a space id in Contentful:
        - Visit the contentful space you want (in Contentful UI)
        - Click Space Settings | General (top right)
    - Management Token:
        - In Contentful UI:
        - Click APIs (top menu)
        - Select Content Management Tokens
        - Click Generate Personal Token
        - \!\! Make sure you copy the token and keep it somewhere\!
          You can’t access it again\!
        - ***You can use the same token across all spaces for all
          brands.***
- Now from the same folder, run the following command:
    - Mac Terminal: **sh export.sh**
    - Powershell on Windows: **./export.sh**
    - when you run export.sh, all exported data is put into a file
      like data.json – with its own name – specially created
    - It gets put in the folder you ran the command from
    - When it’s finished, you’ll get feedback on the command line:
      “Writing data to file”
- Then you can import using import.sh and import.json
    - These do model only, so if you already have data it will remain,
      but with empty new properties
    - When going live and you want to push a whole space (eg from
      preprod to prod) then you can take away the model-only flag and
      then you’ll get data too.

## Colours

  - You can have a Color Palette content model which is used throughout
    the content to set the color scheme used in various components
  - For instance a CollectionTile content model, give it a Title Colour
    field.
      - This can be configured as a Short text, but if you click
        Settings in the content model, then click Validations, configure
        it to only accept certain hard-coded constant values.

## Article Pages

  - As well as having slug, they can have directory
      - This allows more ordering
      - So that each article sits within a directory
      - If directory is thing1 and slug is thing2, then url for article
        will end thing1/thing2
      - This is about having better SEO (Search Engine Optimisation)
  - Article pages can have subsidiary content types:
      - eg different types of tiles
