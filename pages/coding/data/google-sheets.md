---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Google-Sheets
---

- Google Sheets

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

## VLOOKUP and Gotchas

- If you want to find a value and then return another value from the same row
- eg 
  - you are looking at a range of data, and 
  - you want to see whether anything in the first col of your range has the same value as cell A1,
  - and if it does you want to return the value in the third col of your range, in the same row as the matching value
  - so for instance, if your range is cols C to E, and you find a match in cell C2 (row 2, col C), then the value returned will be the value in cell E2 (row 2, col E)
- it looks like this: `=VLOOKUP(A1,C2:E10,3,0)`
  - You're searching for a match for `A1`
  - The range of values you're searching ("the table") is `C2:E10`
  - You're going to return the value from the 3rd col in the table (C is the first col, E is the third)
  - The `0` represents `false` for `range_lookup` which means the data is sorted in ascending order (I think)
- If you want to return an empty string if the `VLOOKUP` fails to find a result, wrap it in `IFERROR`:
  - `=IFERROR(VLOOKUP(A1,C2:E10,3,0),"")`
- If you want to return not just a single value but a sum of values in many cols...
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
      - I discovered this when I followed the internet's advice and tried only steps 1 and 2, and it wasn't enough. These are the otes I made while I was lookign for the solution...
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