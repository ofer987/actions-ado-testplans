@entities1 
Feature: Entities Critical Scenarios

    
  @ADO-15613
    Scenario: OneSource Login
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully

    
  @ADO-15614
    Scenario: Verify user is able to navigate to the Entity Page and adding entity
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Entities button from the dropdown
        Then User adds new entity in entities page

    
  @ADO-15615
    Scenario: Verify the above created entity by filtering the data
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Entities button from the dropdown
        And User search for created record using filter
        Then Verify the record in entities table

    
  @ADO-15616
    Scenario: Creating entities Via import
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Entities button from the dropdown
        And User search for created record using filter
        And User selects Import and import files
        Then Verify page navigated to entities

    
  @ADO-15617
    Scenario: Exporting the entities
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Entities button from the dropdown
        And User search for created record using filter
        And User exports the selected record
        Then User verify file downloaded
        And User compare with baseline file

    
  @ADO-15618
    Scenario: Deleting the entities
        Given User navigates to ONESOURCE Home Page
        When User on Administation page
        And User selects Entities button from the dropdown
        And User search for created record using filter
        And User deletes the selected record
        Then Verify record is deleted successfully