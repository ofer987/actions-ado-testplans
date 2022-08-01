@apiAdmin
Feature: API Admin tile

    The purpose of this feature is to perform a smoke test of the API Administration tile


    Scenario: User is logged-in to ONESOURCE Home Page
        Given the user is logged-in to ONESOURCE


    Scenario: Open Application Details Page in Applications page
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Application Details Page
        Then all the application fields should be displayed


    Scenario: View products enabled for the company and all the Applications
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Rate Limits Page
        And the user selects product
        Then applications should be displayed


    Scenario: Enter values for Limit %
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Rate Limits Page
        And the user selects product
        And the user enter values for Limit %
        Then the Limit % value should be displayed


    Scenario: Enter values for Reserve %
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Rate Limits Page
        And the user selects product
        And the user enter values for Reserve %
        Then the Reserve % value should be displayed


    Scenario: Check the Alteryx table in Alteryx page
        Given the user is in the ONESOURCE Home Page
        And the user is in the API Administration Page
        When the user opens the Alteryx page
        Then Download column should be displayed
        And download button should be enabled
        And Version column and information should be displayed
        And Description column and information should be displayed