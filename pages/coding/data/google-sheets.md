---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Google-Sheets
---

- Google Sheets

## Google Sheets vs Excel

- Note that most of the formulas here will also work on [MS Excel](/pages/coding/data/Microsoft-Excel), and vice versa

## Sorting

- To sort by single column:
  - Select the column
  - Select Data => Sort sheet by column
- To sort by multiple columns:
  - Select ALL columns unless you want only some columns to be sorted (see explanation below)
  - Select Data => Sort the range
  - You can now select the cols you want to sort by and the order you want them sorted in
- Why you select all columns: 
  - If you don't, only the cols you select will be sorted, and the others will remain unsorted
  - So for instance if you only selected and sorted on the second ("Page name") column, this:

| Index  | Page name | Link |
| ---    | ---       | ---  |
| 1      | The page 1 | http://Link-page-1 |
| 2      | This page 2 | http://Link-page-2 |
| 3      | My page 3 | http://Link-page-3 |

... could become this:

| Index  | Page name | Link |
| --- | --- | --- |
| 1  | My page 3 | http://Link-page-1 |
| 2  | The page 1 | http://Link-page-2 |
| 3  | This page 2 | http://Link-page-3 |

## String manipulation

The cell formula below uses the following string manipulation and other functions:

- IF 
- CONCATENATE
- LEFT (substring from left end of string)
- RIGHT (substring from right end of string)
- FIND (find index of substring)
- REVERSE
- LEN (length)

```
=IF(E2="Yes","",CONCATENATE(IF(B2="wiki","wiki-folder ","tech-folder "),LEFT(C2,LEN(C2)-FIND("/",REVERSE(C2)))," ",RIGHT(C2,FIND("/",REVERSE(C2))-1)," ",D2))
```

**Example:**

With this table info...

| index	| wiki | Folder	Path | Folder Title | Folder Exists? |
| --- | --- | --- | --- | --- |
| 66	| wiki | coding/infra/testing | Testing | No |

...you would get this output: **wf coding/infra testing Testing**

