
Feature: Accounts Critical Scenarios

    @complete @Smoke
  @ADO-15609
    Scenario: OneSource Login
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing username and password
        Given I am in the ONESOURCE Home Page
   

   
    @Smoke
  @ADO-15610
    Scenario: Verify user is able to navigate to the Accounts Page
        And I am in the Administration Page
        When I select Account button from the dropdown
        Then I am in Accounts Page

    @Smoke
  @ADO-15611
    Scenario: Verify user is able to create chart
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When I select Account button from the dropdown
        When I click the create New chart button
        And I add the details for creating chart
        And Verify chart is created


  @ADO-15612
    Scenario: Verify account is added
        And I click the created chart
        And I add the account details
        #And Verify account is added