
Feature: Reference Data Scenarios

    Scenario: OneSource Login
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully


    Scenario: Verify Authorities in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Authorities in Reference Data tab
        Then Verify url and title of page


    Scenario: Verify Currencies in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Currencies in Reference Data tab
        Then Verify url and title page


    Scenario: Verify Financial Hierarchy in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Financial Hierarchy in Reference Data tab
        Then Verify url, title of page

    Scenario: Verify Domains in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Domains in Reference Data tab
        And User selects the Domain name and enters text
        Then Verify url & title of page

    Scenario: Verify Jurisdictions in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Jurisdictions in Reference Data tab
        And User selects the Jurisdictions Country and enters text
        Then Verify url title of page