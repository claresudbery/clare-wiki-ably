---
layout: page
location: pages/coding/tools/testing/leaf
permalink: /pages/coding/tools/testing/Galen
---

## Galen Tests

  - This was a SOAP-based acceptance-testing framework we used on
    Cadogan. Full disclosure: We actually deleted the full Galen test
    suite not long after taking over the product because it was so
    brittle. I’m not personally a fan of these types of test unless
    they’re extremely well designed. Also in my experience the SOAP
    testing framework has quite a steep learning curve and often leads
    to a situation where only one person maintains and understands the
    test suite – which is not ideal.

### Galen example

  - ([sample code base here](https://github.com/claresudbery/Cadogan) –
    only available to Clare)
  - All the front-end code bases contain Galen folders containing Galen
    tests
  - These are front-end tests
      - Note that there were Galen pipelines in each of the frontend
        pipeline groups
  - We found them to be quite brittle and difficult to maintain
      - They rely heavily on precise details of design (colour, position
        etc) therefore they break easily.
  - The tests rely on the mocks in the Mocks code base
      - These use SOAP to create mock endpoints for the third parties
  - If you decided to start running the Galen tests again, they are run
    from the Galen pipelines (see above)
      - They are quite processor intensive
      - The previous team had a separate local Go agent which they used
        to run the Galen tests
      - See the Project Admin doc - “Configuring jobs to run on
        particular Go Agents” - to see how you can set up a pipeline to
        run on a specific Go agent.
  - Galen pipelines
      - Each brand had its own galen pipeline
      - Each galen pipeline was not a dependent of any of the stages or
        pipelines
      - Therefore it wasn’t mandatory
      - But it was triggered automatically
      - It ran in parallel with dev/qa pipeline
