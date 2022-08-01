
Feature: MySettings Scenarios

    @complete @fullreport @Smoke @UiReport
    Scenario: Launch The Application
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing username and password

    #Scenario: OneSource Logout
    #Given I am Logging to "Onesource" Application
    #When I try to login to "OneSource" by providing username and password
    #And click the logout button
    #Then verify whether the user logged out successfully

    @complete @UiReport
    Scenario: Change the backGround in the OneSource Application
        Given the user is in the dashboard
        When I select the background From the left Navigation
        Then The background should be changed

    # @complete @UiReport
    # Scenario: Switch Account Validations
    #     Given the user is in the dashboard
    #     When I switch the account to different Database
    #     Then verify the account got switched
    #     And Return to original account
    #     And verify the account switched to the main account
    #     And click on Homepage icon and validate Homepage is landed

    @complete @Smoke @fullreport @UiReport @endFeature
    Scenario: Change the language
        # Given I am in Dashboard
        Given I am in the ONESOURCE Home Page
        When User clicks MySettings button from dropdown
        And I click Language tab
        And I select "Filipino" language and submit
        Then Language should be changed and the heading is "Pumili ng lengguwahe"
        When I select "Arabic" language and submit
        Then Language should be changed and the heading is "تحديد اللغة"
        When I select "English" language and submit
        Then Language should be changed and the heading is "Select Language"

    # @complete
    # Scenario Outline: Scenario Outline name: Change the language
    #     # Given I am in Dashboard
    #     Given User navigates to ONESOURCE Home Page
    #     When I click on the MySettings button from dropdown
    #     And I click Language tab
    #     And I select "<Lingual>" language and submit
    #     Then Language should be changed and the heading is "<Header Description>"
    #     Examples:
    #        | Lingual            | Header Description    |
    #        | Filipino           | Pumili ng lengguwahe  |
    #        | English            | Select Language       |
    #        | Arabic             | تحديد اللغة          |

    @complete @endFeature @UiReport
    Scenario: Change Password
        Given the user is in the dashboard
        When I click on the MySettings button from dropdown
        And change the password for the first time
        Then Validate whether the password got changed
        And change the password for the second time
        And Validate whether the password got changed
        And change the password to original
        And Validate whether the password got changed
        And click on Homepage icon and validate Homepage is landed