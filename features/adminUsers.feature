
Feature: Admin Users Page

    The purpose of this feature is to test the Admin Users Page

    @complete @fullreport @UiReport
  @ADO-15397
    Scenario: User is logged-in to ONESOURCE Home Page
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing username and password
        Then Verify the user Logged in successfully

    @complete @fullreport @endFeature @UiReport
  @ADO-15398
    Scenario: Verify that userid is in the Users table
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When I landingPageLocators for an existing user
        Then userid should be existing in the table