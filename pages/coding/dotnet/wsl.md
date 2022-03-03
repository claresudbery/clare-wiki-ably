---
layout: page
location: pages/coding/dotnet/leaf
permalink: /pages/coding/dotnet/Windows-Subsystem-for-Linux---WSL
---

## Basics

- Note that I have three Linux versions installed. The one that I'm actually using is Ubuntu (not Ubuntu 16.04 or Debian).
- You can [install the Windows subsystem for linux (WSL)](https://docs.microsoft.com/en-gb/windows/wsl/install-win10)
    - !Warning!
    - Be aware that for many things WSL 2 is probably better (for instance if you want to run [node js](/pages/coding/webdev/js/Node-JS)). I USED to be that in order to get this you had to enter the Windows Insider programme, which could mean that your operating system will be potentially unstable. This is no longer true (as of at least Sept 2020). You can now install WSL2 without being a member of the Windows Insider programme. [Instructions here](https://docs.microsoft.com/en-gb/windows/wsl/install-win10).
        - I have a colleague, though, who reports that he has node js working fine on WSL (rather than WSL2), running in Windows 10 on a Debian distro and using the WSL extension in VS Code (not sure if this is [this one](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)?)
        - I got this extension working in VS Code and it's pretty good.
            - Note that you can open it up quickly by running `code .` on the command line from inside the folder you want to open.
            - If you have any problems, try closing VS Code and opening it up again from the command line (using `code .`).

### If you have a version of Windows that needs Windows Insider to install WSL2

- If you're up to date with Windows 10, you can ignore this bit!
- It's not recommended to have Windows Insider on your main machine
- Instead, create a VM and run Windows Insider there - [follow the instructions here](https://www.windowscentral.com/how-create-virtual-machine-using-hyper-v-test-windows-10-insider-builds).
    - Note that if you can't get to Hyper-V Manager from the Start menu, go to Windows Administrative Tools and you'll find it in there.
    - Once you're in Hyper-V Manager, you have to select the desktop under Hyper-V Manager in the tree on the left before the relevant parts of the Action menu will appear.
    - To download an ISO of Windows 10, go [here](https://www.microsoft.com/en-gb/software-download/windows10).
    - To paste a product key when installing Windows (instead of having to type it), select **Clipboard | Type clipboard text** from the top menu.
    - If you get an error "couldn't verify product key", try clicking the keyboard icon and clicking Enter again and clicking Next again - the erorr might go away. 
    - When I was installing Windows on the VM, when I got to the network connection screen, it just said Ethernet - not connected. I was using an ethernet cable to connect to my router and I had WiFi turned off. This seemed to cause a problem - I unplugged my ethernet cable and turned WiFi back on again, then waited a bit and the display in the VM updated and I was able to click Next.
    - When running the wsl command: "Invalid command line option: --set-version"
        - I found I still had the wrong build of Windows even after following all of the steps above - I had to go back to Windows updates and install more updates. You need build 18917 or higher to activate WSL 2.
    - When running the `wsl --set-version` command:
    - Error about virtualization: It seems like you need a bios virtualization setting, but because you're in a VM what you actually need is nested virtualization. I fixed that by running the following command in Powershell on my host Windows machine (more [here](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/nested-virtualization)): `
    Set-VMProcessor -VMName Win10-Insiders -ExposeVirtualizationExtensions $true`
    - It can sometimes be difficult to copy / paste between host and Ubuntu in the VM. To fix this, you can open up Notepad in the VM and copy into there... then copy from Notepad into Ubuntu.