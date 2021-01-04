---
layout: page
location: pages/coding/infra/security/leaf
permalink: /pages/coding/infra/security/CSRF-Cross-Site-Forgery
---
## CSRF Tokens - Overview

  - (Note that this is not the same thing as SSL certificates – they are
    a thing connected with https – see separate section)
  - CSRF tokens are held on a web page.
      - (“Cross Site Forgery”)
  - Basically if you want to do a POST from a particular web page, you
    have to include a key in the header for your POST request
      - This means that when the user performs an action that results in
        a POST request, there will be some extra data added to the
        request
      - When the form is rendered in their browser, it will have an
        extra hidden field added, with a token Id
          - This is a unique token Id which varies for each user session
          - …but not each individual request
          - This is because otherwise, you would have problems with
            multi-tab browsing
      - Also, the user will have a cookie created in their browser which
        has the same token Id
      - When they do the POST, a check will be done to make sure the
        token Id in the cookie matches the token Id in the POST request
      - It is done to prevent somebody malicious from showing a page
        with a form which, behind the scenes, is sending your POST
        request
      - On their web page they cannot add the same token Id, because
        they cannot access your cookies to see what your token is
  - In MVC, this can be managed by
      - Using the HTMl helper Html.AntiForgeryToken() in the view which
        contains a web form (or you can use Html.BeginForm(), in which
        case you get it for free)
      - Putting the \[ValidateAntiForgeryToken\] attribute on the
        controller method
  - See here:
    <http://stackoverflow.com/questions/5207160/what-is-a-csrf-token-what-is-its-importance-and-how-does-it-work>
  - And here:
    <http://stackoverflow.com/questions/14421962/asp-net-mvc3-antiforgerytoken>

## CSRF Tokens - Examples

  - We implemented this in a Contact Us form at
    [Samba](https://github.com/claresudbery/samba)
      - This is because it was giving POST access to the back end, and
        we wanted to protect this
      - Although later this was queried, because this website dis not
        have a login session like our other website did. With a login
        session you need CSRF to protect against this scenario:
          - User is logged in
          - User receives email from scammer
          - Email contains link which appears to be something unrelated
            (eg special offer on cheap dresses\!)
          - User clicks link which is actually going to a url on our
            domain, which allows the scammer to achieve something
            because the user is currently logged in
          - But with a CSRF token in place, the scammer cannot ape the
            url after all, because all requests have to have a CSRF
            token in the header, and the scammer does not have access to
            this token
          - In fact we did not have logged in sessions, BUT we did have
            this scenario:
          - DOS (Denial Of Service) attack caused by hackers sending
            repeated requests to the Contact Us form, causing our
            servers to send out repeated emails, which grinds our
            service to a halt
              - Uh-oh\! This is actually what happened\! See “CSRF
                Update” below.
          - With CSRF tokens in place, this becomes harder for the
            hacker to achieve because they do not have access to the
            token required in the header for the Contact Us url
  - Some deep detail (you might want to skip):
      - ArticleFactory.Build
      - \_markdownWrapper.ConvertToHtml(body ?? "");
      - You can add a tag helper in the html which will render a hidden
        field which contains a token to validate that the view has come
        from a server
      - the tag helper sorts the header out for you
      - This will validate that the POST request coming in is from a
        client that is allowed to make that request
      - .Net core validates off a header field and the hidden field -
        both have to be present for validation
      - This is predominantly a problem for POST requests, ie forms.
        Don't bother with GET requests because we could just throttle
        them or blacklist them
      - We only have one form = contact us
      - Outside of the context in which we're actually showing the user,
        it won't add the header
      - We effectively mock a new context to get this to work
      - The internal context might not be shared with the context in
        which we present to the user
      - \[Route("/contact-us")\]
      - \[HttpPost\]
      - \[ValidateAntiForgeryToken\]
      - \- that last one is the key one (this is on the controller
        method)
      - Can use Html.AntiForgeryToken()
          - Example:
          - \<% using(Html.Form("UserProfile", "SubmitUpdate")) { %\>
              - \<%= Html.AntiForgeryToken() %\>
              - \<\!-- rest of form goes here --\>
          - \<% } %\>
      - From here:
        http://blog.stevensanderson.com/2008/09/01/prevent-cross-site-request-forgery-csrf-using-aspnet-mvcs-antiforgerytoken-helper/
      - You get it for free with Html.BeginForm()
      - …or you can put an html attribute in the form tag: \<form
        asp-antiforgery=“true”\>

## CSRF Update – a DoS Attack

  - Below is the email I sent to everyone after we reviewed CSRF tokens
    because we had a DoS attack via a Contact-Us form: a bot was
    repeatedly (every few seconds) sending emails, for two 24-hour
    periods
      - In fact it turned out the bot was effectively bypassing the
        Contact-us form embedded in the page: we removed the form and
        the attack continued anyway
          - This was because it had worked out what the contact-us
            endpoint was, and was going to that directly
  - Notes:
      - Although we had previously believed there was no need for CSRF,
        that was based on there being a perceived low risk of DoS
        attack. In the end we did indeed experience such an attack
      - BUT CSRF tokens wouldn’t have protected us anyway, because the
        attackers had a direct endpoint they were hitting, which
        wouldn’t have been protected by CSRF? Or because they could
        easily get a CSRF token simply by having a session open in a
        browser?
  - Email:
      - Tl;dr: We will not be pursuing CSRF tokens on the Contact Us
        form (details below), but we will be implementing them in other
        circumstances
      - **Details:**
      - CSRF tokens are designed to protect against an attacker using
        somebody’s logged-in session to send Post requests to our
        server.
      - Our main reason to implement CSRF is that Observatory (3rd party
        service that checks our website for flaws) give us a bad score
        because we do not have CSRF in place.
      - 1\) There are two barriers to implementing CSRF:

