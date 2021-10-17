---
layout: page
location: "pages/coding/mobile/leaf"
permalink: /pages/coding/mobile/Swift-and-XCode
---

## iOS Development

See [separate page](/pages/coding/mobile/iOS-Development) - there may be other iOS XCode stuff in there too.

## GitHub Repos

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [SquareFillXCode (PRIVATE)](https://github.com/claresudbery/SquareFillXCode)
- [ios-app-experiments (PRIVATE)](https://github.com/claresudbery/ios-app-experiments)
    - Can't quite remember what this is, but seems to be me learning about making iOS games?
		
## To rename a UI component

Easiest thing is to delete the property in the view controller, then set up a new connection:  
Open storyboard (click in project explorer)  
Open editing assitant (interlocking circles icon, top right)  
Ctrl-drag the ui component into the view controller  
Now delete the outlet:  
while storyboard is open, click the right-facing arrow, top right, to see connections inspector. find the original outlet and click the cross to delete it.  

## Add a border to just one side of a shape 

[Details here](http://stackoverflow.com/questions/17355280/how-to-add-a-border-just-on-the-top-side-of-a-uiview)

## Converting from Swift 3.0 to Swift 5.0

- I found this slightly hard but not as bad as I feared. Basically I did the following:
    - Upgraded XCode
    - Manually changed the code from Swift 3.0 to Swift 4.0 by editing `SWIFT_VERSION` in `MyProjectName.xcodeproj/project.pbxproj`
    - Used the migration tool (Edit... Convert... To Current Swift syntax) to convert from Swift 4.0 to Swift 5.0.
- I documented the full process vis a question in Stack Overflow [here](https://stackoverflow.com/questions/69354121/how-do-i-migrate-from-swift-3-using-xcode-12-4/69354203#69354203).

## DEPLOYMENT

### Deploying to your phone

#### Subsequent times

- Plug your phone in to laptop using lightning cable
- Select your phone as deployment target
    - Product => Destination => select your phone under iOS device
    - Product => Run
- If any problems 
    - unlock the iphone
    - try restarting everything (XCode, your phone, your laptop) 
    - try using a different lightning cable - it seems really sensitive to this - try to use a brand new one
    - If it tells you to check Devices & Simulators window
        - Go to Windows => Devices and Simulators
    - be patient! After many restarts and stop / starts you'll often find it wioll suddenly magically work just when you were about to give up.
    - see other ideas in this section

#### First time

- Add your apple ID:
    - XCode menu => Preferences => Accounts
    - Click the + button bottom left
    - Add your Apple ID
- Plug your phone in to laptop using lightning cable
- Select your phone as deployment target
    - Product => Destination => select your phone under iOS device
- Now choose Product => Run
- troubleshooting
    - some ideas are listed elsewhere in this phone deployment section
- If you get errors about unsupported iOS version:
    - In Terminal: `cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport`
    - Look for the folder representing the highest version below your actual iOS version
    - duplicate that into a version representing actual iOS version
        - to find your iOS version:
        - on your phone go to Settings => General => Software Version
        - only one decimal point needed - eg if phone is 14.7.1 then folder can be named `14.7`
        - like this: `sudo cp -r 14.5 14.7`
    - Product => Clean build folder
    - Close everything and start up again
    - If it fails while trying to run, instead of just copying what you already have, copy it from the 14.5 folder contained in [this zip file](https://github.com/iGhibli/iOS-DeviceSupport/blob/master/DeviceSupport/14.5(FromXcode_12.5_Release_Candidate_xip).zip)
    - More [here](https://stackoverflow.com/questions/67863355/xcode-12-4-unsupported-os-version-after-iphone-ios-update-14-7)
        - including detailed instructions of what to close and what to open and in what order

#### Fixing problems with developer licence / signing certificate apple ID after you reset keychain password

- fix Apple account
    - XCode menu => Preferences => Accounts
    - Re-enter details
- fix signing certificate
    - select project name in left panel
    - in middle panel, click Signing & Capabilities at top of panel
    - select project target on left
    - there will be errors with things you can click to re-enter password - probably in two places

#### When it tells you to check Devices & Simulators window

- Go to Windows => Devices and Simulators

### Deploying to Apple

These are my notes from my [SquareFill app](https://github.com/claresudbery/SquareFillXCode) (accessible to Clare only), so might be quite specific to me.

- 1)   ! The first thing you need to do is increment the build number:  
	- 1a) select the top level in the files / folders view  
	- 1b) Go to the “General” tab – it’s at the top  
- 2) (optional) Editing the app bundle: https://developer.apple.com/account/ios/identifier/bundle/edit   
- 3) (generally useful) App Store Connect: https://appstoreconnect.apple.com   
- 4) Product => Archive  
	- 4a)    Enter a description on the right, then if all is good go to 5) below.  
	- 4b)   !! The Archive option may be disabled. To fix:  
		- 4bi)    Try changing the “active scheme” to Generic Ios Device – this is the dropdown you use to select which device the app will run on – top left. If all is good now, go to 5) below.  
		- 4bii)    Otherwise try all the steps listed here: https://stackoverflow.com/questions/37806538/code-signing-is-required-for-product-type-application-in-sdk-ios-10-0-stic  
			- 4bii-a)    Basically it boils down to:   
				- 4bii-a1)    Select your targets one at a time (see below for selecting targets), and for each one, uncheck "Automatically manage signing".  
				- 4bii-a2)    Now for each target, go to Build Settings tab, scroill down to Signing, set Code Signing Identity to iOS Developer at the top level  
				- 4bii-a3)    Now do Xcode → Product → Clean. Close your project in Xcode and reopen it again.  
				- 4bii-a4)    After this go to the general tab of each of your targets and check "Automatically manage signing" and under team drop down select your developer account  
				- 4bii-a5)    Now it will let you archive / upload to app store  
			- 4bii-b)    Notes:   
				- 4bii-b1)    When it says “Go to your app” it means select the top level in the files / folders view (click the rectangle, top left).   
				- 4bii-b2)    When it gets to the bit “uncheck "Automatically manage Signing" in both the targets under your project”…   
				- 4bii-b3)    …the way you select targets is:  
					- 4bii-b3a)    1) select the top level in the files / folders view  
					- 4bii-b3b)    2) at the left hand of the top, to the left of the “General” tab, is the name of your top-level project and all the code projects underneath (So for SquareFill I get three: SquareFillXCode, SquareFillXCodeTests and SquareFillXCodeUITests – these are all defined as targets)   
