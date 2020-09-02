---
layout: page
location: pages/coding/infra/security/leaf
permalink: /pages/coding/infra/security/Security-in-the-Public-Sector
---

# Security for Organisations

## Security for Organisations

- From a talk by [James Stewart](https://public.digital/people/james-stewart/)

### General Orgs

- Context and people
    - Throughout everything, think about human interaction, and think about context (eg users' environment)
- What is the org's risk appetite?
    - What do they really value?
    - What could really take them out of business?
    - What are they willing to accept?
- Threat modelling
    - See Jim Gumbley's workshop
    - Draw out who all the possible disruptors, what do they care about, where are we vulnerable?
    - Draw your system using boxes, and lines between the disruptors and the components to show what / how they might attack
- Attack trees
    - ![attack trees](/resources/images/attack-trees.png)
- Books to read
    - "Agile Application Security" by Bell, Brunton-Spall, Smith, Bird
    - "Threat Modelling - Designing for Security" by Adam Shostack
- Security of the Zoom conferencing tool - An example of considering security
    - [Equal Experts blog post about Zoom security considerations](https://www.equalexperts.com/blog/our-thinking/why-we-made-up-our-own-minds-about-zoom/)
    - What's the purpose or outcome wanted from using this tool?
    - What are the moving parts involved in that? (what are the things that people might interact with?)
            - web service
            - service to make links work
            - installed software
            - users' environment (eg person wfh with whiteboard behind them)
    - What would the effects be of various problems?
        - You can enhance your attack tree with a list of possible impacts on the org, and then consider how much do they matter?
        - Here's a sample impact list:
        - ![attack-tree-with-impact-list.png](/resources/images/attack-tree-with-impact-list.png)
- Remember that everything keeps changing! Eg Zoom have made security updates.
- Summary:
    - The key to security is balancing risk with need
    - Most decisions are trade-offs
    - There are a lot of structured techniques you can use and specialists are vital
    - Pick a technique that shows you the considerations top to bottom

### Public Sector

- Some orgs will consider their biggest threats and then apply the derived restrictions across the whole org, even to depts that are much less critical
- The [Security Policy Framework](https://www.gov.uk/government/publications/security-policy-framework) (SPF) is a standard doc owned and published by cabinet office
- The 2014 reflected a shift from a compliance based approach to one based on actual security needs.
- National Cyber Security Strategy
    - set by ministers
    - is quite a good read!
    - An example from the latest one: Some cyber attacks - eg large DOS (Denial Of Service) attacks - have become significantly easier due to things like resource sharing and cloud elasticity
- Security Policy Framework and National Cyber Security Strategy are the responsibility of Cabinet Office Cyber and Government Security Directorate, working closely with National Cyber Security Centre (NCSC). Overall governance is through the National Security Council structure.
- Each dept will often have a Senior Information Risk Owner (SIRO) - this has recently switched a bit more to Chief Information Security Officer, who tend to be more engaged
    - Accreditors and CLAS consultants have historically advised SIROs
    - The formal requirement to have Accreditors and CLAS consultants was taken away some time ago, so if you are told you need one, it's worth questioning.
    - Some of them are super helpful, some can be obstructive
    - Try to bring them into the conversation asap so that you can get mutual understanding and start working in the same direction
    - They might talk a lot about accreditation and impact levels 
        - accreditation now increasingly replaced by "approval to operate"
        - impact levels officially defined - eg BIL3 - Business Impact Level 3.
            - Could get really complicated
            - Could lead to being told all data should be encrypted in a really specific way
            - Worth querying, and considering tradeoffs and impacts
            - When people start talking about impact levels, do whatever you can to home in on specific risk rather than using this borad approach - and find ways to mitigate it against it slowing you down unnecessarily, if that's the case
    - Information Asset Owners might also get involved         
        - look for ways to bring them in as early as possible so that you can get mutual understanding and start working in the same direction
- "baseline standards"
    - Security Policy Framework in 2013/2014 marked a big shift
    - stripped away most "baseline standards"
    - many of them opaque and not understood by anyone
    - often led to a lot of work, and people dodging making real decisions
    - they're sneaking back in again but are now better - eg minimum cyber security standard
- There are various orgs that set standards in the healthcare space - eg CareCert, NHSX, NHS Digital
    - is a moving landscape - orgs keep merging, splitting, changing roles
    - seek out a local expert within your org
- Summary:
    - Policy and governance start at a high level
    - At a cross-government level most policy and standards are based on borad outcomes
    - Be familiar with the names: Security Policy Framework, NCSC, Minimu Cyber Security Standard 
    - Always bring it back to business risk
        - What are we worried about?
        - What do we actually need to protect against?
        - How likely are the possible threats?
        - Avoid using fear as a motivator
        - The law is the law, it doesn't matter whether you've signed the Official Secrets Act or not
- Three categories of info:
    - Official, Secret, Top Secret:
![official-secret-top-secret](/resources/images/secret-top-secret.png)
    - **Secret** is the fuzziest one
    - It's unlikely you'll encounter anything other than official
    - There used to be more categories
    - One suggestion is that when categorizing as "official", add handling instructions - eg "Official-Sensitive" but that has led to people viewing "Official - Sensitive" as a formal category. This can make delivering any kind of public service really hard. It's not actually a category - more on that [here](https://www.gov.uk/guidance/official-sensitive-data-and-it)

### 14 cloud security principles

![14-principles](/resources/images/14-considerations.png)
- Before using cloud security principles, put it in context. Ask not "Are we secure?" but "Are we secure against what?"
- Tons of guidance [here](https://www.cloud.service.gov.uk/cloud-security-principles)
![Principles-1-to-3](/resources/images/Principles-1-to-3.png)
![Principles-4-to-6](/resources/images/Principles-4-to-6.png)
- the one about personnel security can be misinterpreted - suggesting everyone in your org needs to be security checked when that is probably not actually necessary.
![Principles-7-to-9](/resources/images/Principles-7-to-9.png)
![Principles-10-to-12](/resources/images/Principles-10-to-12.png)
![Principles-13-to-14](/resources/images/Principles-13-to-14.png)
- Summary:
    - Be sensible
    - Take risk seriously
    - Understand local context early
    - Make sure you know who's on the hook - eg SIRO - and build relationships with them
    - Use structured tools (eg attack trees, threat modelling), and get expert help with that if needed
    - Don't be fazed by jargon - the important stuff is all on the web
