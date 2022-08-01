
Feature: Accounts Critical Scenarios

    @complete @Smoke
    Scenario: OneSource Login
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing username and password
        Given I am in the ONESOURCE Home Page

    @Smoke
    Scenario: Verify user is able to navigate to the Accounts Page
        And I am in the Administration Page
        When I select Account button from the dropdown
        Then I am in Accounts Page

    @Smoke
    Scenario: Verify user is able to create chart
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When I select Account button from the dropdown
        When I click the create New chart button
        And I add the details for creating chart
        And Verify chart is created


    Scenario: Verify account is added
        And I click the created chart
        And I add the account details
        #And Verify account is added