- 5) After you have deployed, add testing notes in App store Connect (see below).  
    - !! If you get an error "[name] has one iOS Distribution certificate but its private key is not installed.", do the following:  
        - i) xcode -> product -> archives -> Click manage certificate  
		- ii) Click the + button to add an iOS distribution.  
    - After you have deployed, add testing notes in App store Connect:  
        - 5a)    Go here: https://appstoreconnect.apple.com/   
        - 5b)    Click My Apps  
        - 5c)    Select your app  
        - 5d)    Select TestFlight at the top  
        - 5e)    Click the icon for your build (you may have to expand to see)  
        - 5f)    Select the Test Details tab  
            - 5fi)    Enter testing / build notes here  
        - 5g)    ! If your build isn’t visible yet, select the Activity tab to see progress

## Swift Keyboard Navigation

- Find references:
    - Splat + click ("Command-click") on the name of the method, and select "Callers" from the resulting menu.
- Go to definition: Ctrl + Splat + J
- Go back: Ctrl + Splat + left arrow
- Find text in file:
    - Splat + F to open find input at top of screen
    - Splat + G to find next 
- Find call hierarchy: Ctrl + Shift + Splat + H
- Find symbol in project: Ctrl + Shift + Splat + F
- Build: Splat + B
- Run all tests: Splat + U

## New classes

- Each new class will have "targets" specified, which define the scope that class will be available in.
    - You get a dialog that allows you to specify this if you do right-click new file from the file organiser (in the panel on the left if yuou click the file icon)
    - Otherwise right-click the file in the file organiser and choose "Show file inspector" which will appear on the right.

## Parameterised tests / multiple test cases in Swift / XCTest

- I used [this article](https://briancoyner.github.io/articles/2015-11-28-swift-parameterized-xctestcase/) in combination with the [documentation on defaultTestSuite](https://developer.apple.com/documentation/xctest/xctestcase/1496289-defaulttestsuite), which has now changed from a func to a var
    - Note that it's not made clear in the article, but all methods shown are designed to go in the same class
    - My implementation of this is visible [here](https://github.com/claresudbery/SquareFillXCode/blob/48f4235b477854ee1f8b5efc487389e95713cb48/SquareFillXCodeTests/SquareFillColourTests.swift) (accessible to Clare only) - it's easier to follow with a real example

## Questions

- Why am I getting the error "Type of expression is ambiguous without more context" when I try to include the following line of code in my test?
    - In `testSquareCyclesRainbowColourWhenCelebrating`, in `SquareViewTests.swift`
    - I had this: ` Asserter.AreEqual(actual: square.Colour, expected: SquareFillColour.Orange);`
    - I had to replace it with `Asserter.AreEqual(actual: square.Colour == SquareFillColour.Orange, expected: true);`
- How do you animate?
    - For instance, flashing colours when someone completes a level.
- How come when I created a new class WinDetector, I couldn't test it?
    - I got an error saying WinDetector not in scope, even though I checked the checkbox re putting the test project as a target
    - See commented out lines at the bottom of ShapeControllerTests
- Surely I made notes on all this stuff before? What did I do with them??