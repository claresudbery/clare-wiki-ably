---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Metrics
---

## When metrics go wrong

- “TELL ME HOW YOU WILL MEASURE ME, AND THEN I WILL TELL YOU HOW I WILL BEHAVE. IF YOU MEASURE ME IN AN ILLOGICAL WAY, DON’T COMPLAIN ABOUT ILLOGICAL BEHAVIOR.” – ELI GOLDRATT
- Dee Hock - [the tyranny of measurement](http://www.deewhock.com/essays/community-and-the-non-monetary-exchange-of-value-1): " If we were to set out to deliberately design an efficient system for the methodical destruction of community, we could not do better than our present efforts to monetize all value, mechanize all societal organizations and reduce life to the tyranny of mathematical measurement, markets and the ever increasing centralization of power and wealth that result.  Money, mechanism, measurement and markets have their place.  They are useful tools indeed.  We should use them carefully for beneficent ends.  But useful tools are all they are.  They do not deserve the deification the apostles of unrestrained acquisition insist that we give them.  Only fools worship their tools."
- Some things are really hard to measure - eg the impact of saying good morning to people - and yet we can still all agree that it's worth doing (this came from a conversation with [Tito Sarrionandia](https://twitter.com/rbs_tito) but I can't remember whether he was quoting anyone).

## Accelerate Metrics / DORA metrics

- The four key metrics described in [the "Accelerate" book](https://www.amazon.com/Accelerate-Software-Performing-Technology-Organizations-ebook/dp/B07B9F83WM) 
    - Martin Fowler's foreword describes Accelerate very clearly as the book that contains the explanation for why the State of DevOps reports (and the DORA metrics they use) are so very compelling and trustworthy
    - DORA is also relevant to [The DevOps Handbook](https://www.oreilly.com/library/view/the-devops-handbook/9781457191381/)... but not directly referenced apart from a nod in the acknowledgements
        - Devops Handbook is more about the three ways
        - See my notes on DevOps-Handbook, [here](/pages/think/code-princ/books/DevOps-Handbook)
- aka the DORA metrics
    - DORA = [DevOps Research and Assessment](https://www.devops-research.com/research.html) - a startup created by Gene Kim and Jez Humble with Dr. Nicole Forsgren at the helm (those three also wrote the book).
    - (downloaded for Clare in clare-tech/resources)
- Originally came from DORA State of DevOps report 
    - [Here is the 2019 report (accessible to Clare only)](https://drive.google.com/file/d/1Ul3snv4o7b0AxAWPfdwzH5HylvWdsW76/view?usp=sharing) 
    - you can [download your own copy here](https://cloud.google.com/devops/state-of-devops/)
    - See also [[#DORA AI Reports]]
    - The first Dev Ops report was published [by DORA in 2014](https://dora.dev/publications/pdf/state-of-devops-2014.pdf)
- The metrics are:
    - Deployment frequency 
    - Lead time
        - Lead Time for Changes measures the velocity of software delivery
        - Lead time for changes measures the time that a commit takes to reach production.
    - Time to restore, aka mean time to recovery (MTTR) (aka mean time to restore)
        - MTTR describes the average time to recover from a failed deployment, incident, or service outage. It measures the time from the detection of an incident or outage until the full system functionality is restored.
    - Change failure rate ("a measure of how often deployment failures occur in production that require immediate remedy (particularity, rollbacks).")
        - Change failure rate is a metric that determines the changes that lead to failures after they reach production or are released to end-users, and it's expressed in percentages.
    - Reliability [added in 2021] 
        - From DORA 2022:
        - "Reliability is a broader measure that includes availability, latency, performance, and scalability"
        - "Both the practices we associate with reliability engineering (e.g., clear reliability goals, salient reliability metrics, - etc.) and the extent to which people report meeting their reliability expectations are powerful predictors of high levels of - organizational performance."
        - captures operational capabilities
        - "We asked respondents to rate their ability to meet or exceed their reliability targets."
- I saw a great presentation about this 
    - by [Tito Sarrionandia](https://twitter.com/rbs_tito) (slides available to Clare only [here](https://docs.google.com/presentation/d/1W_zNVG0Pig3zryaWfCE66qvAzzm9ZtDJ/edit#slide=id.p1)) 
    - where he talked about four key DORA metrics      
    - He made the following points:
        - Those four measurable areas are not tradeoffs
        - They represent measures of speed and of stability - they correlate highly with each other
        - Organisations moving faster, are typically breaking less.
        - There is no evidence that organisations are able to optimise one of those things by trading off the others. High performers score highly across the board in all four metrics, low performers score badly across the board. 
- "Focusing on only these metrics ... empower\[s\] organizations by having objective measures of determining if the changes they’re making have an actual impact"
    - The Accelerate book was very much focused on DevOps (infrastructure and deployment) and these metrics help you to focus on how good your infrastructure and deployment pipelines are.
    - My notes on Accelerate are [here](https://clare-wiki.herokuapp.com/pages/think/code-princ/books/Accelerate)
    - [More here](https://stelligent.com/2018/12/21/measuring-devops-success-with-four-key-metrics/#:~:text=In%20the%20book%20Accelerate%20by,Lead%20time%20for%20changes&text=Time%20to%20restore%20service,Change%20failure%20rate)
- [Blog post about the report](https://www.previous.cloudbees.com/blog/dora-and-google-cloud-chart-pathway-elite-devops-performance?utm_source=google&utm_medium=cpc&utm_campaign=Flow_EU&utm_content=&gclid=EAIaIQobChMIh6faoY6v6AIViaztCh3JcwRkEAAYAiAAEgIVLfD_BwE)

### Useful tools for measuring the DORA metrics

- LaunchDarkly
- NewRelic
- Honeycomb
- [Twitter question about measuring DORA metrics](https://twitter.com/bluesky383/status/1659171340237131776?s=46&t=r9YzfVeOvsijkv89U8okaQ)
- [Multitudes](https://www.multitudes.co/)
    - via Pete Hodgson (ex TW), who knows the founder
- Pluralsite Flow (neé GitPrime) 
    - more focused on CI-side metrics (how long PRs and branches are alive for, lead time for tickets, that sort of thing) rather than CD-side metrics (deploy frequency, change failure rate)
    - less recommended

## DORA AI Reports

- I have these downloaded to Google Drive/MyDrive/Research/DORA
- Two reports:
	- DORA: Impact of Generative AI in Software Development, 2024 (I think?)
		- [Online here](https://dora.dev/research/ai/gen-ai-report/)
		- Downloaded here:
			- `Google Drive/MyDrive/Research/DORA/`
			- `dora-impact-of-generative-ai-in-software-development.pdf`
	- DORA: State of AI-assisted Software Development, 2025
		- [Online here](https://dora.dev/research/2025/dora-report/)
			- `Google Drive/MyDrive/Research/DORA`
			- `2025_state_of_ai_assisted_software_development.pdf`


