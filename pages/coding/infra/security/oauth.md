---
layout: page
location: pages/coding/infra/security/leaf
permalink: /pages/coding/infra/security/OAuth
---

## Historic Notes

  - These notes were originally written 2018

## Spring Security for OAuth2 and Spring Boot

  - There might be some useful stuff in [Cadogan
    (PRIVATE)](https://github.com/claresudbery/Cadogan)
  - Documentation:
    [<span class="underline">https://docs.spring.io/spring-security/site/docs/5.0.2.BUILD-SNAPSHOT/reference/htmlsingle/\#getting-started</span>](https://docs.spring.io/spring-security/site/docs/5.0.2.BUILD-SNAPSHOT/reference/htmlsingle/#getting-started)
  - Sample Spring Security code:
    [<span class="underline">https://github.com/spring-projects/spring-security-oauth/tree/master/samples</span>](https://github.com/spring-projects/spring-security-oauth/tree/master/samples)
  - Oauth2 client project:
    [<span class="underline">https://github.com/spring-projects/spring-security-oauth/tree/master/samples/oauth2/tonr</span>](https://github.com/spring-projects/spring-security-oauth/tree/master/samples/oauth2/tonr)
  - To run sample client code:
      - This: **dev**
      - This: **cd cadogan/spring-security-oauth/samples/oauth2/tonr**
      - This: **mvn tomcat7:run**
      - Then visit http://localhost:8080/tonr2 in a browser and go to the sparklr tab
      - More here:
        [<span class="underline">https://github.com/spring-projects/spring-security-oauth/tree/master/samples</span>](https://github.com/spring-projects/spring-security-oauth/tree/master/samples)
  - How to get things working with Gradle:
    [<span class="underline">https://docs.spring.io/spring-security/site/docs/5.0.2.BUILD-SNAPSHOT/reference/htmlsingle/\#gradle</span>](https://docs.spring.io/spring-security/site/docs/5.0.2.BUILD-SNAPSHOT/reference/htmlsingle/#gradle)
      - Then do this: **./gradlew clean build --refresh-dependencies**
      - If that has worked, you will see on the left hand side in
        IntelliJ, under External Libraries, the dependency you need
        should now be listed
      - Alt + Enter: this will give a hint to import the right thing
  - Client registration:
    [<span class="underline">https://docs.spring.io/spring-security/site/docs/5.0.2.BUILD-SNAPSHOT/reference/htmlsingle/\#jc-oauth2login-client-registration</span>](https://docs.spring.io/spring-security/site/docs/5.0.2.BUILD-SNAPSHOT/reference/htmlsingle/#jc-oauth2login-client-registration)

## Sample Oauth2 Code Notes

  - There might be some useful stuff in [Cadogan
    (PRIVATE)](https://github.com/claresudbery/Cadogan)
  - Looking at this code base:
    [<span class="underline">https://github.com/spring-projects/spring-security-oauth/tree/master/samples/oauth2/tonr</span>](https://github.com/spring-projects/spring-security-oauth/tree/master/samples/oauth2/tonr)
  - The sparklr2 stuff can be found in target/tomcat/webapps/sparklr2
  - The tests seem to be the most helpful code
  - These tests seem to be most useful:
    ResourceOwnerPasswordProviderTests
  - This seems to be a class being used by the tests:
    BaseOAuth2ProtectedResourceDetails
      - …useful because of this method: setAuthenticationScheme
      - …it is being inherited from by
        ResourceOwnerPasswordResourceDetails, which is being extended by
        various test classes
  - This flag used before tests, is relevant when testing:
      - @BeforeOAuth2Context:
        [<span class="underline">https://docs.spring.io/spring-security/oauth/apidocs/org/springframework/security/oauth2/client/test/BeforeOAuth2Context.html</span>](https://docs.spring.io/spring-security/oauth/apidocs/org/springframework/security/oauth2/client/test/BeforeOAuth2Context.html)
      - Documentation here:
        [<span class="underline">https://docs.spring.io/spring-security/oauth/apidocs/org/springframework/security/oauth2/client/test/BeforeOAuth2Context.html</span>](https://docs.spring.io/spring-security/oauth/apidocs/org/springframework/security/oauth2/client/test/BeforeOAuth2Context.html)



