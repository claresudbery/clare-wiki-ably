---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Microsoft-Excel
---

## Docs and Blog Posts

- [My InSimpleTerms blog](https://insimpleterms.blog/category/excel) (Excel category)


## Misc

- Various Excel resources: Dropbox\IT Training\Excel

## Merge data based on one column

- Potential scenario:
    - Let's say I have one spreadsheet with a list of people, their names, their IDs and some status that denotes whether I've messaged them via DM.
    - I also have another spreadsheet containing the same people - with IDs, without the DM status but including their email addresses.
    - I want to update the first spreadsheet by grabbing the email addresses from the second spreadsheet. I'll use the ID column to map the data from one to the other.
- Solution:
    - You can use `VLOOKUP`, `XLOOKUP` or `INDEX`.
    - More info [here](https://www.ablebits.com/office-addins-blog/2018/10/31/excel-merge-tables-matching-columns/).

