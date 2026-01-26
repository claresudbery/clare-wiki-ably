---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Microsoft-Excel
---

## Docs and Blog Posts

- [My InSimpleTerms blog](https://insimpleterms.blog/category/excel) (Excel category)

## Google Sheets vs Excel

- Note that most of the formulas here will also work on [Google Sheets](/pages/coding/data/Google-Sheets), and vice versa

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

## Format currency / accounting data with negative amounts in red with minus signs

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

## FILTER / CONTAINS SUBSTRING

- Return all the cells that match the search criteria
- The good thing about this is that you can search one col but return the contents of another col in the same row
- For instance: `=FILTER(D2:E10,ISNUMBER(SEARCH(A1,C2:C10)),"No results")`
  - This will return all the values in `D2:E10` (so, two cols of data)
  - ...but only for those rows where the value in col C contains the value in `A1` as a substring

## Filter, lookup, vlookup

- See [Google Sheets](/pages/coding/data/Google-Sheets), seeing as most of that stuff is interchangeable.

## Conditional formatting 

- To base it on a formula:
	- Highlight the whole range you want to apply the formatting to
	- In Click Home 
		- => Conditional formatting (from the ribbon)
		- => Highlight cells rules 
		- => More rules
	- From the "Only format cells that contain" dropdown, select "Use a formula..."
	- Then, for instance, to say only highlight rows that have an even value in col F, enter the following: `=ISEVEN($F2)`
		- Important:
			- You need the `=` symbol
			- The row number of the referenced cell (in this case row 2, cos F2) needs to be the first row in the range you started by selecting
			- The `$` symbol ensures that the formula will be applied to all rows
	- You can see an example of this in Dropbox/Accounting/Tax/Felix/24-25-felix-calcs.xlsx, on the Subsistence tab
	- To edit afterwards:
		- Select Home => Conditional formatting (from the ribbon) => Manage rules
		- If you haven't selected any of the cells in the range, select this worksheet from dropdown at the top
		- Select rule, then Edit Rule at the bottom
		- You can change the range under "applies to" at the bottom
			- Don't use left and right arrow keys in this field, it makes weird things happen!
		- Use plus and minus buttons bottom left to add and remove rules