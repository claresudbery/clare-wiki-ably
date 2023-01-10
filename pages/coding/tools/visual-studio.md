---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/Visual-Studio
---

## Visual Studio Shortcuts

- Refactor this: Ctrl + Shift + R

## NuGet package manager

- Tools => NuGet package manager => Manage NuGet packages
- You can browse globally (click Browse at top)
- ... or look at installed packaged (click Installed at top)
- To restore packages:
    - Right click on solution (the top node of the tree) in solution explorer (panel on right hand side)
    - Select "Restore NuGet packages"
    - I think maybe the Restore button sometimes appears in the NuGet package manager too?

## Testing

- In an [Xunit] project, I found it helped to:
    - Select Test => Test Explorer
    - Drag the resulting pane down into the middle of the bottom section (a cross-shaped control appears - drag the pane over the square in the middle of the cross)
    - Now there's always a test explorer pane at the bottom of the screen

## NCrunch

- To install:
    - Go to Extensions menu, search for NCrunch
    - That'll take you to NCrunch website to download and install software
    - You'll have to restart VS
    - You'll get the option to enter licence at some point during all of this 
        - I bought one there via the link
        - ! If you already have a licence then you only have to upgrade! Don't buy a new one!
        - Make sure you log into your account when the link takes you to the NCrunch site
- To configure:
    - I like to do these two things:
    - Extensions => Customize menu => uncheck NCrunch to give it its own menu 
        - You have to restart VS again when you save
    - NCrunch => Tests will open the NCrunch pane, which I then drag down to the square in the middle of the cross you get when you hover over the bottom panel
- Troubleshooting:
    - Jan '23, Parrot kata: "Unable to restore NuGet packages required"
        - I restarted VS, then disabled and re-enabled NCrunch at least once - this caused the NCrunch engine to re-initialise, and seemed to fix the problem


## Troubleshooting

### Reference assemblies for .NETFramework,Version=v6.0 were not found

- `"The reference assemblies for .NETFramework,Version=v6.0 were not found. To resolve this, install the Developer Pack (SDK/Targeting Pack) for this framework version or retarget your application. You can download .NET Framework Developer Packs at https://aka.ms/msbuild/developerpacks	Tennis	C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\Microsoft.Common.CurrentVersion.targets	1175"`
- I now realise I had Visual Studio 2019 open as well as Visual Studio 2022, and 2019 is where the errors were. If you follow the link in the error message it takes you to a page which doesn't have .Net 6.0 SDK listed, which is confusing. 
- Here's what I did (when I was getting the [tennis refactoring kata](https://github.com/emilybache/Tennis-Refactoring-Kata) up and running):
    - First I had to install [Visual Studio 2022](https://visualstudio.microsoft.com/vs/) (free Community version)
    - Then I was getting errors about Xunit in the test file, but I think they were misleading - what I really needed was .Net 6:
    - I had to [install .Net 6](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.202-windows-x64-installer) separately

### Shortcuts

- See Tools => Options => Environment => Keyboard for full list
- Expand / collapse regions (works on markdown too)
    - Ctrl + M, E - Expand current region
    - Ctrl + M, S - Collapse current region
    - Ctrl + M, X - Expand all regions
    - Ctrl + M, A - Contract all regions
- Select containing block
    - Expand selection: Shift + Alt + `=` (keep pressing to expand to outer blocks)
    - Contract selection: Shift + Alt + `-` (keep pressing to contract to inner blocks)