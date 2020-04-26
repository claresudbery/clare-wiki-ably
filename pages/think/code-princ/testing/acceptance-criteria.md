---
layout: page
location: pages/think/code-princ/testing/leaf
permalink: /pages/think/code-princ/testing/Acceptance-Criteria
---

## Intro

Acceptance criteria can be a useful way of capturing in formal terms exactly what we're trying to achieve with a particaulr user story. They should ideally be able to form the basis of any tests written to prove the goals have been achieved.

A common way of doing this is using the given-when-then ["gherkin" syntax](https://cucumber.io/docs/gherkin/), which can be converted directly into tests using various tools ([Cucumber](https://cucumber.io/) is a commonly-used framework - I believe Cucumber were the team that originally developed Gherkin).

## A slightly tricky example

We prefixed product IDs with a letter of the alphabet to identify a broad category. Historically those Ids were prefixed with 'X' to show that we couldn't find a matching category.

With updated lookup data we were able to fix a lot of the IDs and replace 'X' with something more meaningful, but there was a handful that needed further investigation.

The original ACs:

1. **IDs starting with 'X' that we have category data for**
Given the database contains a product ID that previously started with 'X'
And the database has up to date category data for that product
When a user views that product
They will see an ID that has been updated to replace the 'X' with the correct prefix

2. **IDs starting with 'X' that we DON'T have category data for**
Given the database contains an ID starting with 'X'
And the database has NO up to date category data for that product
Then we will provide the admin team with a spreadsheet containing product ID and sub-category so that they can find the correct product prefix
And they will update the product ID
And finally users will see a product ID that has been updated to replace the 'X' with the correct prefix

I didn't feel entirely happy with this, so I asked our experienced Business Analyst [Joe McGrath](https://joemc.gr/) for advice, and this is what he said: 

- "I’d try to isolate the system under test, which I think is a script/process that will run against the database.
- Focus on the task at hand - fixing the data, rather than describing what users will see.
- Keep it slightly more abstracted.
Possibly don’t need to mention ’the database’
- It can help to use a more specific example."

Here is the alternative he suggested, with a third scenario added by me:

**1. Product IDs starting with 'X' that we have category data for**
Given a product with an ID prefixed with `X`
And the sub-category of the workplace matches category `T`
When the script runs
Then the product ID will NOT be prefixed with `X`
And the product ID will be prefixed with `T`

**2. Product IDs starting with 'X' that we DON'T have category data for**
Given a product with an ID prefixed with `X`
And the sub-category of the product does not match our category data
When the script runs
Then the product ID will still be prefixed with `X`
And the product ID and sub-category will be added to a list for further processing

**3. Product IDs starting with 'X' that the admin team have found a category prefix for**
Given a product with an ID prefixed with `X`
And Jackie's team have determined that the product matches category `T`
When the script runs
Then the product ID will NOT be prefixed with `X`
And the product ID will be prefixed with `T`

