Feature: Admin Reports Page

    The purpose of this feature is to test the Admin Reports Page

    @complete @Smoke @fullreport
    Scenario: User is logged-in to ONESOURCE Home Page
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully

    @complete @Smoke @fullreport @UiReport
    Scenario Outline: Verify that the User Details Reports can be opened
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on "<Header>"
        Then "<Header>" should be displayed in the header
        And User clicks on Filter
        And "<Header>" report should be generated

        Examples:
            | Header       |
            | User Details |

    @complete @UiReport
    Scenario Outline: Verify that the User Details Reports can be opened
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on "<Header>"
        Then "<Header>" should be displayed in the header
        And User clicks on Filter
        And "<Header>" report should be generated

        Examples:
            | Header            |
            | Group Details     |
            | User Permissions  |
            | User History      |
            | Group History     |
            | Group Membership  |
            | Group Permissions |

    @complete @UiReport
    Scenario Outline: Verify that the reports are generated
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When  User clicks "<Header>"
        Then "<Header>" should be displayed in the header
        And "<Header>" report should be generated

        Examples:
            | Header        |
            | User Licenses |

    @complete @Smoke @fullreport
    Scenario: Verify that the Login History Reports can be downloaded
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on Login History
        And User selects Date in the start date field and "endDate"
        And User deletes previous file
        And User clicks Download button
        Then Login History report should be downloaded
        # And Verify Login History Report is correct

    @fullreport 
    Scenario: Verify that the Login History Reports can be downloaded for 90 days
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on Login History
        And User selects Date in the "startDate" field
        # And User deletes previous file
        And User clicks Download button
        Then Login History report should be downloaded
        # And User navigates to ONESOURCE Home Page

    @fullreport 
    Scenario: Verify that the Login History Reports can be downloaded for 90 days
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on Login History
        And User selects Date in the start datefield and "userID"
        # And User deletes previous file
        And User clicks Download button
        Then Login History report should be downloaded
        # And User navigates to ONESOURCE Home Page

    @fullreport 
    Scenario: Verify that the Login History Reports can be downloaded for 90 days
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on Login History
        And User selects Date in the start datefield and UserID and "userName"
        # And User deletes previous file
        And User clicks Download button
        Then Login History report should be downloaded
    
    @fullreport
    Scenario: Verify Login History returns all the users if there are multiple users with the same name
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on Login History
        And User enters the "Tittu Achenkunju" in User Name field
        And User selects Date in the "startDate" field            
        And User clicks Download button
        Then Login History report should be downloaded
        And Verify "Username" column all values as "Tittu Achenkunju" in downloaded file

    @fullreport @endFeature
    Scenario: Verify that the Login History Reports can be downloaded for 90 days(Negative scenario)
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User clicks on Login History
        And User selects Date in the start datefield and Invalid UserID
        # And User clicks Download button
        Then User should not be able to download login history    