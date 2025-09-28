## Adding timestamps to responses

**To create a custom style:**

1. THIS DOESN'T WORK - see Clare's Career Obsidian, under Drawbacks, "Sept '25, when Claude couldn't do timestamps"
2. Click "Search and tools" in the lower left corner
	1. This is in the actual chat input of a new chat. It's one of the icons bottom left - the one that looks like lines and blobs.
3. Select "Use style"
4. Click "Create & edit styles"
5. Click "Create custom style" 
6. Click "Describe style instead"
7. Click "Use custom instructions (advanced)"
8. Enter the text `Begin every response with the current date and time in this exact format: [Date: MM/DD/YYYY, Time: HH:MM AM/PM]`
9. Click Create Style
10. It will then give it a name - probably "timestamp protocol"
11. Come out of the dialog
12. Then go back in again! Click the icon again in the chat => Use style => select your new timestamp protocol style

You can also set **Profile Preferences** account-wide by clicking your initials → Settings, then describing your preference for date/time prefixes under "What preferences should Claude consider in responses?"[](https://support.claude.com/en/articles/10185728-understanding-claude-s-personalization-features)

For API usage, you can use **prefilling** to start Claude's responses with your desired format, like including a timestamp at the beginning of each response.