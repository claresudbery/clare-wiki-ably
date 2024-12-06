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

## Format currency / accounting data with negative amounts in read with minus signs

- To format negative amounts:
- Select the cell or column
- Select Format => Cells from the menu
  - or right-click => Format cells
- Select Currency
  - Set decimal places = 2
  - Set Symbol = £
  - Set negative numbers = Red text
- Select custom
  - You'll probably see the Type field is already filled in with `£#,##0.00_);[Red]£#,##0.00`
  - Edit it slightly to add a minus symbol after `[Red]`
    - ...so it looks like this: `£#,##0.00_);[Red]-£#,##0.00`
- Now all the amounts should have £ symbols and the same num of decimal places
  - ...and all the negative amounts should be in red with minus symbols in front

## Format time elapsed to cope with times greater than 24 hours

- Select the cell or column
- Select Format => Cells from the menu
  - or right-click => Format cells
- Select Time
  - Select the one without the asterisk
- Select custom
  - You'll probably see the Type field is already filled in with `hh:mm:ss;@`
  - Change it to `[hh]:mm:ss;@`
  - If you want, get rid of seconds: `[hh]:mm;@`
- ! Gotcha!
  - MS Excel calculates this as time elapsed since 31/12/1899
  - This means if you want to edit the value and you double slick in the cell, it'll show you something odd like `01/01/1900 21:25:00`
  - Rather than try to calculate what this value should be, just select the cell and type the value you want directly in (without double-clicking).

## Convert time in seconds into a decimal number

- If D2 contains time formatted as `56:30`...
- In anoither cell, enter the formula `=ROUND(D2*24,2)`
- Should give you `56.50`
