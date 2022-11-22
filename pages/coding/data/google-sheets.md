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
  - If you google it, it will tell you to type "[hh]:mm" into the field, but I couldn't get this to work. I had to select from the dropdown instead, and then when I viewed it in the Format menu it would say "[hh]:mm" even though it owuldn't let me enter that manually
- !! Sometimes it doesn't work when you are using the `SUM` formula. I discovered that if I'd added a `SUM` formula to a column that didn't have the correct formatting, then I fixed the formatting, the value would still refuse to over `24:00`. The solution seemed to be to delete the `SUM` formula and then manually re-insert it. Then finally I could get a value over `24:00`.

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




