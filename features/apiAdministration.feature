@apiAdmin
Feature: API Admin tile

    The purpose of this feature is to perform a smoke test of the API Administration tile


  @ADO-15565
    Scenario: User is logged-in to ONESOURCE Home Page
        Given the user is logged-in to ONESOURCE


  @ADO-15566
    Scenario: Open Application Details Page in Applications page
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Application Details Page
        Then all the application fields should be displayed


  @ADO-15567
    Scenario: View products enabled for the company and all the Applications
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Rate Limits Page
        And the user selects product
        Then applications should be displayed


  @ADO-15568
    Scenario: Enter values for Limit %
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Rate Limits Page
        And the user selects product
        And the user enter values for Limit %
        Then the Limit % value should be displayed


  @ADO-15569
    Scenario: Enter values for Reserve %
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Rate Limits Page
        And the user selects product
        And the user enter values for Reserve %
        Then the Reserve % value should be displayed


  @ADO-15570
    Scenario: Check the Alteryx table in Alteryx page
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Alteryx page
        Then Download column should be displayed
        And download button should be enabled
        And Version column and information should be displayed
        And Description column and information should be displayed