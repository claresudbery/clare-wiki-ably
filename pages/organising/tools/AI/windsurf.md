## Initial installation

- Initial choices:
	- Setup flow: start from scratch (add windsurf to path)
	- Keybindings: Default (VS Code)
	- Sign up: Set up a free account (managed not in the app but at https://windsurf.com/account/login)
	- Getting started with Windsurf:
		- Code with Cascade
		- Generate a New Project
- New project:
	- Select a folder
	- Me: "Please build me an app, using Python, that will allow me to analyse a markdown file to determine frequency of specified concepts"
	- WS: "A git repo was found in the parent folder. Open it?"
		- Me: Y
	- WS: "Install the recommended Python extension from ms-python for the Python lang?"
		- Me: Y
## Troubleshooting

### What if I lose the Cascade pane?

- Once any folder is open, the Cascade panel should appear automatically on the right side of the editor.
- If it is not visible, you can open it manually by pressing `Cmd/Ctrl + L` or by clicking the Cascade icon (toggle side panel - two rectangles side by side) in the top right corner of the Windsurf window.
## Starting a new project

- Create a `.windsurf` folder, with the following sub-folders: `rules` and `processes`
- Add a file like `running-scripts.md` to the `rules` folder - [example here](https://github.com/claresudbery/ai-general/blob/main/slack-thread-archiver/.windsurf/rules/running-scripts.md)
	- This will be automatically used by windsurf as its rules for this project
	- Note the above example contains the idea of a starter character, so you always know what process file it's reading
- [See here](https://github.com/claresudbery/ai-general/tree/main/slack-thread-archiver/.windsurf/processes) for examples of process files you might want in your `processes` folder
- Create a `project_spec.md`
	- You can get the AI to help you with that, by starting with a like this one
	- Here's an example `project_spec.md`