<!-- end list -->

  - In order for CSRF validation to take place, a combination of session
    cookie plus CSRF token is required.
  - Without both pieces being in place, the request will not be
    validated.
  - It is possible to enable “Forward Cookies” in Cloudfront, and
    without doing this, the CSRF validation does not work.
  - We were just forwarding “all cookies” – which was making each
    request very unique and therefore preventing a lot of caching from
    taking place.
  - This was part of the reason we abandoned CSRF validation.
  - It is worth noting that we could have whitelisted specific cookies,
    instead of forwarding all cookies, but we have an extra problem…
  - 2\) The way we render contact-us forms prevents the .Net CSRF
    functionality from working in the way it is intended:

<!-- end list -->

  - The contact-us form is set up as a tag in Contentful, which is then
    parsed by Content API and rendered after the page is loaded
  - The .Net framework takes care of inserting CSRF tokens (as hidden
    fields, I believe) into the body of the HTML.
  - These are designed to match up with the session cookie so that each
    user has their own CSRF token, which cannot be forged by a
    hacker.      
  - We create the contact-us form html ourselves manually as part of
    Contentful tag parsing.
  - Although we do get a CSRF token from .Net, we are inserting the form
    html ourselves at a point after the CSRF token would normally be
    created.
  - As a result, a new token is somehow created which does not match the
    session cookie in the way we would expect.
  - Conclusion:

<!-- end list -->

  - > CSRF tokens will not in themselves prevent a similar DoS attack

  - > We have already spent a significant amount of time trying and
    > failing to address point 2) above

  - > We have confirmation that, particularly as our users do not sit
    > behind a login, CSRF tokens do not make any significant security
    > contribution.

  - > Our main reason for implementing CSRF is that we get marked down
    > by Observatory for not having it in place.

  - > We agreed not to pursue CSRF any further for Contact-Us.

  - > However, as we are able to whitelist the CSRF cookies in
    > CloudFront, we can still pursue using CSRF in other forms.
