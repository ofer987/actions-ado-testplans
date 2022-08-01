@ngwf
Feature: NextGen Indirect Tax Compliance Page

    The purpose of this feature is to test the ONESOURCE Indirect Tax Compliance product


  @ADO-15598
    Scenario: NGWF_SC16_Click on Home icon
        #Given the user is logged-in to ONESOURCE
        Then the user click on Homepage icon and validate Homepage is landed


  @ADO-15599
    Scenario: NGWF_SC17_User is logged-in to Indirect Tax Compliance Page
        Given I am in the Indirect Tax Compliance Page


  @ADO-15600
    Scenario Outline: NGWF_SC18_Create ITC instance
        When I navigate to configuration tab and select Entity Manager
        And I should be able to create new Entity with "<Entity Name>" and "<Entity Short Name>"
        And I should able to create data set from Returns tab
        And I fill details for Dataset with "<Dataset Name>" and "<Entity Name>"
        And I assign template to selected Entities
        And I should able to see the created Dataset with "<Dataset Name>" in returns page
        And I click on the Return Name generated with "<Entity Short Name>"
        And I fill the pervious VAT year
        And I click on Save and Refresh
        Then I validate the Workflow icon highlight

        Examples:
            | Entity Name | Entity Short Name | Dataset Name |
            | ename       | sname             | ds           |


  @ADO-15601
    Scenario Outline: NGWF_SC19_Validate the instance creation in Related Workflows
        When I click the highlighted icon should see two dropdown values
        And I click on Related Workflows button
        And I update the task in Taskpane with "<End Date>"
        Then the "Prepare" task should be updated and displayed in the history tab

        Examples:
            | End Date  |
            | 7/31/2020 |


  @ADO-15602
    Scenario Outline: NGWF_SC20_Validate the instance creation in All Workflows
        When I click All workflows button
        When the user filter "Entity Short Name" column with keyword "<Entity Short Name>"
        Then the column should return "<Entity Short Name>" records
        And I validate the updated task status

        Examples:
            | Entity Short Name |
            | sname             |


  @ADO-15603
    Scenario: Logout of the ONESOURCE application
        When there are other tabs opened close them
        Then I logout from the application