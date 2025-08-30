## Making low-res Macbook screenshots

- tl;dr - On Macbook, to turn the most recent screenshot into a small low-res file and paste it into the Career-analysis Obsidian, 3 steps are needed:
	- 1. Take the screenshot (Cmd + Shift + 4)
	- 2. In Obsidian, use the key combination Cmd + Shift + J
		- (you don't actually have to be in Obsidian, but Cmd + Shift + J will do other things in some contexts, eg Chrome)
		- ! Note that you have to wait a few seconds for the screenshot to find its way into the Screenshots folder, otherwise you'll end up with whatever the *previous* shortcut was
	- 3. In Obsidian, use Cmd + V to paste the image into your note
- If you want it to work in other Obsidian vaults, you'll need to edit [this script](https://github.com/claresudbery/Root-Scripts/commit/3d7e3876b1e9c7dcbfba373fda492945d4f4c0c0)
	- Simplest thing would be to edit the path 
	- Second simplest thing would be to edit the script to take a path as input = you could get Claude or ChatGPT to help with this
		- You'd also have to edit the Shortcut in the Shortcuts app, to take inputs
- I created this because I often paste screenshots into Obsidian, and the default Macbook screenshot is an unnecessarily-huge file.
- I used Claude, and documented the process [here](https://github.com/claresudbery/career-analysis-obsidian/blob/main/Clare's%20Career/0%20-%20Missions/09-AI-Mission/AI%20coding%20projects/Misc%20small%20AI%20projects.md#get-low-res-macbook-screenshots).
- The result was a script called `lowres-screenshot` in my `scripts` folder/repo, which means you can now type  `lowres-screenshot` on the command line and it will take the most recent screenshot, convert it to jpeg (readable rather than absolute lowest quality), copy to my Career-Analysis Obsidian Attachments folder, then auto-delete the original after copying.
- I put this into a Cmd + Shift + J keyboard shortcut on my Macbook, or you can just run from the command line. 
- Then all you have to do it paste into Obsidian (Career-Analysis)!