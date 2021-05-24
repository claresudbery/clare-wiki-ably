```javascript
module.exports = {
    before: function (browser) {
        var homepage = browser.page.healthyclareville.homepage();
        homepage.navigate();
    },

    'Navigating to article "UITEST: A balanced diet", navigationg to the contact us page and then returning to the homepage': function (browser) {
        var homepage = browser.page.healthyclareville.homepage();
        homepage.goToTopicListBlockPage(browser, "UITEST: Healthy weight", "/topic/uitest-healthy-weight");

        var topicpage = browser.page.healthyclareville.topicpage();
        topicpage.assertTitleIsVisible('UITEST: Healthy weight');
        topicpage.goToArticlePage(browser, "UITEST: A balanced diet", "uitest-a-balanced-diet");


        var articlepage = browser.page.healthyclareville.articlepage();
        articlepage.assertTitleIsVisible("UITEST: A balanced diet");
        articlepage.assertProfileIsVisible("Brickton, clareville");
        articlepage.goToNextSection(browser);
        articlepage.goToContactUsPage(browser);

        var contactuspage = browser.page.healthyclareville.contactuspage();
        contactuspage.assertTitleIsVisible("Contact Us");

        contactuspage.goToHomePage(browser);

        homepage.assertTitleIsVisible("People of clareville");
    },
   
    after: function (browser, done) {
        setTimeout(function () {
            done();
            browser.end();
        }, 200);
    }
};
```