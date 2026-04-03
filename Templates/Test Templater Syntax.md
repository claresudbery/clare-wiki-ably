<%*
// Note that I've hooked this up to the hotkey Cmd + Ctrl + T
// Get the selected text
let text = app.workspace.activeEditor.getSelection()
// Get the desired file - credits to https://forum.obsidian.md/t/67901/4
const files = app.vault.getMarkdownFiles().map(file => {
  const fileCache = app.metadataCache.getFileCache(file)
  file.display = file.basename
  if (fileCache?.frontmatter?.aliases) {
    if (Array.isArray(fileCache.frontmatter.aliases)) {
      file.display = `${file.basename}\n${fileCache.frontmatter.aliases.join(", ")}`
    } else if (typeof fileCache.frontmatter.aliases === 'string') {
      file.display = `${file.basename}\n${fileCache.frontmatter.aliases}`
    }
  }
  return file
})
const destination = (await tp.system.suggester(files.map(x => x.display), files, false, 'Start typing any note name...', 10)).path
// Block reference
const ref = Math.random().toString(36).slice(2, 7)
// Get the text
const thing1 = 'PART1-PART2-PART3-PART4-PART5'
const thing1a = Math.random().toString(36)
const thing2 = `Math random, no slicing: ${thing1a}\n`
const thing3 = `Math random, slicing, 2, 7: ${thing1a.slice(2, 7)}\n`
const thing4 = `Test string (5 parts), slicing, 0, -3: ${thing1.slice(0, -3)}\n`
const thing5 = `Test string (5 parts), slicing, -9, -0: ${thing1.slice(-9, -0)}\n`
const thing6 = `Test string (5 parts), slicing, -9: ${thing1.slice(-9)}\n`
const thing7 = `destination, slicing, 0, -3: ${destination.slice(0, -3)}\n`
const thing8 = `destination, no slicing: ${destination}\n`
text = `\n\n${thing2}${thing3}${thing4}${thing5}${thing6}${thing7}${thing8} ^${ref}`
let embed
embed = `[[${destination.slice(0, -3)}#^${ref}|${destination.slice(0, -3)} - ^${ref}]]`
// Add the text to the destination note
await app.vault.adapter.append(destination, text)
// Replace the selection with an embedded link to the new location
app.workspace.activeEditor.editor.replaceSelection(embed)
-%>