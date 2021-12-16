---
layout: page
location: pages/think/life/admin/leaf
permalink: /pages/think/life/admin/Labels-And-Mail-Merges
---

## Printing Address Labels and doing Mail Merges

### Simplest (same label printed multiple times)

- New Word document
- Mailings => Labels
- Click New document and save it where you want
- Enter the address in the first cell
- Click Labels again
- Click Print
- Save document

## Doing a mailout

- (I have a Xmas card label example in Dropbox, in Letters folder, for 2021 GiftCrabs)
- Get your spreadsheet ready:
    - Column names in your spreadsheet should match the field names you want to insert in your mail merge. 
    - All data to be merged on first sheet of your spreadsheet.
    - Format in the spreadsheet so that Word can properly read values.
    - spreadsheet stored on your local machine.
- Get your Word doc ready:
    - New Word document
    - Mailings => Start mail merge => Labels
        - Select label type (for me it's generally L7163, I think?) and click OK
    - File => Save
    - Mailings => Select Recipients => Use an existing list => select your spreadsheet
        - Check the header checkbox at bottom if relevant
        - When I did this I got a second dialog asking me to choose a table
            - It seemed to create its own spreadsheet called Letters.xls
            - I cancelled out of this without selecting anything and everything seemd to work after that??
    - Mailings => Edit Recipient List => uncheck anyone you don't want to include
    - Mailings => Address Block
        - Defaults will probably work fine
        - If anything missing, click Match Fields, bottom right
    - Mailings => Update labels
        - Now you'll see the whole page fill with your addresses
    - Save the file
    - Mailings => Preview results
        - This will only show you the first page  
        - beware using next and previous buttons 
            - it has the weird effect of just shifting everything forward by one record, rather than taking you to next page of results
    - Mailings => Finish & Merge => Print documents
        - Click Properties in the print dialog and check 
            - it has A4 selected
            - select tray 1, otherwise it wants you to use a different tray
            - check it's not printing on both sides
        - Print on ordinary paper first to see the effect
        - When you finally put labels into the printer tray, put the label side facing UP.
        - If you select From/To, use integers to indicate records
            - These will be using row numbers from spreadsheet
            - but they ignore the header row
            - So your first row will be row 1, even if you have headers and it's actually row 2.
- Save everything
    - When you save the mail merge document, it stays connected to your data source. You can reuse the mail merge document for your next bulk mailing.
    - Open the mail merge document and choose Yes when Word prompts you to keep the connection.