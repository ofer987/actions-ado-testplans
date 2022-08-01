@ngwf
Feature: NG Workflow product

    As a user, I want to be able to verify the different functionalities of Workflow product


  @ADO-15588
    Scenario: NGWF_SC1_Login to ONESOURCE application and validate the Calendar product availablity
        Given the user is logged-in to ONESOURCE
        And the user is in the "Calendar" product page
        Then I should be able to see three options


  @ADO-15589
    Scenario: NGWF_SC2_Navigate to Indirect Tax Compliance product page
        Given the user is in the "Indirect Tax Compliance" product page


  @ADO-15590
    Scenario Outline: NGWF_SC3_Display "<columnName>" column
        When the user selects "<columnName>" column
        Then "<columnName>" column should be displayed

        Examples:
            | columnName |
            | Year Start |


  @ADO-15591
    Scenario Outline: NGWF_SC4_Hide "<columnName>" column
        When the user deselects "<columnName>" column
        Then "<columnName>" column should be hidden

        Examples:
            | columnName |
            | Year Start |


  @ADO-15592
    Scenario: NGWF_SC5_Navigate to Statutory Reporting product page
        And the user is in the "Statutory Reporting" product page


  @ADO-15593
    Scenario Outline: NGWF_SC6_Set a page to "<rows>" of rows per page
        When the user sets the page to "<rows>" per page
        Then the number of rows should be within "<rows>"

        Examples:
            | rows |
            | 25   |


  @ADO-15594
    Scenario: NGWF_SC7_Add comment
        When the user adds comment
        Then the comment should be displayed


  @ADO-15595
    Scenario: NGWF_SC8_Navigate to Test Application product page
        And the user is in the "Test Application" product page


  @ADO-15596
    Scenario Outline: NGWF_SC9_Sort "<ColumnName>" column in ascending order
        When the user sorts "<ColumnName>" column in ascending order

        Examples:
            | ColumnName  |
            | Entity Name |


  @ADO-15597
    Scenario Outline: NGWF_SC10_Sort "<ColumnName>" column in descending order
        When the user sorts "<ColumnName>" column in descending order

        Examples:
            | ColumnName  |
            | Entity Name |


    # Scenario: Logout of the ONESOURCE application
    #     When there are other tabs opened close them
    #     Then I logout from the application