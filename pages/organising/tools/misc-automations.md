## Making low-res Macbook screenshots

### low-res Macbook screenshots - Details

- [[#^how|How to use the tool]]
- [[#^vault|How to make the tool work in other vaults]]
	- [[#^vault-details|Overview of vault-changing]]
	- [[#^vault-instr|Simple instructions for changing vault]]
	- [[#^vault-how|How the vault-changing works]]
- [[#^why|How / why the tool was created]]
- [[#^mechanics|How the tool works]]
### low-res Macbook screenshots - Details

- tl;dr - On Macbook, to turn the most recent screenshot into a small low-res file and paste it into the Career-analysis Obsidian, 3 steps are needed: ^how
	- 1. Take the screenshot (Cmd + Shift + 4)
	- 2. In Obsidian, use the key combination Cmd + Shift + J
		- (you don't actually have to be in Obsidian, but Cmd + Shift + J will do other things in some contexts, eg Chrome)
		- ! Note that you have to wait a few seconds for the screenshot to find its way into the Screenshots folder, otherwise you'll end up with whatever the *previous* shortcut was
	- 3. In Obsidian, use Cmd + V to paste the image into your note
- If you want it to work in other Obsidian vaults, you'll need to edit [this `lowres-screenshot` script](https://github.com/claresudbery/Root-Scripts/blob/master/lowres-screenshot) in my default `scripts` folder ^vault
	- Simplest thing would be to edit the path 
		- I currently have a [[#^vault-details|hack that does this effectively ]]
			- [[#^vault-instr|How to use it]]
	- Second simplest thing would be to edit the script to take a path as input = you could get Claude or ChatGPT to help with this
		- You'd also have to edit the Shortcut in the Shortcuts app, to take inputs
- How / why it was created ^why
	- I created this because I often paste screenshots into Obsidian, and the default Macbook screenshot is an unnecessarily-huge file.
	- I used Claude, and documented the process [here](https://github.com/claresudbery/career-analysis-obsidian/blob/main/Clare's%20Career/0%20-%20Missions/09-AI-Mission/AI%20coding%20projects/Misc%20small%20AI%20projects.md#get-low-res-macbook-screenshots).
- How it works: ^mechanics
	- The result of my Claude session was a script called `lowres-screenshot` in my `scripts` folder/repo, which means you can now type `lowres-screenshot` on the command line and it will take the most recent screenshot, convert it to jpeg (readable rather than absolute lowest quality), copy to my Career-Analysis Obsidian Attachments folder, then auto-delete the original after copying.
	- I put this into a Cmd + Shift + J keyboard shortcut on my Macbook (using the Shortcuts app), or you can just run it from the command line. 
	- Then all you have to do it paste into Obsidian (Career-Analysis)!
- Changing the vault ^vault-details
	- (ie the vault that screenshots go to when you use the Cmd + Shift + J keyboard shortcut)
	- The three vaults currently catered for are:
		- CareerAnalysis Obsidian vault - sometimes referred to below as "career"
		- clare-tech Obsidian vault - sometimes referred to below as "tech"
		- clare-wiki-ably Obsidian vault - sometimes referred to below as "wiki"
	- What to do: ^vault-instr
		- Run one of the following commands on the command line:
			- Change to CareerAnalysis: `cscreen`
			- Change to clare-tech: `tscreen`
			- Change to clare-wiki-ably: `wscreen`
	- How it works: ^vault-how
		- It's a bit unwieldy on the surface, but it works and it was the quickest easiest thing without getting sucked down a rabbit hole...
		- !This does mean that if you edit the base scripts, you might have to run `wscreen` or whatever to get the correct base script overwritten back onto `lowres-screenshot`
		- There are three copies of `lowres-screenshot` that are identical apart from the path that screenshots are copied to:
			- `lowres-screenshot-script-career`
			- `lowres-screenshot-script-tech`
			- `lowres-screenshot-script-wiki`
		- There are three very simple scripts that just overwrite the default `lowres-screenshot` file with one of the above specialised scripts:
			- `lowres-screenshot-make-career`
			- `lowres-screenshot-make-tech`
			- `lowres-screenshot-make-wiki`
		- There are three aliases that are in `~/scripts/useful-aliases.txt` and `~/.bashrc` - calling each of these aliases causes one of the `lowres-screenshot-make-` scripts above to be called: 
			- Change to CareerAnalysis: `cscreen`
			- Change to clare-tech: `tscreen`
			- Change to clare-wiki-ably: `wscreen`