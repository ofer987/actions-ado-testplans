
Feature: Datahub Critical Scenarios

    @complete @Smoke 
    Scenario: OneSource Login
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing username and password
        Given I am in the ONESOURCE Home Page

    @OneSourceAdmin @complete @Smoke 
    Scenario: Verify user is able to create blueprint
        And I click the datahub tile
        When I click the configuration tab and Add blueprint button
        And add the details of the blueprint
        And verify blueprint is created

    
    Scenario: Verify user is able to create Template
        When user click on the template button under configuration tab
        And user add the details of the Template
        And verify template is created

    
    Scenario: Verify collection is created
        When user is able to navigate to the collection screen
        And user add the details of the collection
        And verify collection is created

    @endFeature 
    Scenario: Verify user is able to navigate through tabs
        And user click MyWorkspace tab and verify the page
        When user click configuration tab and verify the Page
        And user click Data tab and verify the Page
        
    
    Scenario: Upload file
        And I click the datahub tile
        When user navigates to the import page
        And user upload the file
        Then verify file got uploaded