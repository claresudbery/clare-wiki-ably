---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/Gradle
---
## Historic Notes

  - These notes were originally written 2018

## Debugging a Java App Using IntelliJ IDEA and Gradle

  - This in root backend folder: **./gradlew bootRun** (in Windows cmd,
    just **gradlew bootRun**)
      - Note you’ll get a message saying Building 80% - this means
        you’re done\!
      - To set breakpoints and debug, do this:
          - First make sure you don’t already have a running instance –
            check Terminal to see if you ran ./ gradlew bootrun
          - First method:
              - Top right, click the dropdown next to the green Play
                button
              - If you already have myproject-backend \[bootRun\], select that
                then click the green debug icon to the right
              - Otherwise: Select Edit Configurations
              - Select Defaults | Gradle on the left
              - Where it says Gradle project, to the right of the input
                is a sort of green square icon
              - Click on this and select backend
              - Click OK
              - Now you can select it and click the debug icon on the
                right
          - Second method:
              - View | Tool Windows | Gradle
              - Expand Tasks | Application
              - Right-click BootRun and select Debug
      - Then change environment.js for the frontend :
          - This: ENV.APP.BACKEND\_URL =
            '[<span class="underline">http://localhost:8080</span>](http://localhost:8080)'
      - If you want to change what you’re hooking up to and you’re using
        Spring Boot (Eagle Eye API etc), go to
        src/main/resources/**application.yml (see Spring Boot page in
        this wiki)**
  - **Alternatively:**
      - You can do **./gradlew build** (in Windows cmd, just **gradlew
        build**)
      - Or you can run previously-built jar
          - Like this: **java -Dspring.profiles.active=mock -jar
            ./build/libs/YOUR-SNAPSHOT.jar –debug**
          - Use flag debug on jar to get debug logs on command line for
            backend

## Gradle and Spring Boot 

  - Sample code base at [Cadogan
    (PRIVATE)](https://github.com/claresudbery/Cadogan)
  - build.gradle: jar section: manifest attributes – tell it what the
    main class, ie entry point for the code is
  - backendapplication.java:
      - SpringApplication. Run – classic spring boot
  - Gradle config: build.gradle
      - See gradle docs:
        [<span class="underline">http://gradle.org/docs</span>](http://gradle.org/docs)
      - You can also set key-value pairs in gradle.properties, then
        refer to them from build.gradle
      - Uses groovy language
      - Plugins:
          - Jacoco – test reports
          - GenJaxb
          - Schema: contract supported by SOAP XML
              - Front end: only deal with one type of file, but
                internally converted into xml, to be supported by SOAP
                XML
              - Only generate the code once, then check in this
                generated code: eg \[blah\].\[blah\].wsdl
              - See src/generated for generated code
              - Different types of SOAP request that we can do, then all
                being converted into different java classes
  - Main entry point to code
      - BackEndApplication.java
      - Then you go straight to controllers  

## Running tests

  - ([Sample code base for Clare
    only](https://github.com/claresudbery/Cadogan))
  - There are two sets of tests in the backend: unit tests and
    integration tests.
  - This means that there are two separate commands to run on the
    command line:
      - This: **./gradlew test**
      - …and this: **./gradlew integTest**
  - All tests are in the src / test folder
  - See the readme for other gradle commands
