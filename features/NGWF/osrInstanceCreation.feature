@ngwf
Feature: Statutory Reporting Page

    The purpose of this feature is to test the ONESOURCE Statutory Reporting product

    @osr
  @ADO-15604
    Scenario: NGWF_SC11_Click on Home icon
        # Given the user is logged-in to ONESOURCE
        Then the user click on Homepage icon and validate Homepage is landed

    @osr
  @ADO-15605
    Scenario: NGWF_SC12_Click on Statutory Reporting Tile
        Given I am in the Statutory Reporting Page

    @osr
  @ADO-15606
    Scenario Outline: NGWF_SC13_Create OSR instance
        When I click on Add New Reporting Entities Button with "<Entity Name>"
        And I filter entity using "<Entity Name>"
        And I click on created Entity and add financial period with entity code
        And I click on created FP with "<Entity Name>"
        Then I validate the Workflow icon highlight

        Examples:
            | Entity Name |
            | ename       |

    @osr
  @ADO-15607
    Scenario Outline: NGWF_SC14_Validate the instance creation in Related Workflows
        When I click the highlighted icon should see two dropdown values
        And I click on Related Workflows button
        And I update the task in Taskpane with "<End Date>"
        Then the "Draft" task should be updated and displayed in the history tab

        Examples:
            | End Date   |
            | 12/31/2020 |

    @osr
  @ADO-15608
    Scenario Outline: NGWF_SC15_Validate the instance creation in All Workflows
        When I click All workflows button
        And I select "Statutory Reporting" from Workflows dropdown
        # When the user selects "Entity Name" column
        And the user filter "Entity Name" column with keyword "<Entity Name>"
        Then the column should return "<Entity Name>" records
        And I validate the updated task status

        Examples:
            | Entity Name |
            | ename1      |

    # @osr
    # Scenario: Logout of the ONESOURCE application
    #     When there are other tabs opened close them
    #     Then I logout from the application