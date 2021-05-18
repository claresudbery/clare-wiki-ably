---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Google-Sheets
---

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