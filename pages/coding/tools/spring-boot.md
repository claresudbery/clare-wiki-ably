---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/Spring-Boot
---
## Misc

  - Sample code base at [Cadogan
    (PRIVATE)](https://github.com/claresudbery/Cadogan)
  - These notes were originally written 2018

## Logging Config

  - Src/main/Logback-spring.xml – logging config
  - Want logging to be minimal, useful, but not affect performance
  - For debug use level=”debug”
  - Appender tells whether logs go to file or console or whatever
  - maxHistory=5 means 5 days
  - max file size is 5Mb – if a file fills up, then an index is appended
    and a new file created (eg mything.log for current and
    mything.2017-12-01.1.log for filled up log), and the previous file is
    renamed with the date stamp of the date the file filled up
  - default log location is same location as jar file

## Application.yml and VendorProperties

  - Environment-specific details, urls, access tokens etc are in
    src/main/resources/Application.yml
  - How are settings from application.yml used?
      - See VendorProperties
        (myproject-backend\\src\\main\\java\\com\\myproject\\backend\\config\\VendorProperties.java)
      - This class gets injected into most other classes using
        SpringBoot’s default dependency injection.
      - For instance, you’ll see private var browserCacheTime in
        BrandDetail, and access functions getBrowserCacheTime and
        setBrowserCacheTime.
      - Also check out the SpringBoot annotations, ie @Configuration,
        @EnableConfigurationProperties and @ConfigurationProperties.
        These are what allow the VendorProperties to automatically take
        values from application.yml
          - If you look in application.yml, you’ll see there is a
            section headed **vendor:** - this is indicated in
            VendorProperties by **prefix="vendor"** at the top.
          - You’ll also see the VendorProperties access method setBrands
            and the member var brands – I believe these relate to the
            section headed **brands:** in application.yml.
          - There is a simple example here:
            [<span class="underline">http://www.baeldung.com/configuration-properties-in-spring-boot</span>](http://www.baeldung.com/configuration-properties-in-spring-boot)

## Gradle and Spring Boot

  - See section on Gradle page
