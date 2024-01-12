# Logging in

- I had a Wordpress site hosted by Ionos, and it started doing a thing where whenever I logged in, it tried to get me to choose a new site template.
- Solution:
    - It turned out a plugin had been added without me realising
        - I found it by accident when lookign at plugins for another reason
    - All I had to do was go to Plugins on the left => Recently Active at the top
    - Then clicked "Deactivate" under "Ionos Assistant"
- Workaround:
    - The workaround was to remove the extra bits from the end of the url you get redirected to after logging in
    - So, change it to be just https://insimpleterms.blog/wp-admin instead of https://insimpleterms.blog/wp-admin/admin.php?page=ionos-assistant
        - (change the first part to your blog url)

# Changing account settings

- There's an account settings page which isn't accessible for me via the blog dashboard
- Instead I have to go directly to wordpress.com (NOT wordpress.org, where I seem to have an unrelated account) and log in there.
    - Click on the person / profile icon, top right
    - Select Account Settings on the left
- But there's also a Settings page on the left in the blog dashboard.
    - Log in via https://insimpleterms.blog/wp-admin (change the first part to your blog url)
    - Go to Settings on the left
    - ...or click the Profile icon, top right, and select Edit profile

# Changing email addresses

- I found FOUR different places where I had different email addresses configured!
    - This might be related to the fact that I have a Wordpress account hosted by Ionos
    - It seems to be CONNECTED to my personal Wordpress account, but not quite the same thing?
- 1. Wordpress.com
    - There's an account settings page which isn't accessible for me via the blog dashboard
    - Instead I have to go directly to wordpress.com (NOT wordpress.org, where I seem to have an unrelated account) and log in there.
    - Click on the person / profile icon, top right
    - Select Account Settings on the left
    - Change email address
- 2. Blog dashboard => Settings
    - Log in via https://insimpleterms.blog/wp-admin (change the first part to your blog url)
    - Go to Settings on the left, and scroll down to "Administration Email Address"
- 3. Blog dashboard => Profile
    - This is the email address that comment notifications and approvals will be sent to
    - Log in via https://insimpleterms.blog/wp-admin (change the first part to your blog url)
    - Click on the profile icon, top right
    - Select Edit profile
    - Scroll down quite a long way to the "Contact info" section
- 4. Blog dashboard => Contact form
    - This is to specifically set where contact forms will be sent
    - Log in via https://insimpleterms.blog/wp-admin (change the first part to your blog url)
    - Go to Contact => Contact forms on the left
    - Edit the contact form
    - Select the Mail tab
    - This is where you configure both WHAT you'll receive when someobe fills ut a form and WHERE you'll receive it
    - Change the "To" email address at the top

# Preventing spam in contact forms and comments

- Install BestWebSoft reCaptcha plugin
    - You'll need the pro version if you're using Contact Form 7 - costs $24 per year
    - When you upgrade to Pro, you'll get an email with a download link
        - download the attachment (a zip file)
        - Go to plugins section and add new plugin
            - Even if you already added the plugin, you have to "add new plugin" again and upload the new zip file
        - click the upload button and upload the zip file
        - fill in the sections in Wordpress Settings (will be linked to from plugins page)
    - Go to your contact form, click Edit and click the BWS ReCaptcha button then click Insert tag
        - you might need to move the resulting script to your desired place on the page
        - you don't have to click Save in both places - either at the bottom of the page or up at top right is fine
    - Testing:
        - Note that you probably won't see the Recaptcha if you're logged into that browser with your own Wordpress account
    - More [here](https://blog.hubspot.com/website/control-spam-integrating-google-invisible-recaptcha-wordpress-site)
        - and [here](https://bestwebsoft.com/documentation/recaptcha/recaptcha-user-guide/#h.w9uy9s6ycn88)
- Turn on comment moderation

## Problems with BWS ReCaptcha

"Hi 
I have just purchased a Pro licence and have added BWS ReCaptcha to my Wordpress contact form (using Contact Form 7). I have inserted the tag using the BWS ReCaptcha button in Wordpress. The tag looks like this: [bwsgooglecaptcha bwsgooglecaptcha-643]
But now my contact form, as well as containing ReCaptcha functionality, has an extra text field that I didn't add. When I remove the ReCaptcha tag, the text field goes away again.
How can I make ReCaptcha work without this unwanted text field?
I am attaching a couple of screenshots so you can see what I mean."

NB: I MANAGED TO FIX THIS BY SWITCHING TO RECAPTCHA V3.
    - It didn't work when I switched to v2 invisible.
    - Each time I switched, I had to add a new reCaptcha site config in my Google account [here](https://www.google.com/recaptcha/admin/site/692824470)
        - ...and then update the site key and the secret key in the ReCaptcha plugin settings in Wordpress
    - It didn't mind me having multiple ReCaptcha site configs for the same domain
    - To see all configs, go [here](https://www.google.com/recaptcha/admin)

![Wordpress-contact-form7-config.png](/resources/images/Wordpress-contact-form7-config.png)

![Wordpress-rogue-BWS-reCaptcha-text-field.png](/resources/images/Wordpress-rogue-BWS-reCaptcha-text-field.png)