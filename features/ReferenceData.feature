
Feature: Reference Data Scenarios

  @ADO-15388
    Scenario: OneSource Login
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully


  @ADO-15389
    Scenario: Verify Authorities in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Authorities in Reference Data tab
        Then Verify url and title of page


  @ADO-15390
    Scenario: Verify Currencies in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Currencies in Reference Data tab
        Then Verify url and title page


  @ADO-15391
    Scenario: Verify Financial Hierarchy in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Financial Hierarchy in Reference Data tab
        Then Verify url, title of page

  @ADO-15392
    Scenario: Verify Domains in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Domains in Reference Data tab
        And User selects the Domain name and enters text
        Then Verify url & title of page

  @ADO-15393
    Scenario: Verify Jurisdictions in Reference Data tab
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Jurisdictions in Reference Data tab
        And User selects the Jurisdictions Country and enters text
        Then Verify url title of page