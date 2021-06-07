---
layout: page
location: pages/coding/infra/cloud/leaf
permalink: /pages/coding/infra/cloud/Snap-CI
---
## Setting up Snap CI for new members:

  - They need an account in GitHub
  - Then in GitHub:
  - Click Invite Members
  - Add them to the relevant team
  - They then get an email, they have to click the button in the email
  - Then they sign in to Snap CI, Authorize, then add repo, then include
    private
  - Then in GitHub they have to authorize Snap CI
  - Then in Snap CI, an admin does this:
      - Go to a project’s build history
          - Eg:
            <https://app.snap-ci.com/smbc-digital/iag-contentapi/branch/master>
      - Click Configuration, top right
      - Click Collaborators, top right
      - Click “Sync with github”, top right
          - \! Only admins get this sync button
          - \! If you have been set up as an admin, your admin
            privileges won’t come through until somebody else has hit
            Sync with github *on all relevant projects*, and you have
            logged out and logged back in again
      - Do this for all projects\!
      - More details here:
        <https://docs.snap-ci.com/managing-your-github-connection/managing-membership/>
