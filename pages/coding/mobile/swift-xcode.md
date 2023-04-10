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
    - Here is a [video of the app being played](https://twitter.com/ClareSudbery/status/1442998908603543562?s=20)
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
        - like this: `sudo cp -r 14.4 14.7`
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

#### Error about certificate when deploying

- "Invalid Provisioning Profile Signature. The provisioning profile included in the bundle 'ClareSudbery.WordMistress' (Payload/WordMistress.app) cannot be used to submit apps to the iOS App Store until it has a valid signature from Apple. For more information, visit the iOS Developer Portal. With error code STATE_ERROR.VALIDATION_ERROR.90165 for id 0a31e412-e51d-4966-bf7f-51c61b6732ad"
- I was deploying from XCode using automatic signing. I whad just installed an OS update (Monterey), but the error happened both before and after the update.
- Eventually the error went away
- I did a few things:
    - Removed the build that had been rejected from the pending app review in App Store Connect
    - Visited the [bundle](https://developer.apple.com/account/ios/identifier/bundle/edit) online, turned something on (Fonts) then instantly off again without saving
    - Had a go at turning on manual signing during deploy, but got stuck at profiles so cancelled out of that
    - Went into project settings, selected Signing & Capabilities, unchecked "Automatically manage signing" then immediately checked it again
        - What's really interesting is that project changes appeared to be made as a result of this action - see commit 1799b61 in WordMistress
    - I'd originally tried to deploy v 5.9 but it failed with same error as above (I think). At the time I thought it might be because my laptop was awaiting an OS upgrade, so I carried on working and waited for a suitable pause to install the OS update. In the interval I created v 6.0. After the upgrade I went straight to v 6.0 - missing out 5.9 - and got the same error. Ater I'd done the things above I went back and tried to deploy 5.9 - which succeeded. So maybe the problem was that aftre the upgrade I was trying to deploy them out of order?

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
        - When it asks for permission to access your keychain, use your laptop password (stored in 1password). It will ask several times in a row 
            - Don't worry! It will stop eventually! It was a lot of times (ten?) and it made me think I'd got my password wrong, but actually it was just doing it several times.
            - To avoid this happening again in future, click Always Allow.
        - The final confirmation will be an Upload button, and this bit might take a little while.
        - ! If you get an error saying you need to go to your developer account and sign the latest PLA, go to App Stoare Connect in the browser and you should find a banner there with a link to sign into your developer account and accpet the new agreement.
        - If you get an "invalid binary" error when trying to deploy, this might be because you haven't created assets / icons yet. See [ios dev page](/pages/coding/mobile/iOS-Development#creating-icons).
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
        - Select the Test Information tab  
            - Enter testing / build notes here  
            - Also add testers here. 
                - It's not obvious but when you click a + button to add testers to your App Store Connect Users group, if you read the text there is a link hiding in the text to [Add Users And Groups](https://appstoreconnect.apple.com/access/users).
                - First they have to accept the first invite and _then_ you can add them to the list of testers for your app.
                - When you look at the list of testers under "App Store Connect Users", it's not obvious that it only lists the top 5. So it seems like you're seeing a different list than what you see if you click "All testers". But actually if you click "See More" at the bottom, you'll get the full list.
                - The data you enter under "what to test" doesn't get emailed to testers. But if they open the TestFlight app on their device and click on the app icon, it says "What to test" and if they click on "more" they'll see the text you entered.

## Creating icons

- See [ios dev page](/pages/coding/mobile/iOS-Development#creating-icons)

## Data persistence

- There are many different types of data persistence
    - [This article](https://iosapptemplates.com/blog/ios-development/data-persistence-ios-swift/) has a good description of all the different wys you can store data _locally on a device_.
    - See sections below for more detail.

### CoreData

#### Quick-start to add CoreData to an existing project

- Create a new file and choose DataModel as its type
    - This will open the datamodel editor
    - you can return to this any time by double clicking the data model from the list of files on the left
- Use the plus button to add an entity (equivalent of a data table)
    - It will be called "Entity" by default - to rename it, just select its name on the left and click twice to type a new name
    - I found it helpful to name them all with a suffix "Model" - eg "GameStateModel" - so I could distinguish the models from the wrapper entities I created to keep the code clean and easily testable
    - Use the plus button to add attributes (columns)
    - Note that if you want your entity to be available to your tests, you'll need to add it to the test project too. Do this by 
        - selecting the entity on the left in the data model editor
        - clicking the button top right to get the property panel open on the right
        - click the little file icon at the top of the right hand panel
        - select the checkbox down in the Target Membership section 
- Create a CoreDataManager class
    - You can see an example in SquareFill (commit 0e758fb) or WordMistress (commit 1770b15)
- I then created four classes for each entity:
    - (all examples are visible in SquareFill - commit 0e758fb has everything below - accessible to Clare only - or Wordlessly, commit 1770b15)
    - A gateway interface (protocol) - eg IGameStateGateway
    - A gateway class - eg GameStateGateway - that can read from and write to CoreData
    - A mapper class - eg GameStateMapper - that could convert between the data model and the wrapper object
    - A DTO class (the wrapper object), that uses the gateway to update and fetch data
    - Note that this was a pattern I was using for a singleton object (saving the current game state to disk), but I think it should translate for multiple instances
    - Also I did it in a bit of a hurry - I'm sure it could be improved upon!
- Create some tests - start as you mean to go on!
    - You can see an example in SquareFill in GameStateMapperTests (commit 0e758fb) or in Wordlessly, commit 1770b15
    - You'll need a fake gateway and a test context - see classes FakeGamestateGateway and TestCoreDataStack
        - !! If you get the error "An NSManagedObject of class '[YourModelName]' must have a valid NSEntityDescription. (NSInvalidArgumentException)"
        - this is probably because you haven't used the correct model name in TestCoreDataStack
        - it needs to be the overall name of the parent data model - which I have been giving the same name as the overall project
        - see a line of code that looks something like this: `let container = NSPersistentContainer(name: "Wordlessly")`
    - To get a nice simple starting point, see the commits when I set this stuff up for the first time in WordMistress - see commit 1770b15.

#### My original notes

- I used the CoreData approach for saving game state in [SquareFill](https://github.com/claresudbery/SquareFillXCode) (accessible to Clare only).
- ! [This useful-ish article](https://iosapptemplates.com/blog/ios-development/data-persistence-ios-swift/) helps you get started
    - It talks about creating a data model but doesn't say how. 
        - That's [explained here](https://developer.apple.com/documentation/coredata/creating_a_core_data_model) (basically create a new file and select Data Model as the type).
    - It also talks about using the DataModel tool. 
        - This is the page that opens up automatically immediately after you create a new data model 
        - you can get back to it by double-clicking on your data model in the file view.
        - Use the + button bottom left to add a new entity - this is the equivalent of a data table
            - ! Be aware that after you have named your entity, the code will behave as though you had created a new class with that name
            - and actually it has, and if you use Ctrl + Cmd + J you'll be able to see the definition
            - but you can't see the class file in your code base. This is because it gets created dynamically every time you build.
            - similarly there will be an Extension class which contains all the data attributes - you can see this by doing Ctrl + Cmd + J on an attribute in the code
        - Double-click the entity on the left to rename it
        - Initially all you have to worry about is adding attributes - these will be the fields on your table. Use the + button in the Atribute section to add attributes.
    - It also talks about creating a CoreDataManager class.
        - ! This won't work without this extra line at the top of the file containing the CoreDataManager class: `import CoreData`
        - Also it has a couple of errors in it
            - It uses a different context (mainContext) for the load code than it uses in the Save code (backgroundContext())
                - I found this caused my saved objects never to actually persist
            - Also the load method doesn't have a return value outside the try...catch
                - You'll need a return line that creates a blank object
                - ! It's very important that you pass the context into your blank object
                - If you don't, you'll get the "Unrecognized selector sent to instance" error - which is really hard to debug!
                - You can see the finally-working SquareFill code I wrote for this [here](https://github.com/claresudbery/SquareFillXCode/blob/1205c0b2a6265145f556bfa76858254ba5fa89ca/SquareFillXCode/Utils/GameStateGateway.swift) (accessible to Clare only)
        - An alternative is to do the extra stuff in your AppDelegate file [described here](https://programmingwithswift.com/add-core-data-to-existing-ios-project/)
- Create / edit / delete CoreData entities
    - Good [simple article here](https://www.advancedswift.com/core-data-objects/)
- Fetching CoreData entities
    - Good [article here](https://www.advancedswift.com/fetch-requests-core-data-swift/#filter-fetch-request-with-predicate)
- Unit testing CoreData
    - [this is helpful](https://www.donnywals.com/setting-up-a-core-data-store-for-unit-tests/)
        - [also this](https://medium.com/tiendeo-tech/ios-how-to-unit-test-core-data-eb4a754f2603)
            - this is the one I used but I think that first one might be better
    - I got this working in SquareFill [here](https://github.com/claresudbery/SquareFillXCode/blob/ca2f6bfd6210e129b424c7ba360e12c4a990afa0/SquareFillXCodeTests/GameStateGatewayTests.swift#L43) (accessible to Clare only)
        - Note that it didn't work when I used background context - I used viewContext instead
        - Also the name for your container will be the name of the whole data model - eg mine is called "SquareFill". I got confused because XCode calls the whole thing a data model, whereas I am calling the individual classes (that represent tables) models.
            - If you get this wrong you'll probably get an error something like "An NSManagedObject of class '[YourModelName]' must have a valid NSEntityDescription. (NSInvalidArgumentException)"
    - [This looks interesting](https://www.raywenderlich.com/11349416-unit-testing-core-data-in-ios), but is too complex to get up and running quickly
- Using more complex data structures with CoreData
    - I think [this is the simplest example](https://www.hackingwithswift.com/books/ios-swiftui/one-to-many-relationships-with-core-data-swiftui-and-fetchrequest)
    - There's also [this one](https://medium.com/@ldhough2000/swift-5-and-core-data-with-transformable-f1d766629029)
    - To see the extra properties on attributes, relationships etc:
        - Select the thing you're interested in 
        - Look over to the right hand panel
        - You might have to click some of the icons at the top of the right hand panel to find what you want
    - I got this working in my GridGateway class. My code there will probably end up in GameStateGateway, but you can see an intermediate working version in [this commit](). 


### Restoring app state using built-in functionality

- I tried doing this via ViewController using [this article as a guide](https://developer.apple.com/documentation/uikit/uiscenedelegate/restoring_your_app_s_state), and you can see my attempt in [this commit]() (accessible to Clare only), but it didn't work - the relevant code never got fired.
    - Actually that article's pretty hopeless - the article contradicts itself, contradicts the code base, and mixes up two different methods of doing things so it's really hard to tell which is which - both in article and in sample code base
    - and then you find the disclaimer that says in some circumstances it will get overwritten...
    - ...and you realise you're still going to have all the same problems of it not supporting complex types...
    - ... I decided I may as well continue with my efforts to solve this using CoreData
    - ...which I seem to have got working pretty well (see notes above).

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
- Find class or file: Cmd + Shift + O
- Build: 
    - build project code only: Splat + B
    - build project AND test code: Shift + Splat + U
    - (see the Project => Build For menu)
- Run all tests: Splat + U

## Swift Debugging

- More [here](https://developer.apple.com/documentation/xcode/stepping-through-code-and-inspecting-variables-to-isolate-bugs)
- To watch particular variables:
    - Use console, bottom right, where logging info occurs
    - Type `v` then eg `self._guessableWord._currentWord` then hit Enter


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

## In App Purchases

I followed [this in-app purchases tutorial](https://www.raywenderlich.com/5456-in-app-purchase-tutorial-getting-started), but for an app that already existed - was being deployed to Test Flight but hadn't yet been launched in app store. This is what I needed to do:

- Sort out the tax / bank account stuff: [AppStore Connect](https://appstoreconnect.apple.com/) => Agreements, Tax and Banking (on the home page, BEFORE you click thrugh to an individual app) => Paid applications => Click any links you see in that row and follow instructions
    - This should involve accepting the Paid Applications agreement, ad then entering bank details
    - Note that I had to use an [IBAN generator](https://bank.codes/iban/generate/united-kingdom/) for Monzo
    - Also I entered the name of the company as the account holder (rather than my name)
    - !!!!! You also have to fill in a tax form!
        - If it says something about waiting for tax forms on the parent page, and then "Your banking updates are processing, and you should see the changes in 24 hours." when you click through... that doesn't necessarily mean you just have to wait. 
        - You also have to click through to "Select Tax Forms" in the tax forms section.
        - This gets you to W-8BEN which you seem to get no matter what
        - This is the tax form for individuals - I think if you want something different you maybe have to set up a separate Apple Developer account, for a company rather than an individual?
        - Enter "Ms" (or whatever) under Title, and "Individual" under Capacity in which you are acting.
- Add in-app purchases:
    - [App Store Connect => Features](https://appstoreconnect.apple.com/apps/1603897441/appstore/addons?m=)
    - Click + to add a new one - I went for auto-renewable subscription
        - Reference name is your own private reference
            - This can contain spaces
        - Product ID: Start with the bundle id for your app (available in [Apple Developer => Certificates and Ids](https://developer.apple.com/account/resources/identifiers/list)) then append a unique id - eg YourName.YourApp.YourIAP
            - I think this can't contain spaces
            - I've recorded details of mine in my readme.md
        - Subscription group reference name
            - I want to offer multiple subscrptions - one for Wordfully and one for Wordlessly - so I created a separate subscrption group for Wordfully 
        - Cleared for sale
            - This enables it
        - Family sharing
            - Click to turn on
        - Click the + button to set up a subscription price
            - This will ask you for a starting currency and price, and then allow you to tweak the converted prices for other regions
        - Click + to add a localization
            - I added one each for English US and English UK (not sure if that was necessary seing as I made them identical, but there you go)
                - ! Confusingly I still got errors saying I was missing a localization
                - When I clicked Learn More it took me to a diffrent screen asking for localizations
                - I _think_ the issue was that as well as having to add localizations for the IAP, I also had to add them separately for the subscription group.
        - Add a promotional image
            - This will be 1024x1024 for the app store
        - Add an IAP screenshot
            - This will not be displayed to users
            - ! If you get an error saying "you must upload a valid screenshot", this might be because the dimensions are wrong
                - This one is NOT a square image - it should have the same aspect ratio as a phone screen
                - [Here is a list of acceptable dimensions](https://i.stack.imgur.com/2KgKJ.png)
                    - eg 920 x 640 (h x w), which is what I chose
                - [More here](https://stackoverflow.com/questions/44083933/itunes-connect-you-must-upload-a-valid-screenshot)
        - Review notes
            - !! It turns out there's a separate text input for in-app purchases which gets used for app review. This is why they kept complaining they couldn't fnd my in-app purchases!
            - It's at the bottom of the in-app purchases page when you configure it in App Store Connect
            - First select the app, 
                - then select either In-App Purchases or Subscriptions on the left under Features, 
                - then select the name of the group
                - then click the actual subscription,
                - then scroll to Review Notes at the bottom of the page.
    - Once you're all done, go back to the same screen by clicking In-App Purchases on the left, and Turn On the billing grace period
    - Check your basic App information (also on the left in App Store Connect)
    - Set up a Sandbox user, so that your testers can test in-app purchases without actually having to buy it
        - App Store Connect home page => My Apps => select your app
        - at the very top, select Users and Access
        - On the left, Sandbox - testers
        - Add a user
        - It has to have a different email address to any other existing user, but you can do the trick of things like emailaddress+test01@gmail.com
        - Every time you buy something using that user, it sort of gets used up - so you might need multiple ones of these
- Now you set things up in XCode:
    - Select the root of the file tree on the left
    - Select the app under Targets
    - Select the Signing & Capabilities tab
    - Team and bundle ID will probably already be filled in correctly for you
    - You have to add a capability using the + button, which is well hidden but is basically in grey on the top left of the panel
        - Scroll down in the list - In-App Purchase is quite low down - select it and double-click

## Submitting / Deploying to the App Store

- Sections below help with details. 
- Note that you'll keep clicking Save and submit and it'll keep giving you links to fill more stuff in.
- It takes a while!

### Useful links

- [A CodeWithChris tutorial](https://codewithchris.com/submit-your-app-to-the-app-store/)
- [Guidance from Apple](https://developer.apple.com/ios/submit/)
- [Apple product page guidance](https://developer.apple.com/app-store/product-page/)
- [Screenshot sizes and guidelines from a blog](https://appradar.com/blog/ios-app-screenshot-sizes-and-guidelines-for-the-apple-app-store)
- [Screenshot sizes and guidelines from Apple](https://help.apple.com/app-store-connect/?lang=en/#/dev4e413fcb8)

### Resubmitting an app

- If you've already submitted a version but it failed and you want to try again, you'll need to edit details like version number (rather than adding a new version - this confused me for a while)
- On the App Store tab you'll see something like "iOS app 3.8"
- As well as editing version number, you'll also need to scroll down to the Build section at the bottom, then hover over it to remove that build (a red icon will appear on far right) and then add a new build.
- Once you've saved all the details (top right), you can click the Add for review button - also top right (or not, if you haven't given it all the data it wants)

### Troubleshooting App Review / App Store Submission

- I've written some notes on this [here in Trello](https://trello.com/c/dyzFQgos/941-app-store-submission).

### Routing App Coverage File

"According to apple's AppStore guidelines, If your app uses location to provide routing information, you must supply a geographic coverage file before submitting your app to App Review. 8 Dec 2020"

### Copyright

Put your name or your company name. Even if you're not actually registered for copyright, this can help in the event of a claim. Include a date.
Like this: 2022 Sudbery Software Engineering Ltd

### Privacy Policy URL

You'll need a privacy policy because if you offer support via a web form that collects email addresses.

En (UK): https://www.iubenda.com/privacy-policy/42682554
En (US): https://www.iubenda.com/privacy-policy/62922505

### Description, keywords etc

- !!! If you have more than one primary language (I had EN(UK) and EN(US)) then you have to enter all this stuff TWICE. I got caught out because I only edited it in UK and not in US. I suspect this was a rod I created for my own back by having two primary languages - UK and US - I probably should have just stuck with one.
- See Wordlessly notes.md for values saved for these inputs
- There are character limits - on Mac the quickest way I found of counting characters was to paste into VS Code and look at the column count at the bottom of the window.

### App clips

An App Clip is a small part of an app that lets you do a task quickly, like rent a bike, pay for parking, or order food.

### Screenshots

- You only need to do them (as of Feb 2022) for the following:
    - iPhone 11 Pro Max (6.5 inch) (1242 x 2688 pixels)
    - iPhone 8 Plus (5.5 inch) (1242 x 2208 pixels)
    - iPad Pro 5th gen (12.9 inch) (2048 x 2732 pixels)
        - you can use these screenshots for both "2nd gen (12.9 inch)" and "iPad Pro 3rd gen (12.9 inch)" in the app store
        - To record screenshots in the simulator, use File => Save screen
- [More here](https://developer.apple.com/support/app-previews/)
- also [more here](https://appradar.com/blog/ios-app-screenshot-sizes-and-guidelines-for-the-apple-app-store)

### App Previews

- You only need to do them (as of Feb 2022) for the following devices:
    - according to the [article I read](https://appradar.com/blog/ios-app-screenshot-sizes-and-guidelines-for-the-apple-app-store)
        - iPad Pro 2nd gen (12.9 inch)
        - iPad Pro 3rd gen (12.9 inch)
    - ... That doesn't appear to make sense because the screen dimensions are identical, and the 2nd gen isn't available in the simulator, and anyway according to the simulator, 3rd gen is 11-inch, but anyway it turns out you just need to record screenshots from the simulator for iPad Pro 5th gen (12.9 inch)
        - you can use these previews for both "2nd gen (12.9 inch)" and "iPad Pro 3rd gen (12.9 inch)" in the app store
- For any devices you don't own, run the app in the simulator and then record a video on your Mac:
    - Note that so far the only method I've managed to use successfully is the fourth one below - recording on device
    - First method:
        - Run your app in the simulator from XCode
        - File => Record screen
        - Once you're done, a small screenshot will pop up - you can right click on that and choose something like Save to Desktop
        - Sadly though, none of these worked for me - I just got errors in the app store saying the dimensions were wrong.
    - Second method:
        - Start your simulator
        - On command line: 
            - Go to location you want to save video
            - Then `xcrun simctl io booted recordVideo iPhone11ProMax.mov --codec=h264`
            - [More here](https://stackoverflow.com/questions/25797990/capture-ios-simulator-video-for-app-preview/66075167#66075167)
                - note that this says to add `type=h264` but this has now changed to `codec=h264`
            - Install ffmpeg
                - Use `brew install ffmpeg` but be aware that it downloads a lot of stuff and takes quite a long time!
                    - For me some things seemed to hang, so I did Ctrl + C and got the following messages:
                    - `brew postinstall fontconfig`
                    - `brew postinstall python@3.9`  

```  
curl is keg-only, which means it was not symlinked into /usr/local,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

If you need to have curl first in your PATH, run:
  echo 'export PATH="/usr/local/opt/curl/bin:$PATH"' >> ~/.zshrc

For compilers to find curl you may need to set:
  export LDFLAGS="-L/usr/local/opt/curl/lib"
  export CPPFLAGS="-I/usr/local/opt/curl/include"

For pkg-config to find curl you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"


zsh completions have been installed to:
  /usr/local/opt/curl/share/zsh/site-functions  

```  

- text
    - inserted
        - to fix
            - formatting issue
                - Note that I followed the instructions below but it was a bit of a faff! After going through all that pain I [discovered something](https://superuser.com/questions/624561/install-ffmpeg-on-os-x) saying I could probably have just run `brew install ffmpeg` so I would probably do that next time!
                - Otherwise follow [these instructions](https://bbc.github.io/bbcat-orchestration-docs/installation-mac-manual/)
                    - one of the instructions says to close a terminal window when you're told that you can
                    - but I waited a while and never saw anything telling me to close it
                    - so I closed it anyway which meant I had to say yes to terminate running processes
                    - after that I had to restart the terminal I was using to run ffmpeg
                    - but then when I ran ffmpeg on command line it appeared to just hang
                    - maybe I needed to put it in the path or somethuing, I dunno, but at this point I gave up and used brew instead (see above)
            - command line: `~/audio-orchestrator-ffmpeg/bin/ffmpeg -i iPhone11ProMax.mov -c copy temp.mp4`
            - [More here](https://mmazzarolo.com/blog/2020-09-07-app-store-previews/)
        - Ctrl + C to stop recording
        - If you see "error: unable to find utility "simctl"":
            - XCode => Preferences => Locations => select option from Command Line Tools dropdown
            - [More here](https://stackoverflow.com/questions/29108172/how-do-i-fix-the-xcrun-unable-to-find-simctl-error)
    - Third method:
        - Use QuickTime Player. Details [here](/pages/organising/tips/tech/misc-tech-tips.md#record-your-screen-on-a-mac).
    - Fourth method
        - Record on iphone or other device
        - the drawback is it only works for devices you own
        - I managed to record the 5.5" version on my iPhone 8 Plus
        - Weirdly the one I uploaded was actually a cropped version - I clipped the red "Recording" bar from the top - but it didn't complain about dimensions!
- [More here](https://developer.apple.com/support/app-previews/)

## How to lock screen orientation / prevent autorotate

- Blimey, this is NOT easy to Google!
- This is how you do it: Add this line to your main view controller (as I've done in SquareFill and Wordlessly):  
`override public var shouldAutorotate: Bool {return false;}`

## String interpolation

Like this:

```CSharp
var score = 85
var str = "Your score was \(score)"
```

## Emoji / Emoticon Unicode icon List

[Full list](https://unicode.org/emoji/charts/full-emoji-list.html)

## Build running really slowly

- I got this after I changed to release build and didn't change back to debug
- This also meant I couldn't set breakpoints!
- To select debug build:
    - Product => Scheme => Edit scheme
    - Click Run on the left
    - Select Build configuration: Debug
    - Check the Debug executable checkbox

## Colour contrast testing for colour blind people / WCAG guidelines / accessibility

- Use [this tool](https://color-contrast-checker.deque.com/)
    - If you have a colour defined in XCode like this...
    - `red: CGFloat(139.0/255.0), green: CGFloat(0/255.0), blue: CGFloat(139.0/255.0)`
    - ... then you enter it into the website like this: `rgb(139,0,139)`
- More info [here](https://www.deque.com/blog/testing-color-contrast-in-mobile-apps/#TestingMethodologies)

## Various links and notes on using shapes and textures

- Currently [still in Trello](https://trello.com/c/jlUegr0O/407-add-textures-as-backgrounds-and-make-panels-a-particular-shape) - need copying over here.

## Entering in-app purchase instructions

- !! It turns out there's a separate text input for in-app purchases which gets used for app review. This is why they kept complaining they couldn't fnd my in-app purchases!
    - It's at the bottom of the in-app purchases page when you configure it in App Store Connect
    - First select the app, then select In-App Purchases ob the left under Features, then scroll to Review Notes at the bottom of the page.