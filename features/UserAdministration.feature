
Feature: Admin Users Page

    The purpose of this feature is to perform a smoke test of the ONESOURCE User Administration

    @Smoke @ale
    Scenario: User is logged-in to ONESOURCE Home Page
        Given the user is logged-in to ONESOURCE
        And I am in the ONESOURCE Home Page

    @Smoke @ale
    Scenario: OUA_TC001_SC1_Verify Regular user is created
        Given I am in the Administration Page
        When the user clicks on Add on the Users page
        And Add New Users page is displayed
        And the user enters mandatory User details and clicks Next
        Then Client Manager page is displayed
        And the user selects all available clients and clicks transfer
        Then Selected clients are displayed and the user clicks Next

    @Smoke @ale
    Scenario: OUA_TC001_SC2_Verify User is able to give full access in User Administration
        Given user is in the Client Manager page and clicks on the Next button
        And the user is on the User Permissions page
        When the user clicks on full access for User Administration
        Then This user has User Administration Custom Settings is displayed
        And User navigates to User Details tab
        And User navigates to User Permissions tab
        And Green dot is displayed next to User Administration

    @Smoke @ale
    Scenario: OUA_TC001_SC3_Verify user has been created successfully in the grid
        Given the user is on the Product Licenses page
        When Click Next
        When the user clicks on the Done button
        Then user or group is created successfully

    @Smoke
    Scenario: OUA_TC003_SC1_Verify user details can be edited
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And searching for user and clicking edit
        And user edit page is displayed
        When user edits user details and clicks Next
        Then on clicking back user details are saved

    @Smoke
    Scenario: OUA_TC004_SC1_Verify users are exported successfully
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When I perform steps to export users file
        Then I navigate to Notification queue to verify the status of the Exported file

    @Smoke
    Scenario: OUA_TC004_SC2_Verify exported file is downloaded successfully
        Given I am in the Notification queue
        Then Verify file is downloaded successfully

    @Smoke
    Scenario: OUA_TC005_SC1_Verify users are imported successfully
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When I perform steps to import users file
        Then I navigate to Notification link to check the imported file

    @Smoke
    Scenario: OUA_TC005_SC2_Verify imported user are available on the front end
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        Then Verify user imported successfully from excel

    @Smoke
    Scenario: OUA_TC006_SC1_Create new group having full access
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And Navigate to Groups link
        When Click on Add
        And the user clicks on full access for User Administration
        Then verify full access check box is checked

    @Smoke
    Scenario: OUA_TC006_SC2_Create new group add users and save group
        Given I am in Group permissions Page
        When Click Next
        Then Add users
        Then user or group is created successfully

    @Smoke
    Scenario: OUA_TC007_SC1_Edit group
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And Navigate to Groups link
        When search for an existing Group and click edit
        Then Verify edit success message appears

    @Smoke
    Scenario: OUA_TC008_SC1_Verify all reports listed in Reports
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And I am in Reports link
        Then Verify report names

    @Smoke
    Scenario: OUA_TC008_SC2_1_Verify all report generation date
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And I am in Reports link

    @Smoke
    Scenario Outline: OUA_TC008_SC2_2_Verify all report generation date
        Then verify "<ReportName>" report generation date
        Then user navigate back to Reports grid

        Examples:
            | ReportName        |
            # | Client Mapping    |
            | Group Details     |
            | Group History     |
            # | Group Membership  |
            # | Group Permissions |
            # | User Details      |
            # | User History      |
            # | User Licenses     |
            # | User Permissions  |

    @Smoke
    Scenario: OUA_TC008_SC3_1_Verify all report header content
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And I am in Reports link

    @Smoke
    Scenario Outline: OUA_TC008_SC3_2_Verify all report header content
        Then verify "<ReportName>" report header content
        Then user navigate back to Reports grid

        Examples:
            | ReportName        |
            # | Client Mapping    |
            | Group Details     |
            # | Group History     |
            | Group Membership  |
            # | Group Permissions |
            # | User Details      |
            # | User History      |
            # | User Licenses     |
            # | User Permissions  |

    @Smoke
    Scenario: OUA_TC008_SC4_1_Verify reports being downloded in all formats HTML,CSV,Excel
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And I am in Reports link

    @Smoke
    Scenario Outline: OUA_TC008_SC4_2_Verify reports being downloded in all formats HTML,CSV,Excel
        Then verify "<ReportName>" is being downloaded in all formats
        Then user navigate back to Reports grid
        
        Examples:
            | ReportName        |
            # | Client Mapping    |
            | Group Details     |
            # | Group History     |
            | Group Membership  |
            # | Group Permissions |
            # | User Details      |
            # | User History      |
            # | User Licenses     |
            # | User Permissions  |

    @Smoke
    Scenario: OUA_TC009_SC1_Verify if Custom settings of an user can be reset
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When Search for a user to edit and click on edit "ResetUsersPermissions"
        Then User navigates to User Permissions tab
        And This user has User Administration Custom Settings is displayed
        And Verify Reset custom settings successful

    @Smoke
    Scenario: OUA_TC009_SC2_Give Full Access to user again
        Given the user is on the User Permissions page
        When the user clicks on full access for User Administration
        Then This user has User Administration Custom Settings is displayed
        And user navigate back to users grid
        And user or group is created successfully

    @Smoke
    Scenario: OUA_TC0011_SC1_Verify product permissions os an existing user
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When Search for a user to edit and click on edit "VerifyGivenProductPermissions"
        Then User navigates to User Permissions tab
        And Green dot is displayed next to User Administration

    @Smoke @alekh
    Scenario: OUA_TC0012_Create Service Account User
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When the user clicks on Add on the Users page
        And Add New Users page is displayed
        Then the user enters mandatory "Service Account" User details and clicks Next

    @Smoke @alekh
    Scenario: OUA_TC0012_SC2_Verify user is able to provide User Permission to Service Account User
        Given user is in the Client Manager page and clicks on the Next button
        And the user is on the User Permissions page
        When the user clicks on full access for User Administration
        Then This user has User Administration Custom Settings is displayed

    @Smoke @alekh
    Scenario: OUA_TC0012_SC3_Verify Service account user has been created successfully in the grid
        Given the user is on the User Permissions page
        When Click Next
        When the user clicks on the Done button
        Then user or group is created successfully

    @Smoke @alekh
    Scenario: OUA_TC0012_SC4_Delete Service Account User
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        And Searched service account user is identified
        Then Delete the service account user