More info [here](https://support.google.com/docs/table/25273?hl=en&ref_topic=9054531).

## Time formatting

- To get times that are summed to be potentially more than 24 hours: 
- Format => Number => Custom date and time => click the dropdown and select elapsed hours, then type a colon, then select minutes from the dropdown.
  - If you google it, it will tell you to type "[hh]:mm" into the field, but I couldn't get this to work. I had to select from the dropdown instead, and then when I viewed it in the Format menu it would say "[hh]:mm" even though it wouldn't let me enter that manually
  - ...or you can just select "Duration" in Format => Number in the date/time section
- !! Sometimes it doesn't work when you are using the `SUM` formula. I disco vered that if I'd added a `SUM` formula to a column that didn't have the correct formatting, then I fixed the formatting, the value would still refuse to over `24:00`. The solution seemed to be to delete the `SUM` formula and then manually re-insert it. Then finally I could get a value over `24:00`.
- To convert times into a decimal num of hours and/or minutes, you can use the `HOUR` and `MINUTE` functions (eg `HOUR(C3)`)
  - BUT these do not work on times that have more than 24 hours, because the number of hours returned is always between 0 and 23.
  - To get more than 24 hours you need to use the `CONVERT` function, AND make sure the formatting of your cell is Format => Number => Number
  - Like this: `CONVERT(A3, "day", "hr")`
    - The time in Sheets is technically a day unit, where 24 hours make up a full day.
    - This will give you a decimal value, eg 3.4 hours - so no need to get minutes as well.
    - ! Watch out the target cell is formatted as a number! Otherwise you won't get the right result.
  - Another way of achieving the same is like this: `MOD(HOUR(A1),24)+MINUTE(A1)/60+SECOND(A1)/3600`
  - ...and yet another way is like this: `=INT(TEXT(E4,"[h]"))+(MINUTE(E4)/60)`
  - !!! I was finding that NOTHING worked, it was just stubbornly ignoring everything over 24 hours no matter what
    - ...It turned out something somewhere was corrupt, and when I started again with a new col, it worked fine.


## Conditional formatting

- If you want a column of data to change colour based on another column
  - so for instance, 
    - cell H4 only goes green if C4 is populated
    - cell H5 only goes green if C5 is populated
    - etc
  - Highlight the range of cells or column
  - Format => Conditional formatting
  - Over on right hand side: 
    - Select Custom from the drop-down "Format cells if..."
    - Enter the formula as it would apply to the top row in the range - eg `=C4>0`
    - Click Done
    - It will automatically adjust the formula to apply correctly to each individual row
  - If it gets out of sync after you've copy/pasted or cut data from one place to another:
    - Delete the custom formula and do it again

## Getting references to work when you copy multiple sheets

- If you copy multiple sheets from one spreadsheet to another, and they contain cells that reference each other...
- The references between tabs will all appear to be broken
- You need to trick the formulas to recalculate: 
  - Edit => Find and Replace => Replace `=` with `=` => Replace all
  - Make sure you check the "Also search within formulae" box
- But actually a simpler way is to copy the whole spreadsheet (File => Make a copy) and then just delete the stuff you don't want

## FILTER / CONTAINS SUBSTRING

- Return all the cells that match the search criteria
- The good thing about this is that you can search one col but return the contents of another col in the same row
	- You can also search more than one col - see [[#Using FILTER to search more than one col|below]]
- For instance: `=FILTER(D2:E10,C2:C10=A1)`
  - This will return all the values in `D2:E10` (so, two cols of data)
  - ...but only for those rows where the value in col C equals the value in `A1`
- A more complex example: `=FILTER(D2:E10,REGEXMATCH(C2:C10,A1))`
  - This will return all the values in `D2:E10` (so, two cols of data)
  - ...but only for those rows where the value in col C _contains_ the value in `A1` as a substring
- Incidentally, to achieve the same result in Excel, you'd do it like this:
  - `=FILTER(D2:E10,ISNUMBER(SEARCH(A1,C2:C10)),"No results")`

### Using FILTER to search more than one col


- For instance: `=FILTER(D2:E10,C2:C10=A1,E2:E10='Splat')`
  - This will return all the values in `D2:E10` (so, two cols of data)
  - ...but only for those rows where the value in col C equals the value in `A1`
	  - ...AND the value in col E equals "Splat"

## Diff between FILTER and VLOOKUP

- `FILTER` allows more complex search conditions
- `VLOOKUP` is for just looking up one value
  - eg find all the rows where the values in one col are the same as each other
  - then return the values from a different col in those rows
  - Useful for finding specific information like an employee name based on their ID 

## VLOOKUP and Gotchas

- If you want to find a value and then return another value from the same row
- it looks like this: `=VLOOKUP(A1,C2:E10,3,0)`
  - You're searching for a match for `A1`
  - The range of values you're searching ("the table") is `C2:E10`
  - You're going to return the value from the 3rd col in the table (C is the first col, E is the third)
  - The `0` represents `false` for `range_lookup` which means the data is sorted in ascending order 
	  - !!! If the search col of your source data is NOT in ascending order, you'll get really odd results!
	  - So ignore / miss this value at your peril. You might want to set it to false. It defaults to true if you miss it out.
- So... 
  - youre looking at a range of data, and 
  - you want to see whether anything in the first col of your range has the same value as cell A1,
  - and if it does you want to return the value in the third col of your range, in the same row as the matching value
  - so for instance, if your range is cols C to E, and you find a match in cell C2 (row 2, col C), then the value returned will be the value in cell E2 (row 2, col E)
- If you want to return an empty string if the `VLOOKUP` fails to find a result, wrap it in `IFERROR`:
  - `=IFERROR(VLOOKUP(A1,C2:E10,3,0),"")`
- If you want to return not just a single value but a sum of values in many cols...
  - First of all, if it's a simple example, maybe you just want [SUMIF or SUMIFS](<#sumif to calculate all the values that relate to a condition>)?
  - See this spreadsheet for an illustration of the different approaches: https://docs.google.com/spreadsheets/d/16pQ6E9zYMN1zaNgM6gCVA-b2UalYj2UhgTsyiv3j0rw/edit?gid=1372164098#gid=1372164098
  - First approach:
    - Use `FILTER` instead of `VLOOKUP`: `=SUM(FILTER(D2:E10,C2:C10=A1))`
  - Second approach:
    - a. Instead of just giving one result col, give a whole set
      - So in the example above, `{2,3}` instead of `3`
    - b. Place a `SUM` around the outside of the whole thing
      - So the example above would go like this: `=SUM(VLOOKUP(A1,C2:E10,{2,3},0))`
    - c. But `SUM` on its own isn't enough, you also have to add `ARRAYFORMULA`
      - Like this: `=ARRAYFORMULA(SUM(VLOOKUP(A1,C2:E10,{2,3},0)))`
      - I discovered this when I followed the internet's advice and tried only steps 1 and 2, and it wasn't enough. These are the notes I made while I was looking for the solution...
        - I couldn't get this to work! 
        - Instead I had to use `=SUM(VLOOKUP(A1,C2:E10,2,0),VLOOKUP(A1,C2:E10,3,0))`
        - I posted a question about this [here](https://support.google.com/docs/thread/313246778?hl=en&sjid=14309708405826442934-EU)
        - Here's the fundamental question: "although I'm providing an array of columns to the VLOOKUP, the sum is only ever taking account of the first value returned, and is not summing across all values."
        - Here's a link to the spreadsheet where I demonstrated the problem: https://docs.google.com/spreadsheets/d/16pQ6E9zYMN1zaNgM6gCVA-b2UalYj2UhgTsyiv3j0rw/edit?gid=1372164098#gid=1372164098
- If you get the "out of bounds range" error:
  - You can only return values on the right hand side of the match
    - (if you want data on the left, use `INDEX` and `MATCH`)
    - (I couldn't get this to work though)
  - It will only search the first column of the table
    - (Col C in the example above)
  - The range of values you give it has to include both the lookup col and the result col
    - So in the example above, if I used `C2:C10` instead of `C2:E10`, I'd get an out of range error
  - When counting cols, start from the first col of the TABLE
    - (So above, even though col E is the fifth col on the sheet, it's the third col in the range of values we're searching ("the table"))
  - If the last arg is `1`, that means you're setting `true` for `range_lookup`, and if the data in the table isn't sorted in ascending order, that won't work

## Copy a whole col from one sheet to another

- Like this: `={Categories!A:A}`

## Copy multiple cols into one col without including empty rows

- Also works for merging multiple sheets into one
- Like this: `=FILTER({Categories!A:A;Categories!C:C},LEN({Categories!A:A;Categories!C:C}))`
- It only works on one col at a time, but you can use autofill functionality to pull the formula across into adjacent cols and get those cols filled in too
- If you want empty rows to be included, you can just change the `LEN` part to reference a col that contains no empty rows! For Clare, see Current Historic monthly in Time FRecording spreadssheet for an example.
- Sometimes the first row of time/date data will have the wrong format. The way to fix this is to copy formatting from the second row down to the first row (use the little paint roller icon)

## Have a chart which charts hours greater than 240 without going down to -144

- I asked for help with this problem [here](https://support.google.com/docs/thread/317591568?hl=en&sjid=15803700076749272558-EU)

"Hi

I have a chart tracking hours spent on various projects. But if any of the values go over 240 hours, the Y axis suddenly changes its lowest value to -144, even though there are no values less than zero.

According to the documentation, I can set min and max values for each axis via the Customize menu, but I see nowhere to set min/max values. ("To edit the minimum and maximum values for a chart in Google Sheets, you can do the following: 
Open the spreadsheet in Google Sheets
Double-click the chart you want to change
Click Customize on the right
Click Horizontal axis or Vertical axis
Enter the desired minimum and maximum values")

Here is a sample: https://docs.google.com/spreadsheets/d/15JekJRilFscgtecvxids5Bvn4UC-W1RQF6R6zqpgJc8/edit?usp=sharing

You'll see in the sample I've created two charts: One includes source data > 240 hours and the Y axis goes down to -144. The other has max data of 240 hours, and the Y axis is as I would want it to be.

I'm attaching a screenshot of what I see in the Customize menu for the vertical axis.

Hoping you can help! Thank you."

## Have a chart whose title and data change dynamically in response to source data changing

- I asked for help with this problem [here](https://support.google.com/docs/thread/317595598?hl=en&sjid=15803700076749272558-EU)
- "How can I make my chart title and content change dynamically in response to changes in source data?"
- Note that originally I thought I also had a problem with getting the number of columns in the line gvraph to change according to how many rows of data there are, but either I was wrong about this being a problem or at some point it just stopped being a problem!

"Hi

I have data which changes according to which year I'm looking at. For different years and combinations of years, the number of rows change and the header also changes to indicate which year(s) are being included.

I can create a chart from the resulting data, but its title appears to be fixed in stone, even when the underlying header and number of rows changes.

Is it possible for the chart title to change dynamically in response to data? I would love it if I didn't have to manually edit the chart title every time the underlying data changes.

Here is an example of my problem. In cell A2, you'll see there is text which changes according to which years have been selected. I would like this cell to be used as the title for the chart. If you change the values in cells F2, G2 and H2 (to "yes" or "no"), data from different years is taken into account and the text in A2 changes. 

I've created two charts (pie chart and line chart). I can't find a way for either of them to change their title in response to the data in cell A2.

Here is the spreadsheet: https://docs.google.com/spreadsheets/d/1IoiIcPQWQw_6yx2GGq1ZHP5Y3k-TeJ-xHG9QIJ8tj7E/edit?usp=sharing

Hoping somebody can help! Thank you."

## Insert multiple rows

- This is a really weird one!
- You select the number of rows you want to insert
  - even if those rows have data
- Then right-click and you'll get the option to "insert n rows" where n is the number of rows you selected
- Now n empty rows will be inserted above the top selected row
- ...and all the data in the selected rows will get pushed down by the newly inserted rows

## Sort data via function

- `=SORT(A2:B26, 1, TRUE)`
  - This sorts the range `A2:B26`, in ascending order (`TRUE`), using the data in col `1` (the first col, col A) to do the sorting.

## Create a unique list of data, removing duplicates, in order

- `=SORT(UNIQUE(A1:A10), 1, TRUE)`
  - This sorts the unique set of data, in ascending order (`TRUE`), using the data in col `1` (the first col, col A) to do the sorting.

## Why is search-replace / find-replace not working?

- Is it because you're searching derived data, eg data that's being populated via something like `VLOOKUP` or `FILTER` or arrays like `={Categories!A:A}`?
  - In that case, search the source data instead
- ...or is it because you're searching for text that's come from a data range, eg `=meet` being translated into `Meeting`?
  - In that case, search will work but search/replace will not.
  - You need to check "Match entire cell contents" and "Also search within formulae" and then you need to search explicitly for (eg) `=meet` and replace it explicitly with (eg) `=bigmeet`

## How to autofill down hundreds of rows without manually dragging the blue square in the corner

- Copy a cell that contains the formula you want to autofill
- Select the _whole column_
- Paste

## How to search for cells that contain errors

- A quick way to discover whether a column contains any errors is to create a sorted (in descending order) unique list of all unique values in that col(s)
  - If any errors, you'll get one `#REF!` entry at the top of the list
  - Like this: `={SORT(UNIQUE('The sheet I'm interested in'!A:A),1,FALSE);SORT(UNIQUE('The sheet I'm interested in'!B:B),1,FALSE)}`
    - The `FALSE` indicates descending order
    - The enclosing `{}` and semi-colons allow you to create an array of multiple cols in one col
- Then, if there are errors, you'll need to find individual erroring cells:
  - You can't just search for `#REF!`
  - Instead, wrap formulas in `IFERROR` to fill the cells with searchable text
    - Like this: `=IFERROR(formula_name,"THIS FIELD IS ERRORING")`
  - If you don't want to do that in the source data, you can create a copy of the data somewhere and search that instead
    - eg `=IFERROR('The sheet I'm interested in'!D1,"******ERROR-ERROR-ERROR******")`
    - then autofill the entire col by copying that cell and then selecting the col to autofill all the way down
  - You can do the same for neighbouring cols if they'll help you to find the bad rows

## SUMIF to calculate all the values that relate to a condition

- (If you want to AND multiple conditions, see below - [SUMIFS](<#sumifs to calculate all the values that relate to multiple conditions>))
- Note that the values to be summed are the LAST param - which is the opposite to `SUMIFS` (see below - [SUMIFS](<#sumifs to calculate all the values that relate to multiple conditions>)))
- Like this: `=SUMIF(C2:C300, "=y", D2:D300)`
  - This means add all the values in the D col from rows where the C col has the value "y"
- ...or this: `=SUMIF(B2:B300, ">="&start_date, D2:D300)`
  - This means add all the values in the D col from rows where the B col has a date less than the specified start date

## SUMIFS to calculate all the values that relate to multiple conditions

- Like this: `=SUMIFS(D2:D300, C2:C300, ">="&start_date, B2:B300, ">="&start_date)`
  - This means add all the values in the D col from rows where the C col has the value "y" AND the B col has a date less than the specified start date
- Note that the values to be summed are the FIRST param - which is the opposite to `SUMIF` (see above - [SUMIF](<#sumif to calculate all the values that relate to a condition>)))

## SUMIF or SUMIFS where one condition is that a value exists in a range

- Quick answer:
  - To add all the C-col values from rows whose B col has a value that exists in range `'Values'!A2:A100`:
    - `=SUM(SUMIF(B2:B50,WRAPROWS('Values'!A2:A100,1),D2:D50,"YES"),C2:C50)`
  - To add all the C-col values from rows whose B col has a value that exists in range `'Values'!A2:A100` AND whose D-col val = "YES":
    - `=SUM(SUMIFS(C2:C50,B2:B50,WRAPROWS('Values'!A2:A100,1),D2:D50,"YES"))`
  - To add all the C-col values from rows whose B col has a value that exists in EITHER the range `'Values'!A2:A100` OR the range `'Values'!B2:B100` AND whose D-col val = "YES":
    - (Use `VSTACK` to combine two cols - see [below](<#stack multiple cols on top of each other to make one col>))
    - `=SUM(SUMIFS(C2:C50,B2:B50,WRAPROWS(VSTACK('Values'!A2:A100,'Values'!B2:B100),1),D2:D50,"YES"))`
- Explanation:
  - In other circumstances you could just say `B2:B50 IN 'Values'!A2:A100`
    - ...and you would mean that you want values that exist in the range `'Values'!A2:A100`
  - You can't do it quite like that in `SUMIF` or `SUMIFS`
  - What you're basically saying is that tyou want the value in col B to be 'Values'!B2 _or_ 'Values'!B3 _or_ 'Values'!B4... etc
  - You do this with an array: 
    - `=SUMIF(B2:B50,{"pending","complete"},C2:C50)`
  - That says that you'll sum the values in the A col as long as corresponding values in the B col equal either "pending" or "complete"
  - But this means you'll get TWO results 
    - 1. The sum for when B col values equal "pending"
    - 1. The sum for when B col values equal "complete"
  - So you have to sum the two results to add them all up:
    - `=SUM(SUMIF(B2:B50,{"pending","complete"},C2:C50))`
  - But what if, as originally stated, rather than the hard-coded `{"pending","complete"}` array, you want any of the values listed in `'Values'!A2:A100`?
  - You have to turn that range into an array, like this: `WRAPROWS('Values'!A2:A100,1)`
  - ...giving this: `=SUM(SUMIF(B2:B50,WRAPROWS('Values'!A2:A100,1),C2:C50))`
  - And finally, if you want to add other conditions, you just add them to the `SUMIFS` as normal.
    - The result will, as before, be several results than you then wrap in a `SUM`
    - Each of those results will also have the additional criteria applied to them

## Turn a column into an array

- `=WRAPROWS('Values'!A2:A100,1)`
- [More here](https://www.ablebits.com/office-addins-blog/excel-wrapcols-wraprows-functions/#wraprows)

## Stack multiple cols on top of each other to make one col

- `=VSTACK(H1:H5,I1:I5)`
- [More here](https://www.ablebits.com/office-addins-blog/combine-ranges-arrays-excel-vstack-hstack/#vstack)

## Stack multiple rows next to each other to make one row

- `=HSTACK(D1:I1,D2:I2)`
- [More here](https://www.ablebits.com/office-addins-blog/combine-ranges-arrays-excel-vstack-hstack/#hstack)

## Join a bunch of cells together with a comma separator, but only if they contain data

- `JOIN(", ", FILTER(AK3:BL3,AK3:BL3<>""))`

## Find out a cell reference

- `=CELL("row", A5)` returns row number `5` for cell A5
- `=CELL("col", A5)` returns col number `1` for cell A5
- `=CELL("address",'Sheet name'!A2)` return cell ref `'Sheet name'!$A$5`
- or you can convert col number to a letter like this:
  - `=REGEXEXTRACT(ADDRESS(ROW(A5), COLUMN(A5)), "[A-Z]+")`
  - The `ROW(A5)` part of this is actually irrelevant, cos it's only extracting the col letter
- or you can use regex to extract only the sheet name like this:
  - `=REGEXREPLACE(CELL("address",'Sheet name'!A2),"'?([^']+)'?!.*","$1")`
    - This will return `Sheet name`
  - This is useful if you want to return the sheet name to other things (like a script) in case it changes
- But if all you really want is to know the cell ref of a cell...
  - (you might want it for a script, so if a cell moves and its cell ref changes, the script wn't be broken)
  - This will give you `$A$5` and will change dynamically if A5 is moved elsewhere:
    - `=ADDRESS(ROW(A5), COLUMN(A5))`
  - The dollars are probably extraneous but they won't do any harm

## Graphs / Charts

### Having dynamic numbers of cells in source data

- The trick is to make the range of source data include a bunch of empty rows - as many as you think might get filled. The resulting chart will only contain data for cells / rows that were populated.
  - My timesheet spreadsheet contains plenty of examples (accessible to Clare only).

### Having chart titles that change dynamically in response to source data

- You need a script
- See [below](<#using a script to dynamically change chart titles>)

## Google Apps Scripts

### Overview

- They live under Extensions => Apps Script

### Scripts and Charts/Graphs

- Overall documentation [here](https://developers.google.com/apps-script/reference/charts#classes)
  - For methods available on charts, you want to look at methods available in various places:
    - `BarChartBuilder`, [here](https://developers.google.com/apps-script/reference/charts#barchartbuilder)
    - `PieChartBuilder`, [here](https://developers.google.com/apps-script/reference/charts#piechartbuilder)
    - `EmbeddedChart`, [here](https://developers.google.com/apps-script/reference/spreadsheet/embedded-chart)
      - ! A lot of useful stuff here that is otherwise hard to find!
- Documentation of different options available on the Chart object [here](https://developers.google.com/apps-script/chart-configuration-options)
  - [For bar charts](https://developers.google.com/apps-script/chart-configuration-options#bar-config-options)
  - [For pie charts](https://developers.google.com/apps-script/chart-configuration-options#pie-config-options)

### Using a script to get the name of a tab/sheet

- **Open the Script Editor:** In your Google Sheet, go to "Extensions" > "Apps Script".
- Copy and paste the following code into the script editor:
```vbscript
function SHEETNAME() {  
	let activeSheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();  
	return activeSheet.getName();  
}
```
- Click the save icon (looks like a floppy disk) to save the script.
- **Use the Function in a Cell:** In your Google Sheet, enter the formula `=SHEETNAME()` in the cell where you want the sheet name to appear.
- You can then reference the contents of that cell elsewhere in your spreadsheet.
- !!! But if you then rename your sheet, the results of this function don't seem to update automatically! 
	- Even refreshing the page and closing / reopening the spreadsheet didn't seem to make it update. In the end it seemed like I had to go into the cell with the `=SHEETNAME()` formula and press Enter to rerun the formula. 
	- But it also seemed like maybe that didn't work either, and what I actually had to do was delete the cell contents, tab away, then go back and repopulate the cell... and then it was CRAZY slow to repopulate (but I don't know if that's cos it was a giant spreadsheet).
	- But after that I could close and reopen the spreadsheet and it populated quickly.
### Looking up charts using their subtitle or title



### Using a script to dynamically change chart titles

- See explanation [here](https://benlcollins.kit.com/posts/sheets-tip-272-dynamic-chart-heading-in-sheets) (scroll down a little)
- For documentation of useful methods, see [above](<#scripts and chartsgraphs>)
- My example:

```javascript
/**
* Function to automatically change chart title
*/
function changeChartTitle() {

// get the chart
// assumes only one chart, adjust the index [0] if needed
const chartSheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('Hours per period');
const chart = chartSheet.getCharts()[0];

// get the chart title from the cell
const period = chartSheet.getRange('I1').getValue();
const hrsSpent = chartSheet.getRange('Q2').getValue();
const category = chartSheet.getRange('P2').getValue();
const newTitle = hrsSpent + " for " + category + ", " + period;

// update the chart title to the new title
const chartBuilder = chart.modify();
chartBuilder.setOption('title', newTitle);
const updatedChart = chartBuilder.build();
chartSheet.updateChart(updatedChart);
}
```

- Summary in case link breaks:
- In your Sheet with your chart, open the Apps Script editor from the menu:
Extensions > Apps Script
- Clear out the example code in the editor.
- Add the code in my example above and press save (the disk icon in the toolbar):
- This code assumes there is a single chart in the sheet called Sheet1.
- It takes the value from cell A1 as the chart title.
- Feel free to modify "Sheet1" and "A1" in the code to match your specific situation (e.g. if your sheet is called "Data" change the "Sheet1" to "Data" in the code above).
- Press Save.
  - Don't forget this step!
- Test the script by running it in the script editor with the big Run button at the top
  - Click the Execution log (at the top) to see any errors
  - It will run against the "active spreadsheet" which seems to be whatever you have open
- The final step is to set a trigger so that this code runs every time the sheet changes.
- Create a new trigger by clicking the Triggers section in the left menu
  - This will take you away from the main script - click Yes to save
- In the Triggers section click "+ Add Trigger".
- Then set up your trigger to look like this:
  - Function to run: changeChartTitle
    - If you add a new file in the editor, with a new function, thew new function will end up appearing in this dropdown
    - But only if you save the file and wait a few seconds
    - While your file is open, you'll see a dropdown at the top with the names of any functions in that file
    - The function name will default to myFunction until you save the file
  - Deployment to run: Head
  - Event source: From spreadsheet
  - Event type: On edit
  - Failure notification settings: Notify me daily
- The only change you need to make is to ensure that the final box for "Select event type" is set to "On edit".
- Press Save.
  - Don't forget this step!
- Then you're prompted to give the script permission to access your Sheet. (More info on that in [this article](https://www.benlcollins.com/apps-script/google-apps-script-beginner-guide/#permissions).)
  - I had to click through to Advanced and Are you sure and stuff, cos it didn't want to let me give access
- And that's all.
- Back in your Sheet, your chart will display whatever text is shown in cell A1. And if that text changes, the chart title will automatically update to reflect it.
  - I had to update some source data and then wait several seconds - there was a longish delay before the chart title was updated
- It's very slow though, and gets slower for every new chart you try to update!
  - I asked for help in speeding that up, [here](https://support.google.com/docs/thread/333402052?hl=en&sjid=9344226696062890043-EU)

## Display dates in string format

- If you return a date from a function, it might cme out as an integer instead of a string
- To ensure a string, use `=TEXT(H1, "dd/mm/yy")`
## INDIRECT so you can refer to cell references as text

- Example 1: 
```C
=INDIRECT("'" // Enclose sheet name in quotes
  & VLOOKUP(period, Categories!$AI$3:$AJ, 2, 0) // Look up sheet name for period
  & "'!M:M") // Close quotes and reference big category col
```
- Example 2:
```C
=INDIRECT("'Current Historic mnthly'!" // Sheet name
& $S$2 // Fetch col letter from another cell
& "$1") // Add row number
``` 
## Troubleshooting 

### Chart can't cope with hours > 240

- I was finding that when my data included hours > 240, even if over a millisecond over, the chart was suddenly going down to -144, even though I had no negative data
- A helpful person on the Google help forum worked out that the problem was more about the range of data
  - If the lower bound was raised, values > 240 stopped being a problem
  - She wasn't sure exactly why it was happening, but she found she could fix it by setting the Major gridlines count to at least six:
    - Three dots, top right of chart => Edit => Customise
    - Gridlines and ticks => select vertical axis
    - Major count => 6 or more
      - Note that one of mycharts had data that went as high as 672 hours, and for that one I had to set it to major count = 10
      - 10 was the maximum, so I'm guessing if data went higher I'd need ro reduce the range, maybe by excluding the smaller numbers
      - I've reported this via Help => Help sheets improve
- The full question in detail is [here](https://support.google.com/docs/thread/317591568?hl=en&sjid=5856071677799606417-EU)
- A sample spreadsheet containing a demo of the problem is [here](https://docs.google.com/spreadsheets/d/15JekJRilFscgtecvxids5Bvn4UC-W1RQF6R6zqpgJc8/edit?gid=475101449#gid=475101449)
- Note that when this problem occurs, it also leads to the error "Those columns are out of bounds" when I try to edit the chart title via a script

