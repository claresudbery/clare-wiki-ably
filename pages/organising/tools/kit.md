---
layout: page
location: pages/organising/tools/leaf
permalink: /pages/organising/tools/Kit
---
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

- Grow => Creator profile => Newsletter posts (on right)
- Turn on "Show Newsletter Posts" to show all of them
- Change Featured post to either Newest post or Selected post
- Click "Select broadcasts to display publicly" to change, one by one, which ones will appear and which will not

Change the thumbnail for posts featured on subscriber page

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
