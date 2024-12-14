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
  - you are looking in row 2, and 
  - you want to see whether C2 (row 2 col C) has the same value as A1,
  - and if it does you want to return E2 (row 2 col E)
- it looks like this: `=VLOOKUP(A1,C2:E10,3,0)`
  - You're searching for a match for `A1`
  - The range of values you're searching ("the table") is `C2:E10`
  - You're going to return the value from the 3rd col in the table (C is the first col, E is the third)
  - The `0` represents `false` for `range_lookup` which means the data is sorted in ascending order (I think)
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

- Like this: `=FILTER({Categories!A:A;Categories!C:C},LEN({Categories!A:A;Categories!C:C}))`




