---
layout: page
location: pages/organising/tools/leaf
permalink: /pages/organising/tools/Kit
---

## How to avoid gotchas when posting

- 1. [[#1. Don't copy/paste from previous posts without hitting Edit|Don't copy/paste from previous posts without hitting Edit]]
- 2. You CAN edit existing posts. (see [[#Edit published content|section below]])
- 3. [[#3. Things to add at the last step|Don't forget to add extra stuff on the last step of publishing]]
- 4. Don't forget to [[#4. Publish to the right subscribers|publish to the right subscribers (and edit title accordingly)]]
- 5. Don't forget to [[#5. Include a link for sharing|include a link for sharing]]
- 6. Include at least one image. `clare-tech/finding-things#Images` has a list of places you can look to find good images (Clare only).
- 7. Be aware that bullet lists are formatted such that there's no decent space between the end of the list and the next piece of text. The best solution is to use Shift + Enter before the next piece of text.
- 8. It helps to refer to other people and all their good shit. Don't make it just about you!
### 1. Don't copy/paste from previous posts without hitting Edit

What I was doing was going to the Broadcasts page, finding a previous post, clicking on it and then copy/pasting sections with links. The problem with this is you don't get proper urls - instead you get preview versions, and your new post will be published with preview links (eg https://preview.convertkit-mail2.com/click/dpheh0hzhm/aHR0cHM6Ly9xdWVlbi1vZi1xdWVzdGlvbnMua2l0LmNvbS8=, which leads to my Kit home page) instead of proper links.

But what I should have done is click the Edit button on the previous post and THEN copy/paste the section with links. That way I get the proper urls and not the preview version.
### 3. Things to add at the last step

- Add a thumbnail image
- Add alt text for the thumbnail
- Tick the box to feature the post at the top of my profile
- Scroll down and expand Advanced, then add a summary of the article for social media etc
- If you forget and need to do this after the fact, see [[#^seo-settings|section below on SEO settings]]
### 4. Publish to the right subscribers

- Select the right subscribers in the final step
- Add `[LLM]` or `[Tech Leads]` to the start of the title
	- ...unless it's either, in which case don't bother, and publish to all subscribers
### 5. Include a link for sharing

- Include a link for sharing
- Add this text at the bottom: 
	- "🔗 Want to share this article or save it for later? [Here's a handy link for you!](https://queen-of-questions.kit.com/posts/i-m-a-tech-lead-but-my-senior-devs-have-better-technical-skills-am-i-losing-my-edge)"
	- !! That example includes a link to a different post! But it shows you how to convert from title to url
	- You can also use my tool to do the hyphenising for you
		- The tool is [in GitHub here](https://github.com/claresudbery/ai-general/blob/main/misc%20tools/kit%20link%20generator/kit_link_generator.html) 
		- Just download [the html](https://github.com/claresudbery/ai-general/blob/main/misc%20tools/kit%20link%20generator/kit_link_generator.html) and double-click to run in browser
		- ...unless you're me. I have a shortcut in Chrome bookmarks: `Admin/Utils`
		- I originally used [this process file](https://github.com/claresudbery/ai-general/blob/main/misc%20tools/kit%20link%20generator/.windsurf/processes/KitLinks.process.md), and documented the tool creation in [this blog post](https://queen-of-questions.kit.com/posts/llms-how-can-i-make-a-quick-thing).
## Quick setup notes

- I've used Kit (formerly ConvertKit) to create a newsletter
- It was recommended to me by the Stacking the Bricks / 30x500 product development course
- You can subscribe to my newsletter [here](https://queen-of-questions.kit.com/)
- You can create your own account [here](https://kit.com/)
  - Watch out!
  - By default you'll be put on a paid plan, which will take you through creating some fancy home pages and stuff
  - But if you then downgrade to the free plan, all that stuff appears to disappear!
	  - It doesn't actually disappear, it just gets hidden under Grow => Landing pages & forms
- Kit gives both a barrier-free way of publishing blog posts and subscribing customers to your newsletter.
- To have blog posts show on the subscription page:
  - Grow => Creator profile => Newsletter posts => Show newsletter posts (toggle this to on)
- To send a new broadcast out:
  - You need at least one subscriber
  - You won't get subscribers unless people both click to Subscribe AND click the Confirm button in the subsequent confirmationm email
    - !! This confirmation email may well end up in spam folders!
  - Click Send => Broadcasts => New broadcast
  - Click on a template
    - This isn't obvious - you have to click on the image
    - Give it a subject line
    - Add some content
    - Might have to wait a few seconds, then the Continue button bottom right will be highlighted
    - Click Continue
      - Select the options you want
    - Click Continue again
    - It may take quite a long time before it lands in inboxes
      - But check spam folders!
	      - I discovered the reason stuff was going to spam folders was because I was using a free gmail account as my "from" address
	      - ...and finally I see the point of the extra email address I was given (clare@claresudbery.com) when I upgraded to a paid Gmail account. When I use this, my mailouts don't seem to go into spam folders. I can't remember how I changed this, but I was prompted to do it by Kit.


## Find pages and forms

- I have subscriber forms, which also double as permanent pages, in the following places...
- Editable/configurable via Grow => Creator Profile:
	- Creator profile (effectively main home page): https://queen-of-questions.kit.com/
- Editable/configurable via Grow => Landing pages & forms:
	- Technical leadership newsletter: https://queen-of-questions.kit.com/tech-lead-subscribe 
	- Freelance career newsletter: https://queen-of-questions.kit.com/freelance-career-subscribe
	- Landing page: https://queen-of-questions.kit.com/landing
## Create the capability for more than one "newsletter"

1. [[#1. The simple way of having multiple newsletters|The simple way]]
2. [[#2. The more complicated way of having multiple newsletters|The more complicated way]]
## 1. The simple way of having multiple newsletters

- Grow => Subscribers
- Scroll down until you see "Manage Subscriber Preferences" over on the right - click this
- Create "topics of interest" as per instructions on screen
- There's a warning in there about not reusing existing tags, but that's only a problem if you have automations set up that mean extra things happen when people get tagged
	- It's not a problem if you reuse tags that you only created for categorisation purposes
	- ...and whose only automation so far is that they get automatically applied whenever somebody fills in a particular form
- People can now change their own preferences to get the right tags applied to their profile when they click "Update Profile" at the bottom of a Kit newsletter email
	- The UI says they get it when they click "Update preferences" but it's actually "Update profile" (or it was for me, anyway).

## 2. The more complicated way of having multiple newsletters

I think maybe when I wrote the notes, the simple way didn't exist yet!

I did this by automatically tagging / segmenting people who signed up via different forms designed to represent the different "newsletters", using the following steps:
### Create forms

- I created two forms (Grow => Landing pages & forms), and gave them both urls (form => edit => settings => domain name, then click Add, then click Save, then Publish back on the main page):
	- Subscribe to Technical leadership newsletter: https://queen-of-questions.kit.com/tech-lead-subscribe 
	- Subscribe to Freelance career newsletter: https://queen-of-questions.kit.com/freelance-career-subscribe
- You can now add links to your creator profile ([mine is here, still a work in progress](https://queen-of-questions.kit.com/)) and landing page ([mine is here, still a work in progress](https://queen-of-questions.kit.com/landing)) that will take people to these forms.

### Set up tags and automations

- ! It turns out you don't NEED to use tags for this next bit - see [adding segments](<#set up segments>) - but I decided I liked the idea of having tags
- Then I created two tags
	- Grow => Subscribers
	- Scroll down on the right, find Tags => Create a tag
- Then I set up an automation connected to each form: 
	- Automate => Rules => New rule
	- Trigger = "Subscribes to a form"
	- Action = "Add tag"
	- For each form, I set it up to add the relevant tag
	- ! Note that you can also set up automations for the landing page and creator profile forms, so you can effectively customise these to subscribe people to a particular newsletter 
### Set up segments

- I created two segments, one for each tag (but see below for how to do it without tags)
	- Grow => Subscribers
	- Scroll down on the right, find Segments => Create a Segment
	- Matching all => Add filter
	- Subscribed to => tags => select tag(s)
	- Click Add filter
	- Click Save
- ...or you can just connect your segment direct to a form... ^forms
	- Grow => Subscribers
	- Scroll down on the right, find Segments => Create a Segment
	- Matching all => Add filter
	- Subscribed to => forms => select form(s)
		- Note: As well as any manually-created forms, this will also allow you to select the subscription form on your creator profile ([mine is here, still a work in progress](https://queen-of-questions.kit.com/)) and the subscription form on your landing page ([mine is here, still a work in progress](https://queen-of-questions.kit.com/landing)) 
	- Click Add filter
	- Click Save
- To delete / edit a segment, select it and it will then appear on the left and you can click where it says Edit in brackets
	- See [this page](https://help.kit.com/en/articles/2577659-how-to-create-a-segment) for more on creating segments
- Then when you publish...
	- Add filter => Within segment => select your segment(s)

## Routine actions
### Change which posts are featured on subscriber page

When posting...

- The last page when clicking Continue to publish
- ...gives you the option to feature the new post on the creator profile
- (as well as set a thumbnail and some other things)

After the fact...

- Grow => Creator profile => Newsletter posts (on right)
- Turn on "Show Newsletter Posts" to show all of them
- Change Featured post to either Newest post or Selected post
- Click "Select broadcasts to display publicly" to change, one by one, which ones will appear and which will not

Change the thumbnail for posts featured on subscriber page ^seo-settings

* Send => Broadcasts
* Open the broadcast by clicking on the title, NOT by three dots => Open
* Scroll down on the right and find the SEO Settings section. Click the little Edit pencil, and you can change the featured image, the meta description and the alt text for the image.
* GOTCHA:
	* The mistake I made was to click Edit. You have to NOT click Edit. 

## Edit published content

- You CAN edit broadcasts when they are web only (not emailed)
- It's not obvious from the main screen but go to Send => Broadcasts
- Open the broadcast by clicking on the title, NOT by three dots => Open
- Now you'll see an edit button at the top right
## Get a shareable url for a published post

1. Go to the Broadcasts page and click on your broadcast's title

2. Click the "Open" button at the top right of the report page

3. Copy the URL from your browser's address bar - this is your shareable link

## Troubleshooting

### Bad gateway error (502)

- This appeared briefly late at night and was fixed by their team - don't know what the problem was (see emails 14/10/25)
### Bad formatting of bullet lists

- this was a css problem and was fixed by them who, "have added some CSS codes to your creator profile and here is how a public broadcast now looks like, please see the screenshot below for your reference."
- (see emails on 1/10/25)
### Deleting test broadcasts

- "Unfortunately, we can't delete the Broadcast email that sent out already."
### Removing the X/Twitter share button from your pages

- They sorted it out for me: "I added a CSS code to remove the X share button."
- See emails 8/4/25
