---
layout: page
location: pages/coding/infra/cmd/leaf
permalink: /pages/coding/infra/cmd/Powershell
---

## Aliases

For the equivalent of gitbash aliases - where you create short keywords that you can run on the command line to execute longer command-line statements like `cd` commands:

- If you don't already have it, create the following folder: `C:\Users\[your-user-name]\Documents\WindowsPowerShell`
- Ditto the following file: `C:\Users\[your-user-name]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
- In that file, add a function for each alias. So for instance, if you want an alias that takes you to a particular folder: 
```bash
function myfolder { cd C:/development/parent-folder/myfolder }
```
- Open up Powershell in admin mode (`Windows key + X, A` or right-click on it in Windows start menu and choose **Run as administrator**)
- Run the following two commands in Powershell:
```
set-executionpolicy remotesigned
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```
(Actually the first might not be necessary - I think maybe you would need that one if you were going to create your alias in a separate Powershell script file and run it from there).
- Re-open Powershell, and now if you type `myfolder` (or whatever your function was called) and enter, you should execute the action of your alias / function.
- It is possible to use a `set-alias` command in Powershell to set up aliases, but in this case that just seems to unnecessary extra layers of complexity. I think you would use that if you wanted to run something from a separate Powershell script. More [here](https://superuser.com/questions/516700/bash-aliases-equivalent-for-powershell).
