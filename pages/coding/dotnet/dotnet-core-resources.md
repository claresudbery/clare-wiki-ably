---
layout: page
location: "pages/coding/dotnet/leaf"
permalink: /pages/coding/dotnet/DotNet-Core-Resources
---

([Main .Net Core directory is here](/pages/coding/Dot-Net))

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [ContosoPizza](https://github.com/claresudbery/ContosoPizza) - from [this tutorial](https://docs.microsoft.com/en-us/learn/modules/build-web-api-aspnet-core/3-exercise-create-web-api) (see DotNetCoreMVC.docx in Events / Samba / Workshops / DotNetCore)
- [interview-codebase-stage3-csharp (PRIVATE)](https://github.com/claresudbery/interview-codebase-stage3-csharp)
- Hack Manchester 2018:
  - [TimeTravelHack (Hack Mcr 2018)](https://github.com/claresudbery/TimeTravelHack.git) 
  - [TimeTravelHackPOC (Hack Mcr 2018) (PRIVATE)](https://github.com/claresudbery/TimeTravelHackPOC.git)
  - [Hack Manchester 2018 - Best in Show](https://medium.com/a-woman-in-technology/hack-manchester-2018-best-in-show-ca6ef65fb49c) (my Medium blog post)
- [ConsoleCatchall.NetCore (PRIVATE)](https://github.com/claresudbery/ConsoleCatchall.NetCore)
- [NumberToLCD_Kata (PRIVATE)](https://github.com/claresudbery/NumberToLCD_Kata)
- [Reconciliate](https://github.com/claresudbery/Reconciliate)
- [Dockerising .Net Core and deploying to heroku](https://github.com/claresudbery/dotnet-docker-clare)

## Docs and Blog Posts

- InSimpleTerms: Check the C# label (there are quite a few blog posts, but they're pretty much copies of what's in the word doc beow)
- My notes: 
    - in Events / Samba / Workshops / DotNetCore
    - DotNetCoreMVC.docx 
      - !!! If you're wondering where on earth all my useful DotNetCore notes have gone, this is where they are!
      - At the time of writing (March 20222), I haven't got round to migrating them into clare-wiki
    - DotNetCoreMVC.pptx 

## Misc

### Getting C# code to work in Rider

- If you try to open a C# .Net Core project in Rider, or a C# project which may or may not be .Net Core, and you get an error something like **"You must install or update .NET to run this application. App: /Applications/Rider.app/Contents/lib/ReSharperHost/TestRunner/netcoreapp3.0/ReSharperTestRunner.dll Architecture: x64 Framework: 'Microsoft.NETCore.App', version '3.1.0' (x64) .NET location: /usr/local/share/dotnet/"**
- ... then it might be as simple a matter as editing one line in the `*.csproj` file
- For instance, I just had to change from `<TargetFramework>netcoreapp3.1</TargetFramework>` to `<TargetFramework>net6.0</TargetFramework>`
- ! Don't forget to change all `*.csproj` files! 
  - For instance, there might be a separate one for the test project.

