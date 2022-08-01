@ngcal
Feature: Calendar page

    As a user, I want to be able to verify the smoke functionalities of Calendar page


    Scenario: User is logged-in to ONESOURCE Home Page
        Given the user is logged-in to ONESOURCE
        And the user is in the Calendar page
        And the user is in the Schedule Due Dates tab


    Scenario Outline: NGCAL_SC1_Check "<tabName>" tab in NextGen Calendar Page
        Then "<tabName>" tab should be present

        Examples:
            | tabName              |
            | Due Dates            |
            | Schedule Due Dates   |
            | Import Queue         |
            | Content Update Notes |
            | Setup                |


    Scenario: NGCAL_SC2_Check the filter panel
        Then the filter should be opened


    Scenario: NGCAL_SC3_Hide the filter panel
        When the user hide the filter panel
        Then the filter panel should be hidden


    Scenario Outline: NGCAL_SC4_Display "<columnName>" column
        When the user selects "<columnName>" column in "<Tab>" tab
        Then "<columnName>" column should be displayed

        Examples:
            | columnName | Tab |
            | Entity ID  | SDD |


    Scenario Outline: NGCAL_SC5_Hide "<columnName>" column
        When the user deselects "<columnName>" column in "<Tab>" tab
        Then "<columnName>" column should be hidden

        Examples:
            | columnName | Tab |
            | Entity ID  | SDD |


    Scenario Outline: NGCAL_SC6_Create Calendar instance in Schedule Due Dates
        When I click on Add Row functionality with "<Year>" and "<Jurisdiction>"
        And I select Tax Types for "<Tax Type>"
        And I select Entities with "<Entity Name>" entity name
        And I click Next on Complete Entity Related questions
        Then I select Confirm Obiligations for "<Tax Type>" and click Done

        Examples:
            | Year | Jurisdiction | Entity Name    | Tax Type |
            | 2025 | Afghanistan  | Swathi QA test | MVA      |


    Scenario Outline: NGCAL_SC7_Verify filter scenarios for Calendar product in Schedule Due Dates
        When I click on Filter button to open Filter Panel for SDD
        When I enter "<Year>" for Year for SDD
        When I enter "<Tax Type>" for Tax Type for SDD
        When I enter "<Jurisdiction>" for Jurisdiction and "<Deliverable Type>" for DeliverType for SDD
        Then Validate filtered rows for SDD with "<Jurisdiction>" and "<Tax Type>"

        Examples:
            | Year | Jurisdiction | Tax Type            | Deliverable Type |
            | 2025 | Afghanistan  | Statutory Reporting | Return           |