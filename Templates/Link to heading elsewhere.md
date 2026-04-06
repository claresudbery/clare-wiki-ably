<%*
// Get the selected text
let text = app.workspace.activeEditor.getSelection()
// Find out whether there's already some display text
let splitByPipe = text.split('|')
let pipeCount = splitByPipe.length - 1
let displayText
let linkText
if (pipeCount >= 1) {
	// There's already some display text. Let them edit it.
	displayText = splitByPipe[pipeCount].slice(0, -2) // everything after the last pipe, except the "]]" at the end
	linkText = splitByPipe[0] // everything before the first pipe
} else {
	// Starting from scratch.)
	displayText = text.slice(2, -2).replace("#", " - ")
	if (displayText[0] == '_') {
		displayText = displayText.slice(1)
	}
	linkText = text.slice(0, -2) // everything except the "]]" at the end
}
// Get the preferred link text
displayText = await tp.system.prompt('Edit the link text as required', displayText)
if (displayText) {
	// Add the link text to the selection
	let embed = `${linkText}|${displayText}]]`
	app.workspace.activeEditor.editor.replaceSelection(embed)
}
-%>