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

- 1)   ! The first thing you need to do is increment the version / build number:  
	- select the top level in the files / folders view  
	- Go to the “General” tab – build and version numbers can be edited at the top
        - (Settings will save automatically when you build)  
- 2) (optional) [Edit the app bundle](https://developer.apple.com/account/ios/identifier/bundle/edit)   
- 3) (generally useful) [App Store Connect](https://appstoreconnect.apple.com)  
- 4) Product => Archive 
	- !! The Archive option may be disabled. To fix:  
        - Try changing the “active scheme” to Generic Ios Device – this is the dropdown you use to select which device the app will run on – top left. 
	- Wait a minute for the archive to happen
    - Enter a description on the right, then if all is good go to 5) below.  
        - Note that I've been copying description from here to readme.md, but that means focus moves away from the Archive window. To get back to it, don't click Product => Archive again, or it will create another archive. Instead, select Window => Organizer 
    - Click Distribute App
        - This might take a while
        - !! Watch out! There are a couple more dialogs that need your input after you click Distribute App, and they take a while to load so you might miss them and wonder why your build doesn't appear in App Store Connect.
        - It might create a new signing certificate for you. You should export this and store it somewhere like a password manager.
        - When it asks for permission to access your keychain, use your laptop password (stored in 1password). It will ask several times in a row - to avoid this, click Always Allow.
        - The final confirmation will be an Upload button, and this bit might take a little while.
    - Go to 5) below.  
		- Otherwise try [all the steps listed here](https://stackoverflow.com/questions/37806538/code-signing-is-required-for-product-type-application-in-sdk-ios-10-0-stic)  
			- Basically it boils down to:   
				- Select your targets one at a time (see below for selecting targets), and for each one, uncheck "Automatically manage signing".  
				- Now for each target, go to Build Settings tab, scroill down to Signing, set Code Signing Identity to iOS Developer at the top level  
				- Now do Xcode → Product → Clean. Close your project in Xcode and reopen it again.  
				- After this go to the general tab of each of your targets and check "Automatically manage signing" and under team drop down select your developer account  
				- Now it will let you archive / upload to app store  
			- Notes:   
				- When it says “Go to your app” it means select the top level in the files / folders view (click the rectangle, top left).   
				-  When it gets to the bit “uncheck "Automatically manage Signing" in both the targets under your project”…   
				- …the way you select targets is:  
					- select the top level in the files / folders view  
					- at the left hand of the top, to the left of the “General” tab, is the name of your top-level project and all the code projects underneath (So for SquareFill I get three: SquareFillXCode, SquareFillXCodeTests and SquareFillXCodeUITests – these are all defined as targets)   
- 5) After you have deployed, add testing notes in App store Connect (see below).  
    - !! If you get an error "[name] has one iOS Distribution certificate but its private key is not installed.", do the following:  
        - xcode -> product -> archives -> Click manage certificate  
		- Click the + button to add an iOS distribution.  
    - After you have deployed, add testing notes in App store Connect:  
        - Go [here (AppStoreConnect)](https://appstoreconnect.apple.com/)  
        - Click My Apps  
        - Select your app 
            - Under App Store you can upload screenshots for different size displays
            - If you get file size wrong it will tell you what it should be
            - I think basically if you take a full screenshot on a device with the correct screen size, you will end up with the correct thing
            - Select a screen size and click Choose file at the bottom to upload a screenshot for that screen size
            - iPhone 8 Plus is 5.5"
            - You can also upload videos but you have to get the frame rate right. I uploaded a video I'd made on my phone using Control Center => Screen Recording, and it said the frame rate was wrong.
                - [Some info on that here](https://stackoverflow.com/questions/26300925/cannot-upload-video-to-itunesconnect-the-frame-rate-of-your-app-video-preview-i)
        - Select TestFlight at the top  
        - Click the icon for your build (you may have to expand to see) 
            - ! If your build isn’t visible yet, this might be because you didn't complete the Archive process - see above
            - Once it's uploaded, it then spends a while "processing" - you just have to wait.
        - Select the Test Details tab  
            - Enter testing / build notes here  
            - Also add testers here. 
                - It's not obvious but when you click a + button to add testers to your App Store Connect Users group, if you read the text there is a link hiding in the text to [Add Users And Groups](https://appstoreconnect.apple.com/access/users).
                - First they have to accept the first invite and _then_ you can add them to the list of testers for your app.
                - The data you enter under "what to test" doesn't get emailed to testers. But if they open the TestFlight app on their device and click on the app icon, it says "What to test" and if they click on "more" they'll see the text you entered.

## Data persistence

- There are many different types of data persistence
    - [This article](https://iosapptemplates.com/blog/ios-development/data-persistence-ios-swift/) has a good description of all the different wys you can store data _locally on a device_.
    - I used the CoreData approach for user high scores in [SquareFill](https://github.com/claresudbery/SquareFillXCode) (accessible to Clare only).
    - ! The above article talks about creating a data model but doesn't say how. That's [explained here](https://developer.apple.com/documentation/coredata/creating_a_core_data_model) (basically create a new file and select Data Model as the type).
    - It also talks about using the DataModel tool. This is the page that opens up automatically immediately after you create a new data model (you can get back to it by double-clicking on your data model in the file view).
        - Use the + button bottom left to add a new entity - this is the equivalent of a data table
        - Double-click the entity on the left to rename it
        - Initially all you have to worry about is adding adding attributes - these will be the fields on your table. Use the + button in the Atribute section to add attributes.
    - It also talks about creating a CoreDataManager class.
        - This won't work without this extra line at the top of the file containing the CoreDataManager class: `import CoreData`
        - An alternative is to do the extra stuff in your AppDelegate file [described here](https://programmingwithswift.com/add-core-data-to-existing-ios-project/)

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

## New classes and their targets

- Each new class will have "targets" specified, which define the scope that class will be available in.
    - You get a dialog that allows you to specify this if you do right-click new file from the file organiser (in the panel on the left if you click the file icon)
    - Otherwise right-click the file in the file organiser and choose "Show file inspector" which will appear on the right.
- ! Sometimes you might get an error saying a class is not in scope, even though you've checked the checkbox re putting the correct project as a target
    - This seems to be something to do with the target settings (right-click the file in the file organiser and choose "Show file inspector" which will appear on the right)
        - What I did was change Location to "Relative to project" instead of "relative to group".
        - This seemed to fix the problem, but weirdly when I subsequently changed the setting back to "relative to group", the code still compiled and ran.
        - Then later I discovered the failure in question only happened when building / running the tests. The class in question was accessed in viewDidLoad in ViewController (but not in tests), but when I changed it to add the test project as a target, the error went away. Maybe because the ViewController was somehow accessed by test code?
        
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
    - See commented out lines at the bottom of ShapeControllerTests
- Surely I made notes on all this stuff before? What did I do with them??