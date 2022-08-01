@ngcal
Feature: Due Dates tab

    As a user, I want to be able to verify the different functionalities of Due Dates tab in Calendar 2019 page

    # @test @demo @hide
    # Scenario: User is logged-in to ONESOURCE Home Page
    #      Given the user is logged-in to ONESOURCE
    #      And the user is in the Calendar page


    Scenario: NGCAL_SC8_Navigate to Due dates tab
        When the user clicks on Due date section


    Scenario: NGCAL_SC9_Check the filter panel
        Then the filter should be opened


    Scenario: NGCAL_SC10_Hide the filter panel
        When the user hide the filter panel
        Then the filter panel should be hidden


    Scenario Outline: NGCAL_SC11_Filter the record
        When I click on Filter button to open Filter Panel
        When I enter "<Year>" for Year
        When I enter "<Jurisdiction>" for Jurisdiction
        When I enter "<TaxType>" for Tax Type
        #When the user hide the filter panel

        Examples:
            | Year | Jurisdiction | TaxType             |
            | 2025 | Afghanistan  | Fringe Benefits Tax |


    Scenario Outline: NGCAL_SC12_Add comment
        When the user clicks on Edit button
        When the user adds comment "<Comment>" in DD
        And click on Save button
        And the user clicks on Audit History
        Then the comment "<Comment>" should be displayed in DD

        Examples:
            | Comment     |
            | New comment |

    
    Scenario: NGCAL_SC13_Verify DDP screen functionality in Edit panel
        #When the user clicks on Edit button
        Then validate Due dates properties page loaded


    Scenario Outline: NGCAL_SC14_Validate the Change Status flag
        When the user clicks on back button in Due date edit panel
        When the user selects the "<noOfRecords>" records
        And click on Change Status flag an update the status with "<status>"
        Then user should see the status column with updated value for "<noOfRecords>" with "<status>"

        Examples:
            | noOfRecords | status     |
            | 1           | Completed  |


    Scenario: NGCAL_SC15_Validate the Delete Instance in SDD
        Given the user is in the Schedule Due Dates tab    
        When I click on Filter button to open Filter Panel
        When the user select the row and click on Delete instance
        Then the user should see the alert message


    Scenario: Logout of the ONESOURCE application
        When there are other tabs opened close them
        Then I logout from the application