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
# Power Query and Tables
- I've used this to transform data from one worksheet and pull it into another
- My notes on how I did this are in clare-tech: finance-rationalisation.md.
- Starting a Power Query isn't currently possible in Excel for the web. You can, however, Start a Power Query in the Excel desktop app:
	- To open the desktop app, at the top of the ribbon, select **Editing** (top right) > **Open in Desktop App**.
	- You might also need to [[#Power Query - Internal Database Connection|change the database connection]]
## Power Query - Internal Database Connection
- The default is for the database connection to be hard-wired to access a file on your local file system
- This breaks if you try to access a spreadsheet on a different machine
- To fix this:
- Instead of pulling data from an external Excel file (which forces a file path), you want to tell Power Query to look natively inside itself.
- Open your workbook in the desktop app. Go to the **Data** tab and open your query in the **Power Query Editor**.
- In the Power Query ribbon, go to the **Home** tab and click **Advanced Editor** (in the middle at the top). This opens the M code behind your query.
- Look at the very first line of code (usually labeled `Source = ...`).
	- It probably looks something like this right now:
	- `Source = Excel.Workbook(File.Contents("C:\Users\HomeLaptop\OneDrive\Spreadsheet.xlsx"), null, true),`
	- Replace that entire Source line with this exact text: `Source = Excel.CurrentWorkbook(),`
- Because `Excel.CurrentWorkbook()` immediately lists all the tables and named ranges _inside_ your current file, the next line in your code (the navigation step) needs to point directly to your specific table.
	- Change your second line from this (replace `YourTableName` with the actual name of your Excel Excel table)...
	- `#"Navigation 1" = Source{[Item = "YourTableName", Kind = "Table"]}[Data],`
	- ...to this:
	- `#"Navigation 1" = Source{[Name = "YourTableName"]}[Content],`
	- Old way (`Excel.Workbook`): It looks for column names called `Item`, `Kind`, and `Data`.
	- New way (`Excel.CurrentWorkbook`): It looks for column names called `Name` and `Content`.
## Troubleshooting
### After Google Sheets download, cell borders disappear
- "I'm looking at a tab in an Excel spreadsheet that was originally downloaded from a Google sheet. I have the formatting set so that negative financial amounts are shown in red text. But in all of those cells the default faint grey borders have disappeared. How do I get those faint grey borders back?"
- This is a classic glitch that happens when exporting from Google Sheets to Excel.
- When negative formatting is set up in Google Sheets using **Conditional Formatting** or standard styling with a **white fill color**, Google Sheets explicitly converts that background to a solid `#FFFFFF` (White) fill in the Excel `.xlsx` file. In Excel, a solid white background paints _over_ the default light-grey gridlines, making them completely disappear behind those cells.
- Fix: Clear Fill in Conditional Formatting Rules
- Select the affected range or press `Ctrl` + `A`.
- On the **Home** tab, click **Conditional Formatting** → **Manage Rules...**
- In the dropdown at the top of the manager, select **This Worksheet**.
- Double-click the rule that makes negative numbers red.
- At the bottom, where it says "Format with...", double-click the formatting rule to open the formatting dialogue.
- Switch to the **Fill** tab and set background colour to **No Colour** (instead of White).
- Click **OK** on all open windows to apply.