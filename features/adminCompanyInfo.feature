
Feature: Admin Company Info Page

    The purpose of this feature is to test the Company Info  pages

    @complete @UiReport
  @ADO-15511
    Scenario: User is logged-in to ONESOURCE Home Page
        Given I am Logging to "Onesource" Application
        When  I try to login to "OneSource" by providing username and password
        Then  Verify the user Logged in successfully

    @complete @UiReport
  @ADO-15512
    Scenario Outline: Verify that the Accounts Page can be opened
        Given I am in the ONESOURCE Home Page
        And   I am in the Administration Page
        When  User selects "<Page>" from CompanyInfo tab
        Then  Verify "<Page>" Page Navigation

        Examples:
            | Page     |
            | Accounts |
            | Entities |

    @UiReport
  @ADO-15513
    Scenario: logout of the application
        Given click the logout of the application